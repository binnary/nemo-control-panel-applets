import QtQuick 1.1

Rectangle {
    color: "black"
    property string orientation: "portrait"
    width: (orientation == "portrait" ? 480 : 800)
    height: (orientation == "portrait" ? 800 : 480)
}
