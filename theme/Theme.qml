pragma Singleton

import QtQuick

QtObject {
    // Sizes
    readonly property int barHeight: 25
    readonly property int barRadius: 7
    readonly property int barMarginTop: 3
    readonly property int barMarginBottom: 5
    readonly property int barMarginLeft: 2
    readonly property int barMarginRight: 2

    // Backgrounds
    // readonly property color borderColor: "#313244"
    readonly property color borderColor: "transparent"
    readonly property color background: "transparent"
    readonly property color accentBackground: "#89b4fa"
    readonly property color hoverBackground: "#b4befe"
    readonly property color workspaceBackground: "transparent"
    readonly property color systrayBackground: "#181825"
    readonly property color systrayHoverBackground: "#281825"

    readonly property int workspaceIconRadius: 10

    // Font color
    readonly property color fontColor: "#cdd6f4"
    readonly property color hoverFontColor: "#b4befe"
    readonly property color activeFontColor: "#1e1e2e"

    readonly property string fontFamily: "Ubuntu Nerd Font Propo"
    readonly property int fontSize: 10
    readonly property int iconSize: 11

    readonly property color leftAreaBackground: "#313244"
    readonly property color centerAreaBackground: "#313244"
    readonly property color rightAreaBackground: "#313244"
    readonly property int areaRadius: 10
    readonly property var iconMap: ({
            "1": "󰖟",
            "1ide": "",
            "1job": "",
            "thunderbird": "",
            "work_browser": "󰖠",
            "2debug": "",
            "nvim": "",
            "youtube": "",
            "term": "",
            "whatsapp": "",
            "discord": "",
            "8": "",
            "9": "",
            "default": ""
        })
}
