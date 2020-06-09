import QtQuick 2.13
import QtQuick.Controls 2.13

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Animations 1.0 as EaAnimations
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

Item {
    id: mainArea

    property alias tabs: tabs.contentData
    property alias content: content.data

    anchors.fill: parent

    EaComponents.MainAreaTabs {
        id: tabs

        anchors.top: mainArea.top
        anchors.left: mainArea.left
        anchors.right: mainArea.right
    }

    EaComponents.MainAreaContent {
        id: content

        anchors.top: tabs.bottom
        anchors.bottom: mainArea.bottom
        anchors.left: mainArea.left
        anchors.right: mainArea.right

        currentIndex: tabs.currentIndex
    }

}

