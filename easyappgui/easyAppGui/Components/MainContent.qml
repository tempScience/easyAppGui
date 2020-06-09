import QtQuick 2.14
import QtQuick.Controls 2.14

Item {
    id: mainArea

    property alias tabs: tabs.contentData
    property alias items: items.contentData

    anchors.fill: parent

    TabBar {
        id: tabs

        anchors.top: mainArea.top
        anchors.left: mainArea.left
        anchors.right: mainArea.right
    }

    SwipeView {
        id: items

        anchors.top: tabs.bottom
        anchors.bottom: mainArea.bottom
        anchors.left: mainArea.left
        anchors.right: mainArea.right

        currentIndex: tabs.currentIndex
    }

}
