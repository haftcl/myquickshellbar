pragma Singleton

import QtQuick

QtObject {
    // Color Definitions
    readonly property color white: "#cad3f5"
    readonly property color black: "#000000"
    readonly property color darkGray: "#24273a"
    readonly property color purple: "#8839ef"
    readonly property color lightBlue: "#8aadf4"
    readonly property color spotifyGreen: "#34db70"
    readonly property color transparent: "transparent"

    // Dimentions
    readonly property int barHeight: 30
    readonly property int mediaMaxWidth: 300
    readonly property int iconWidth: 25

    // Spacing
    readonly property int barPadding: 2
    readonly property int barMarginTop: 2
    readonly property int barMarginBottom: 5
    readonly property int barMarginLeft: 2
    readonly property int barMarginRight: 2
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
    readonly property color fontColor: white
    readonly property color activeFontColor: darkGray

    // Component colors
    readonly property color background: darkGray
    readonly property color borderColor: transparent
    readonly property color accentBackground: lightBlue
    readonly property color hoverBackground: purple
    readonly property color leftAreaBackground: darkGray
    readonly property color centerAreaBackground: darkGray
    readonly property color rightAreaBackground: darkGray
    readonly property color workspaceBackground: black
    readonly property color systrayBackground: black
    readonly property color systrayHoverBackground: purple
    readonly property color mediaBackground: black
    readonly property color equalizerColor: spotifyGreen
    readonly property color audioBackground: black
    readonly property color micBackground: black
    readonly property color iconBackground: black
    readonly property color clockBackground: black

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
