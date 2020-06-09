import QtQuick 2.14
//import QtQuick.Window 2.14
//import QtQuick.Controls 2.14

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

EaElements.ApplicationWindow {
    id: appWindow

    //property alias appBarTabs: appBar.data
    //property alias contentArea: contentAreaContainer.data
    //property alias statusBar: statusBarContainer.data

    property alias appBarLeftButtons: appBarLeftButtons.data
    property alias appBarCentralTabs: appBarCentralTabs.contentData
    property alias appBarRightButtons: appBarRightButtons.data

    property alias contentArea: contentArea.contentData

    // Application bar container
    Rectangle {
        id: appBar

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: EaStyle.Sizes.appBarHeight

        EaComponents.AppBarLeftButtons {
            id: appBarLeftButtons

            anchors.left: appBar.left
        }

        EaComponents.AppBarCentralTabs {
            id: appBarCentralTabs

            anchors.horizontalCenter: appBar.horizontalCenter

            currentIndex: EaGlobals.Variables.appBarCurrentIndex
            onCurrentIndexChanged: EaGlobals.Variables.appBarCurrentIndex = currentIndex
        }

        EaComponents.AppBarRightButtons {
            id: appBarRightButtons

            anchors.right: appBar.right
        }

        color: "orange"
    }

    // Content area container
    EaComponents.PagesView {
        id: contentArea

        anchors.top: appBar.bottom
        anchors.bottom: statusBarContainer.top
        anchors.left: parent.left
        anchors.right: parent.right

        currentIndex: appBarCentralTabs.currentIndex
    }

    // Status bar container
    Item {
        id: statusBarContainer

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: EaStyle.Sizes.statusBarHeight

        EaComponents.StatusBar {
            id: statusBar

            anchors.fill: parent
        }
    }

    // Application dialogs (invisible at the beginning)
    EaComponents.PreferencesDialog {
        x: (parent.width - width) * 0.5
        y: (parent.height - height) * 0.5
    }

}
