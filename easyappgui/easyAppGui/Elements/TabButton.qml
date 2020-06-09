import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Animations 1.0 as EaAnimations
import easyAppGui.Elements 1.0 as EaElements

T.TabButton {
    id: control

    property var iconFontFamily: EaStyle.Fonts.iconsFamily
    property var iconFontPixelSize: font.pixelSize * 1.25
    property string fontIcon: ""

    property color textColor: !enabled ?
                                  EaStyle.Colors.themeForegroundDisabled :
                                  checked || down ?
                                      EaStyle.Colors.themeAccent :
                                      EaStyle.Colors.themeForeground
    //property color backgroundColor: value


    width: implicitContentWidth + leftPadding + rightPadding
    height: 40//parent.height

    implicitHeight: Math.max(implicitContentHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitContentWidth + leftPadding + rightPadding)

    topPadding: 0
    bottomPadding: 0
    leftPadding: EaStyle.Fonts.fontPixelSize * 0.5
    rightPadding: EaStyle.Fonts.fontPixelSize * 0.5
    spacing: EaStyle.Fonts.fontPixelSize * 0.5

    font.family: EaStyle.Fonts.fontFamily
    font.pixelSize: EaStyle.Fonts.fontPixelSize

    //ToolTip.visible: hovered && ToolTip.text !== ""

    EaElements.ToolTip {
        //parent: control
        text: control.ToolTip.text
        visible: control.hovered && text !== ""
    }


    // Icon with text label
    contentItem: Row {
        spacing: control.spacing

        // Icon
        Label {
            height: control.height
            verticalAlignment: Text.AlignVCenter

            font.family: iconFontFamily
            font.pixelSize: iconFontPixelSize

            text: control.fontIcon

            color: control.textColor
            Behavior on color {
                EaAnimations.ThemeChange {}
            }
        }

        // Text label
        Label {
            height: control.height
            verticalAlignment: Text.AlignVCenter

            font.family: control.font.family
            font.pixelSize: control.font.pixelSize

            text: control.text

            color: control.textColor
            Behavior on color {
                EaAnimations.ThemeChange {}
            }
        }
    }

    // Background
    background: Rectangle {
        implicitHeight: 50
        color: rippleArea.containsMouse ?
                   (rippleArea.containsPress ?
                        EaStyle.Colors.appBarButtonBackgroundPressed :
                        EaStyle.Colors.appBarButtonBackgroundHovered) :
                    EaStyle.Colors.appBarButtonBackground
        Behavior on color {
            PropertyAnimation {
                duration: rippleArea.containsMouse ? 500 : 0 //Globals.Variables.themeChangeTime
                alwaysRunToEnd: true
                easing.type: Easing.OutCubic
            }
        }

        MouseArea {
            id: rippleArea
            anchors.fill: parent
            hoverEnabled: true
            onPressed: mouse.accepted = false
        }
    }
}
