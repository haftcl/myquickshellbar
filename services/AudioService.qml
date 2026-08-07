pragma Singleton

import QtQuick
import Quickshell.Services.Pipewire

QtObject {
    id: root
    readonly property PwNode output: Pipewire.defaultAudioSink
    readonly property PwNode input: Pipewire.defaultAudioSource

    readonly property PwObjectTracker outputTracker: PwObjectTracker {
        objects: [root.output]
    }

    readonly property PwObjectTracker inputTracker: PwObjectTracker {
        objects: [root.input]
    }

    // Outputs
    function outputVolume() {
        if (output.audio.muted) {
            return "--%";
        }

        return String(Math.round(output.audio.volume * 100)).padStart(2, "0") + "%";
    }

    function volumeUp(step = 0.05) {
        output.audio.volume += step;
    }

    function volumeDown(step = 0.05) {
        output.audio.volume -= step;
    }

    function toggleMute() {
        output.audio.muted = !output.audio.muted;
    }

    // Inputs
    function micVolume() {
        if (input.audio.muted) {
            return "--%";
        }

        return String(Math.round(input.audio.volume * 100)).padStart(2, "0") + "%";
    }

    function toggleMicMute() {
        input.audio.muted = !input.audio.muted;
    }

    function volumeMicUp(step = 0.05) {
        input.audio.volume += step;
    }

    function volumeMicDown(step = 0.05) {
        input.audio.volume -= step;
    }
}
