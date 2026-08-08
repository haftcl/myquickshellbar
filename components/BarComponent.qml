import QtQuick
import ".." as App

Rectangle {
    required property Area area

    color: "transparent"
    radius: App.Theme.areaRadius
    implicitHeight: calculateHeight(App.Theme.barHeight)

    function calculateHeight(height) {
        return height - (App.Theme.barPadding * 2);
    }

    function calculateWidth(width) {
        return width + (App.Theme.componentPadding * 2);
    }
}
