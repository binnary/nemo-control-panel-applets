import QtQuick 1.1

Item {
    property string key: ""
    onKeyChanged: updateStdValue()
    function updateStdValue() {
        console.log("key", key)
        switch (key) {
        case "Battery.IsCharging":
            value = true;
            break;
        case "Battery.ChargePercentage":
            value = 30;
            break;
        case "Battery.OnBattery":
            value = false;
        }
    }
    Component.onCompleted: updateStdValue()
    property variant value: undefined
}
