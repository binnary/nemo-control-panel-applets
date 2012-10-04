/*
 * Information bar text for control applet
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
    //color: "navy"
    property string text: "NO DATA" 
    height: parent.childHeight
    property int margin: parent.margin
    anchors {
        verticalCenter: parent.verticalCenter
    }
    Text {
        text: parent.text
        color: "white"
        width: parent.width
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
        font.pixelSize: 28
    }
}
