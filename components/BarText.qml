import QtQuick
import ".." as App

Text {
    color: App.Theme.fontColor
    renderType: Text.NativeRendering
    font.hintingPreference: Font.PreferFullHinting
    antialiasing: true

    Behavior on color {
        ColorAnimation {
            duration: App.Theme.animationDuration
        }
    }

    font {
        family: App.Theme.fontFamily
        pixelSize: App.Theme.fontSize
        weight: Font.Medium
    }
}
