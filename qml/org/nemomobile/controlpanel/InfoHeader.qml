/*
 * Information header for control applet
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

Rectangle {
    color: "black"
    property string text: "NO DATA"
    property int margin: parent.margin
    anchors {
        left: parent.left
        right: parent.right
        leftMargin: margin
        rightMargin: margin
        topMargin: margin
        bottomMargin: margin
    }
    Text {
        text: parent.text
        color: "white"
        anchors {
            //verticalCenter: parent.verticalCenter
            bottom: parent.bottom
            left: parent.left
            leftMargin: parent.margin
        }
        font.pixelSize: 32
    }
}
