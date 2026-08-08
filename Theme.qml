pragma Singleton

import QtQuick

QtObject {
    // Sizes
    readonly property int barHeight: 25
    readonly property int barRadius: 7
    readonly property int barMarginTop: 3
    readonly property int barMarginBottom: 5
    readonly property int barMarginLeft: 0
    readonly property int barMarginRight: 0
    readonly property int barPadding: 1
    readonly property int areaLeftRightPadding: 10
    readonly property int componentSpacing: 10
    readonly property int componentPadding: 10
    readonly property int mediaMaxWidth: 285

    // Backgrounds
    readonly property color borderColor: "transparent"
    readonly property color background: "transparent"
    readonly property color accentBackground: "#89b4fa"
    readonly property color hoverBackground: "#b4befe"
    readonly property color workspaceBackground: "transparent"
    readonly property color systrayBackground: "#000000"
    readonly property color systrayHoverBackground: "#281825"
    readonly property color mediaBackground: "#000000"

    // Font color
    readonly property color fontColor: "#cdd6f4"
    readonly property color hoverFontColor: "#b4befe"
    readonly property color activeFontColor: "#1e1e2e"

    readonly property string fontFamily: "Ubuntu Nerd Font Propo"
    readonly property int fontSize: 12
    readonly property int iconSize: 15
    readonly property int iconWidth: 25
    readonly property int iconSpacing: 5

    readonly property color leftAreaBackground: "#181825"
    readonly property color centerAreaBackground: "#181825"
    readonly property color rightAreaBackground: "#181825"
    readonly property int areaRadius: 10
    readonly property int animationDuration: 200


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
            "term": "",
            "whatsapp": "",
            "discord": "",
            "8": "",
            "9": "",
            "default": ""
        })

    readonly property string dateFormat: "MMMM dd HH:mm"
}
