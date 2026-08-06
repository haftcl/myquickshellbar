import QtQuick.Layouts
import QtQuick
import "../theme"

Rectangle {
    id: root
    radius: Theme.barRadius
    width: row.implicitWidth + Theme.areaLeftRightPadding
    height: Theme.barHeight

    // --- KEY CONCEPT ---
    // Making this default aliases any child items declared inside Area { ... }
    // directly into internalColumn.data
    default property alias content: row.data

    RowLayout {
        id: row
        spacing: Theme.componentsSpacing
        anchors.centerIn: parent
    }
}
