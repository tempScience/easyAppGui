import QtQuick 2.14
import QtCharts 2.14

import easyAppGui.Style 1.0 as EaStyle
import easyAppGui.Animations 1.0 as EaAnimations

ChartView {
    id: chart

    margins.top: 0
    margins.bottom: 0
    margins.left: 0
    margins.right: 0

    antialiasing: true

    //theme: Globals.Colors.chartTheme
    animationDuration: Globals.Variables.chartAnimationDuration
    animationOptions: ChartView.SeriesAnimations

    legend.visible: false
    legend.alignment: Qt.AlignBottom
    legend.font.family: EaStyle.Fonts.fontFamily
    legend.font.pixelSize: EaStyle.Fonts.fontPixelSize
    legend.markerShape: Legend.MarkerShapeRectangle
    legend.labelColor: EaStyle.Colors.chartForeground
    Behavior on legend.labelColor {
        EaAnimations.ThemeChange {}
    }

    backgroundRoundness: 0
    backgroundColor: EaStyle.Colors.chartBackground
    Behavior on backgroundColor {
        EaAnimations.ThemeChange {}
    }

    titleFont.family: EaStyle.Fonts.fontFamily
    titleFont.pixelSize: EaStyle.Fonts.fontPixelSize
    titleFont.bold: true
    titleColor: EaStyle.Colors.chartForeground
    /* BREAKS ANIMATION !
    Behavior on titleColor {
        Animations.ThemeChange {}
    }
    */

    plotAreaColor: EaStyle.Colors.chartPlotAreaBackground
    Behavior on plotAreaColor {
        EaAnimations.ThemeChange {}
    }

    // Plot axes rect
    /*
    Rectangle {
        x: plotArea.x
        y: plotArea.y
        height: 1
        width: plotArea.width

        visible: false

        //opacity: chart.opacity

        color: Globals.Colors.appBorder
        Behavior on color {
            Animations.ThemeChange {}
        }
    }
    Rectangle {
        x: plotArea.x
        y: plotArea.y + plotArea.height
        height: 1
        width: plotArea.width

        visible: false

        //opacity: chart.opacity

        color: Globals.Colors.appBorder
        Behavior on color {
            Animations.ThemeChange {}
        }
    }
    Rectangle {
        x: plotArea.x
        y: plotArea.y
        height: plotArea.height
        width: 1

        visible: false

        //opacity: chart.opacity

        color: Globals.Colors.appBorder
        Behavior on color {
            Animations.ThemeChange {}
        }
    }
    Rectangle {
        y: plotArea.y
        x: plotArea.x + plotArea.width
        height: plotArea.height
        width: 1

        visible: false

        //opacity: chart.opacity

        color: Globals.Colors.appBorder
        Behavior on color {
            Animations.ThemeChange {}
        }
    }
    */
}
