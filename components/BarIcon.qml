import QtQuick
import ".." as App

Text {
    color: App.Theme.fontColor
    renderType: Text.NativeRendering
    font.hintingPreference: Font.PreferFullHinting

    font {
        family: App.Theme.fontFamily
        pixelSize: App.Theme.iconSize
    }
}
