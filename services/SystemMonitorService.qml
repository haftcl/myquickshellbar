pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {
    id: root

    property int cpuPercent: 0
    property int ramPercent: 0
    property int gpuPercent: 0
    property int cpuTempCelsius: 0

    property real _prevIdle: -1
    property real _prevTotal: -1

    property Process queryStats: Process {
        command: ["sh", "-c", "cat /proc/stat | head -n1; echo '---'; grep -E 'MemTotal|MemAvailable' /proc/meminfo; echo '---'; cat /sys/class/drm/card*/device/gpu_busy_percent 2>/dev/null | head -n1; echo '---'; for hw in /sys/class/hwmon/hwmon*; do n=$(cat $hw/name 2>/dev/null); if [ $n = k10temp ] || [ $n = coretemp ]; then cat $hw/temp1_input; break; fi; done"]

        stdout: StdioCollector {
            onStreamFinished: {
                const parts = text.trim().split("---").map(p => p.trim());

                // CPU: cpu user nice system idle iowait irq softirq steal ...
                const cpuFields = parts[0].split(/\s+/).slice(1).map(Number);
                const [user, nice, system, idle, iowait, irq, softirq, steal] = cpuFields;
                const idleTime = idle + iowait;
                const nonIdle = user + nice + system + irq + softirq + steal;
                const total = idleTime + nonIdle;

                if (root._prevTotal >= 0) {
                    const totalDelta = total - root._prevTotal;
                    const idleDelta = idleTime - root._prevIdle;
                    if (totalDelta > 0) {
                        root.cpuPercent = Math.round(((totalDelta - idleDelta) / totalDelta) * 100);
                    }
                }
                root._prevTotal = total;
                root._prevIdle = idleTime;

                // RAM
                let memTotal = 0;
                let memAvailable = 0;
                for (const line of parts[1].split("\n")) {
                    const match = line.match(/(\w+):\s+(\d+)/);
                    if (!match)
                        continue;

                    if (match[1] === "MemTotal")
                        memTotal = parseInt(match[2]);

                    if (match[1] === "MemAvailable")
                        memAvailable = parseInt(match[2]);
                }
                if (memTotal > 0) {
                    root.ramPercent = Math.round(((memTotal - memAvailable) / memTotal) * 100);
                }

                // GPU
                const gpuValue = parseInt(parts[2]);
                root.gpuPercent = isNaN(gpuValue) ? 0 : gpuValue;

                // CPU temperature (millidegrees Celsius)
                const tempValue = parseInt(parts[3]);
                root.cpuTempCelsius = isNaN(tempValue) ? 0 : Math.round(tempValue / 1000);
            }
        }
    }

    property Timer statsTimer: Timer {
        interval: 2000
        repeat: true
        running: true
        triggeredOnStart: true

        onTriggered: root.queryStats.running = true
    }
}
