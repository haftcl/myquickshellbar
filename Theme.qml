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
    readonly property int barPadding: 2
    readonly property int areaLeftRightPadding: 20
    readonly property int componentsSpacing: 10
    readonly property int mediaMaxWidth: 285

    // Backgrounds
    // readonly property color borderColor: "#313244"
    readonly property color borderColor: "transparent"
    readonly property color background: "transparent"
    readonly property color accentBackground: "#89b4fa"
    readonly property color hoverBackground: "#b4befe"
    readonly property color workspaceBackground: "transparent"
    readonly property color systrayBackground: "#6D5DC8"
    readonly property color systrayHoverBackground: "#281825"
    readonly property color mediaBackground: "transparent"

    // Font color
    readonly property color fontColor: "#cdd6f4"
    readonly property color hoverFontColor: "#b4befe"
    readonly property color activeFontColor: "#1e1e2e"

    readonly property string fontFamily: "Ubuntu Nerd Font Propo"
    readonly property int fontSize: 12
    readonly property int iconSize: 13
    readonly property int iconWidth: 25
    readonly property int iconSpacing: 5

    readonly property color leftAreaBackground: "#181825"
    readonly property color centerAreaBackground: "#181825"
    readonly property color rightAreaBackground: "#181825"
    readonly property int areaRadius: 10
    readonly property int animationDuration: 200


    readonly property string playIcon: "\uf04b"
    readonly property string pauseIcon: "\uf04c"
    readonly property string stopIcon: "\uf04d"
    readonly property string clockIcon: "\uf017"
    readonly property string idleInhibitorOnIcon: "\udb81\udcb3"
    readonly property string idleInhibitorOffIcon: "\udb81\udcb2"
    readonly property var workspacesIconMap: ({
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

    readonly property string dateFormat: "MMMM dd HH:mm"
}
