/*
 * Simple battery widget
 *
 * Copyright (C) 2012 Jolla Ltd.
 * Contact: Denis Zalevskiy <denis.zalevskiy@jollamobile.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA
 * 
 * http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html
 */

import Qt 4.7
import QtQuick 1.1

Item {

    id: self
    property int percentage: 0

    property bool isCharging: false
    property bool isOnline: false
    property bool isFull: false
    property bool isChargerConnected: false

    property int animationPeriod: 2000
    property bool isShowText: true
    property color bgColor: "black"
    property color fgColor: "white"

    function levelColor(percentage) {
        var red =  (100.0 - percentage) / 50.0;
        var green = Math.min(1.0, percentage / 50.0);
        var blue = percentage / 200.0;
        return Qt.rgba(red, green, blue, 0xff)
    }
    SequentialAnimation on barColor {
        id: chargingAni
        loops: Animation.Infinite
        running: isCharging
        ColorAnimation {
            id: upAni
            from: levelColor(self.percentage)
            to: "white"
            duration: self.animationPeriod * 3 / 4
            easing { type: Easing.InOutQuad }
        }
        ColorAnimation {
            id: downAni
            from: "white"
            to: levelColor(self.percentage)
            duration: self.animationPeriod / 4
            easing { type: Easing.InOutQuad }
        }
    }
    onPercentageChanged: {
        if (!isCharging) {
            console.log("pe", percentage)
            barColor = levelColor(self.percentage);
        } else {
            upAni.from = downAni.to = levelColor(self.percentage);
            // just restart because percentage is changing slowly
            chargingAni.restart()
        }
    }
    property color barColor : "black"

    property color textColor: fgColor
    property color outlineColor: bgColor

    property int optimalMargin: Math.max(1,
                                         Math.min(self.height / 16,
                                                  self.width / 16))

    Rectangle {
        color: self.bgColor
        anchors {
            fill: parent
            topMargin: self.optimalMargin
            bottomMargin: self.optimalMargin
            leftMargin: self.optimalMargin
            rightMargin: self.optimalMargin
        }

        Rectangle {
            id: tip
            color: self.fgColor
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: self.optimalMargin
            }
            height: self.height / 4
            width: height / 4
        }
        Rectangle {
            color: self.fgColor
            anchors {
                left: tip.right
                right: parent.right
                rightMargin: self.optimalMargin
                top: parent.top
                bottom: parent.bottom
                topMargin: self.optimalMargin
                bottomMargin: self.optimalMargin
            }
            Rectangle {
                color: self.bgColor
                anchors {
                    fill: parent
                    leftMargin: self.optimalMargin
                    rightMargin: self.optimalMargin
                    topMargin: self.optimalMargin
                    bottomMargin: self.optimalMargin
                }
                Rectangle {
                    id: level
                    color: self.barColor
                    property int rightSide: self.optimalMargin
                    property int maxW: parent.width
                        - self.optimalMargin - rightSide
                    anchors {
                        right: parent.right
                        top: parent.top
                        bottom: parent.bottom
                        rightMargin: rightSide
                        topMargin: self.optimalMargin
                        bottomMargin: self.optimalMargin
                    }
                    width: maxW * self.percentage / 100
                }
                Text {
                    visible: self.isShowText
                    id: textPercent
                    style: Text.Outline
                    styleColor: self.outlineColor
                    text: "" + self.percentage + "%"
                    color: self.textColor
                    font.pixelSize: self.height / 4
                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }
                }

            }
        }
    }
}

