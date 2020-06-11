import QtQuick 2.13
//import QtQuick.Window 2.13
//import QtQuick.Controls 2.13

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Globals 1.0 as EaGlobals
import easyAppGui.Animations 1.0 as EaAnimations
import easyAppGui.Elements 1.0 as EaElements
import easyAppGui.Components 1.0 as EaComponents

EaElements.ApplicationWindow {
    id: appWindow

    property alias appBarLeftButtons: appBarLeftButtons.data
    property alias appBarCentralTabs: appBarCentralTabs.contentData
    property alias appBarRightButtons: appBarRightButtons.data

    property alias contentArea: contentArea.contentData

    property alias statusBar: statusBarContainer.data

    ////////////////
    // App container
    ////////////////

    Item {
        id: appContainer

        anchors.fill: parent

        // Application bar container
        Rectangle {
            id: appBar

            anchors.top: appContainer.top
            anchors.left: appContainer.left
            anchors.right: appContainer.right
            height: EaStyle.Sizes.appBarHeight

            color: EaStyle.Colors.appBarBackground //"coral"

            // tabs bottom border
            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                height: EaStyle.Sizes.borderThickness
                color: EaStyle.Colors.appBorder
                Behavior on color {
                    EaAnimations.ThemeChange {}
                }
            }

            EaComponents.AppBarLeftButtons {
                id: appBarLeftButtons

                anchors.verticalCenter: appBar.verticalCenter
                anchors.left: appBar.left
                anchors.leftMargin: 10
            }

            EaComponents.AppBarCentralTabs {
                id: appBarCentralTabs

                anchors.verticalCenter: appBar.verticalCenter
                anchors.horizontalCenter: appBar.horizontalCenter

                currentIndex: EaGlobals.Variables.appBarCurrentIndex
                onCurrentIndexChanged: EaGlobals.Variables.appBarCurrentIndex = currentIndex
            }

            EaComponents.AppBarRightButtons {
                id: appBarRightButtons

                anchors.verticalCenter: appBar.verticalCenter
                anchors.right: appBar.right
                anchors.rightMargin: 10
            }
        }

        // Content area container
        EaComponents.ContentArea {
            id: contentArea

            anchors.top: appBar.bottom
            anchors.bottom: statusBarContainer.top
            anchors.left: appContainer.left
            anchors.right: appContainer.right

            currentIndex: appBarCentralTabs.currentIndex
        }

        // Status bar container
        Item {
            id: statusBarContainer

            anchors.bottom: appContainer.bottom
            anchors.left: appContainer.left
            anchors.right: appContainer.right
            height: EaStyle.Sizes.statusBarHeight
        }
    }

    ///////////////
    // Init dialogs
    ///////////////

    // Application dialogs (invisible at the beginning)
    EaComponents.PreferencesDialog {
        x: (parent.width - width) * 0.5
        y: (parent.height - height) * 0.5
    }

}
