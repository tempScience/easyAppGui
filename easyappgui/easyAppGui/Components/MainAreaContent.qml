import QtQuick 2.12
import QtQuick.Controls 2.12

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Animations 1.0 as EaAnimations

SwipeView {
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right

    clip: true
    interactive: false

    background: Rectangle {
        color: EaStyle.Colors.mainAreaBackground
        Behavior on color {
            EaAnimations.ThemeChange {}
        }
    }
}
