import QtQuick.Layouts
import QtQuick
import ".." as App

Rectangle {
    id: root
    radius: App.Theme.barRadius
    width: row.implicitWidth + App.Theme.areaLeftRightPadding
    height: App.Theme.barHeight

    // --- KEY CONCEPT ---
    // Making this default aliases any child items declared inside Area { ... }
    // directly into internalColumn.data
    default property alias content: row.data

    RowLayout {
        id: row
        spacing: App.Theme.componentsSpacing
        anchors.centerIn: parent
    }
}
