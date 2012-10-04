/*
 * Power information page: control panel applet
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
import com.nokia.meego 1.0
import com.nokia.controlpanel 0.1
import org.freedesktop.contextkit 1.0
import org.nemomobile.controlpanel 1.0

Page {
    id: self
    ContextProperty {
        key: "Battery.ChargePercentage"
        id: chargePct
        value: 0
    }
    ContextProperty {
        key: "Battery.IsCharging"
        id: isChg
        value: false
    }
    ContextProperty {
        key: "Battery.OnBattery"
        id: isOnBat
        value: true
    }
    ContextProperty {
        key: "Battery.TimeUntilFull"
        id: timeToFull
        value: 0
        property int minutes: value / 1000000000
    }
    ContextProperty {
        key: "Battery.TimeUntilLow"
        id: timeToLow
        value: 0
        property int minutes: value / 1000000000
    }

    property string batState: (isChg.value ? "charging"
                               : (!isOnBat.value
                                  ? "full"
                                  : "discharging"))

    property int setHeight: 96
    property int itemHeight: setHeight - 16
    property int headHeight: setHeight / 2
    property int itemHBorder: 16
    property int sectionWidth: self.width / 2 - itemHBorder
    Flickable {
        anchors.fill: parent
        contentHeight: childrenRect.height
        InfoContainer {
            anchors {
                left: parent.left
                right: parent.right
            }
            property int margin: 4
            InfoHeader {
                text: "Battery"
                height: self.headHeight
            }
            InfoSet {
                height: self.setHeight
                InfoRow {
                    margin: self.itemHBorder
                    InfoText {
                        text: "Level: " + chargePct.value + "%"
                        width: self.sectionWidth
                    }
                    InfoItem {
                        width: self.sectionWidth
                        Battery {
                            bgColor: "black"
                            fgColor: "white"
                            isShowText: false
                            id: batIcon
                            percentage: chargePct.value
                            isCharging: isChg.value
                            isFull: !(isChg.value && isOnBat.value)
                            isChargerConnected: !isOnBat.value
                            height: self.itemHeight
                            width: height * 16 / 10
                            anchors {
                                verticalCenter: parent.verticalCenter
                                right: parent.right
                            }
                        }
                    }
                }
            }
            InfoSet {
                height: self.itemHeight
                InfoRow {
                    margin: self.itemHBorder

                    InfoText {
                        text: "State: " + self.batState
                        width: self.sectionWidth
                    }

                    InfoItem {
                        width: self.sectionWidth
                        Image {
                            id: stateIcon
                            source: "image://theme/nemo-cp-power-charging"
                            visible: isChg.value
                            height: parent.height
                            fillMode: Image.PreserveAspectFit
                            anchors {
                                verticalCenter: parent.verticalCenter
                                right: parent.right
                            }
                        }
                    }
                }
            }
            InfoSet {
                height: self.itemHeight
                visible: !isChg.value
                InfoRow {
                    margin: self.itemHBorder

                    InfoText {
                        text: "Time to low: " + timeToLow.minutes + " min"
                        width: self.sectionWidth
                    }

                }
            }
            InfoHeader {
                text: "Charger"
                height: self.headHeight
            }
            InfoSet {
                height: self.itemHeight
                InfoRow {
                    margin: self.itemHBorder

                    InfoText {
                        text: "State: " + (isOnBat.value ? "dis" : "")
                            + "connected"
                        width: self.sectionWidth
                    }

                    InfoItem {
                        width: self.sectionWidth
                        Image {
                            id: usbIcon
                            source: "image://theme/nemo-cp-power-usb"
                            visible: !isOnBat.value
                            height: parent.height
                            fillMode: Image.PreserveAspectFit
                            sourceSize { height: height; width: width }
                            anchors {
                                verticalCenter: parent.verticalCenter
                                right: parent.right
                            }
                        }
                    }
                }
            }
            InfoSet {
                height: self.itemHeight
                visible: !isOnBat.value && timeToFull.minutes > 0
                InfoRow {
                    margin: self.itemHBorder

                    InfoText {
                        text: "Time to full: " + timeToFull.minutes + " min"
                        width: self.sectionWidth
                    }

                }
            }
        }
    }
}
