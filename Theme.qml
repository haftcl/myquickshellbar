pragma Singleton

import QtQuick

QtObject {
    // Dimentions
    readonly property int barHeight: 30
    readonly property int mediaMaxWidth: 300
    readonly property int iconWidth: 25

    // Spacing
    readonly property int barPadding: 2
    readonly property int barMarginTop: 3
    readonly property int barMarginBottom: 5
    readonly property int barMarginLeft: 3
    readonly property int barMarginRight: 3
    readonly property int areaLeftRightPadding: 10
    readonly property int componentSpacing: 5
    readonly property int componentPadding: 10
    readonly property int iconSpacing: 3

    // Radius
    readonly property int barRadius: 7
    readonly property int areaRadius: 10
    readonly property int iconRadius: 20

    // Animations
    readonly property int animationDuration: 200

    // Fonts
    readonly property string fontFamily: "Ubuntu Nerd Font Propo"
    readonly property int fontSize: 12
    readonly property int iconSize: 15
    readonly property color fontColor: "#cad3f5"
    readonly property color activeFontColor: "#181926"

    // Colors
    readonly property color background: "#313244"
    readonly property color borderColor: "transparent"
    readonly property color accentBackground: "#89b4fa"
    readonly property color hoverBackground: "#8839ef"
    readonly property color leftAreaBackground: "#313244"
    readonly property color centerAreaBackground: "#313244"
    readonly property color rightAreaBackground: "#313244"
    readonly property color workspaceBackground: "#000000"
    readonly property color systrayBackground: "#000000"
    readonly property color systrayHoverBackground: "#8839ef"
    readonly property color mediaBackground: "#000000"
    readonly property color equalizerColor: "#34DB70"
    readonly property color audioBackground: "#000000"
    readonly property color micBackground: "#000000"
    readonly property color iconBackground: "#000000"
    readonly property color clockBackground: "transparent"

    // Icons
    readonly property string backlightFullIcon: "󰃠"
    readonly property string backlightMediumIcon: "󰃟"
    readonly property string backlightLowIcon: "󰃞"
    readonly property string powerProfilePerformanceIcon: "󱐋"
    readonly property string powerProfileBalancedIcon: "󰾅"
    readonly property string powerProfilePowerSaverIcon: "󰂎"
    readonly property string volumeHighIcon: ""
    readonly property string volumeLowIcon: ""
    readonly property string volumeIcon: ""
    readonly property string muteIcon: "󰖁"
    readonly property string volumeMicIcon: ""
    readonly property string muteMicIcon: ""
    readonly property string playIcon: ""
    readonly property string pauseIcon: ""
    readonly property string stopIcon: ""
    readonly property string clockIcon: ""
    readonly property string dndOnIcon: ""
    readonly property string dndOffIcon: "󰵙"
    readonly property string idleInhibitorOnIcon: "󰒳"
    readonly property string idleInhibitorOffIcon: "󰒲"
    readonly property var workspacesIconMap: ({
            "1": "󰖟",
            "1ide": "",
            "1job": "",
            "thunderbird": "",
            "work_browser": "󰖠",
            "2debug": "",
            "nvim": "",
            "youtube": "",
            "term": "",
            "whatsapp": "",
            "discord": "",
            "8": "",
            "9": "",
            "default": ""
        })

    readonly property string dateFormat: "MMMM dd HH:mm"
}
