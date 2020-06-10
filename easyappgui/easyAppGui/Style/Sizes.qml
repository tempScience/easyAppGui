pragma Singleton

import QtQuick 2.13
import QtQuick.Window 2.13

QtObject {

    // Application window
    property int appWindowHeightVerySmall: scalePx(300)
    property int appWindowHeightMedium: scalePx(400)
    property int appWindowHeightLarge: scalePx(460)

    property int appWindowWidthVerySmall: scalePx(300)  // 1 combobox in appBar
    property int appWindowWidthSmall: scalePx(380)      // 2 comboboxes in appBar
    property int appWindowWidthMedium: scalePx(500)     // 3 comboboxes in appBar
    property int appWindowWidthLarge: scalePx(620)      // 4 comboboxes in appBar
    property int appWindowWidthVeryLarge: scalePx(880)  // 4 comboboxes with labels in appBar

    property int appWindowMinimumWidth: appWindowWidthMedium
    property int appWindowMinimumHeight: appWindowHeightMedium

    property int appWindowWidth: Qt.platform.pluginName === "wasm" ? Screen.width : Math.min(appWindowWidthVeryLarge, Screen.width)
    property int appWindowHeight: Qt.platform.pluginName === "wasm" ? Screen.height : Math.min(appWindowHeightLarge, Screen.height)

    property int appWindowX: Qt.platform.pluginName === "wasm" ? 0 : (Screen.width - appWindowWidth) * 0.5
    property int appWindowY: Qt.platform.pluginName === "wasm" ? 0 : (Screen.height - appWindowHeight) * 0.5

    // Application bar
    property int appBarHeight: Math.round(fontPixelSize * 3.5)
    property int appBarSpacing: fontPixelSize

    // Sidebar
    readonly property int sideBarWidth: 450
    readonly property int groupBoxSpacing: 12

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
