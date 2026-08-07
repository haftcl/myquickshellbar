import QtQuick.Layouts
import QtQuick
import ".." as App

Rectangle {
    id: root
    radius: App.Theme.barRadius
    implicitWidth: row.implicitWidth + App.Theme.areaLeftRightPadding
    implicitHeight: App.Theme.barHeight

    // --- KEY CONCEPT ---
    // Making this default aliases any child items declared inside Area { ... }
    // directly into internalColumn.data
    default property alias content: row.data

    RowLayout {
        id: row
        spacing: App.Theme.componentSpacing
        anchors.centerIn: parent
    }
}
