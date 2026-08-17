pragma Singleton

import QtQuick

QtObject {
    property bool idleInhibited: false
    property bool barVisible: true
    readonly property string laptopScreen: "eDP-1"
}
