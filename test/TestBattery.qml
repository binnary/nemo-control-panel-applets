import QtQuick 1.1
import org.nemomobile.controlpanel 1.0

Rectangle {
    color: "navy"
    width: 320 * 2
    height: 200 * 4
    Flow {
        anchors { fill: parent }
        Battery {
            width: 320
            height: 200
            percentage: 3
        }
        Battery {
            width: 320
            height: 200
            percentage: 50
        }
        Battery {
            width: 320
            height: 200
            percentage: 98
        }
        Battery {
            width: 320
            height: 200
            percentage: 50
            PropertyAnimation on percentage {
                from: 0
                to: 100
                duration: 5000
            }
        }
        Battery {
            width: 320
            height: 200
            percentage: 30
            isCharging: true
        }
        Battery {
            id: bac
            width: 320
            height: 200
            percentage: 50
            isCharging: true
            PropertyAnimation on percentage {
                from: 0
                to: 100
                duration: 90 * 1000
                onRunningChanged : {
                    bac.isCharging = running;
                }
            }
        }
    }
}
