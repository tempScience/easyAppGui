pragma Singleton

import QtQuick 2.13
import QtQuick.Window 2.13

QtObject {

    // Application window
    property int appWindowWidthVGA: scalePx(640)
    property int appWindowWidthSVGA: scalePx(800)
    property int appWindowWidthXGA: scalePx(1024)
    property int appWindowWidthWXGA: scalePx(1280)

    property int appWindowHeightVGA: scalePx(480)
    property int appWindowHeightSVGA: scalePx(600)
    property int appWindowHeightXGA: scalePx(768)
    property int appWindowHeightWXGA: scalePx(800)

    property int appWindowMinimumWidth: appWindowWidthXGA
    property int appWindowMinimumHeight: appWindowHeightSVGA

    property int appWindowWidth: Qt.platform.pluginName === "wasm" ? Screen.width : Math.min(appWindowMinimumWidth, Screen.width)
    property int appWindowHeight: Qt.platform.pluginName === "wasm" ? Screen.height : Math.min(appWindowMinimumHeight, Screen.height)

    property int appWindowX: Qt.platform.pluginName === "wasm" ? 0 : (Screen.width - appWindowWidth) * 0.5
    property int appWindowY: Qt.platform.pluginName === "wasm" ? 0 : (Screen.height - appWindowHeight) * 0.5

    // Application bar
    property int appBarHeight: Math.round(fontPixelSize * 3.5)
    property int appBarSpacing: fontPixelSize

    // Sidebar
    readonly property int sideBarWidth: 450
    property int groupBoxSpacing: fontPixelSize
    property int sideBarPadding: fontPixelSize
    property int sideBarButtonHeight: Math.round(fontPixelSize * 2.5)
    property int sideBarButtonWidth: sideBarWidth

    // Status bar
    property int statusBarHeight: Math.round(fontPixelSize * 2)
    property int statusBarSpacing: fontPixelSize

    // Tabbar
    property int tabBarHeight: Math.round(fontPixelSize * 2.0)

    // Dialogs
    property int dialogElevation: Math.round(fontPixelSize * 2)

    // ComboBox
    property int comboBoxHeight: Math.round(fontPixelSize * 2.5)

    // Buttons
    property int buttonHeight: Math.round(fontPixelSize * 2.0)
    property int toolButtonHeight: Math.round(fontPixelSize * 2.5)

    // Touch
    property int touchSize: Math.round(fontPixelSize * 2.0)

    // Fonts
    property int fontPixelSize: scalePx(14) //scalePx(Qt.application.font.pixelSize)

    // Scales
    property int defaultScale: 100

    // Border
    readonly property int borderThickness: 1

    // Tooltips
    property int tooltipHeight: Math.round(fontPixelSize * 2)

    // Functions
    function scalePx(size) {
        return Math.round(size * (defaultScale / 100))
    }
}
