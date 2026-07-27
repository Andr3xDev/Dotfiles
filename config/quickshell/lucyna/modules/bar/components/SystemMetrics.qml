import QtQuick
import QtQuick.Layouts
import "../../../core/theme" as Theme
import "../../../core/services" as Services
import "../../../core/components"
import "../layout"

/*!
    Group of circular indicators showing CPU, GPU, RAM and disk usage.
*/
ExpandableRow {
    id: root

    readonly property real metricSize:      20
    readonly property real metricLineWidth: 1.5

    RowLayout {
        id: metricsRow
        anchors.centerIn: parent
        spacing: 2  // ponytail: intentionally a raw literal, mirrors the known-good reference implementation exactly — do not migrate to a spacing token, a prior token migration here caused a real layout-shift bug (session-confirmed)
        opacity: root.expanded ? 1 : 0

        Behavior on opacity {
            NumberAnimation { duration: Theme.ThemeManager.motion.duration.standard }
        }

        CircularMetric {
            value: Services.MetricsService.cpuUsage
            icon: "󰍛"
            size: root.metricSize
            lineWidth: root.metricLineWidth
        }

        CircularMetric {
            value: Services.MetricsService.gpuUsage
            icon: "󰢮"
            size: root.metricSize
            lineWidth: root.metricLineWidth
        }

        CircularMetric {
            value: Services.MetricsService.ramUsage
            icon: "󰍜"
            size: root.metricSize
            lineWidth: root.metricLineWidth
        }

        CircularMetric {
            value: Services.MetricsService.diskUsage
            icon: "󰋊"
            size: root.metricSize
            lineWidth: root.metricLineWidth
        }
    }
}
