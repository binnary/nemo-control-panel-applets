#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright (C) 2012 Jolla Ltd.
# Contact: Denis Zalevskiy <denis.zalevskiy@jollamobile.com>
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction,
# including without limitation the rights to use, copy, modify, merge,
# publish, distribute, sublicense, and/or sell copies of the Software,
# and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import sys

from PySide import QtCore
from PySide import QtGui
from PySide import QtSvg
from PySide.QtDeclarative import *

class ImageProvider(QDeclarativeImageProvider):

    def __init__(self):
        base = QDeclarativeImageProvider.__init__
        base(self, QDeclarativeImageProvider.ImageType.Image)

    def requestImage(self, id, size, requestedSize):
        print 'requestImage:', {
                'id': id,
                'size': size,
                'requestedSize': requestedSize
        }
        img_path = '../media/{}.svg'.format(id)
        renderer = QtSvg.QSvgRenderer(img_path)
        print renderer.defaultSize()
        if requestedSize.width() == -1 or requestedSize.height() == -1:
            s = renderer.defaultSize()
        else:
            s = requestedSize
            ds = renderer.defaultSize()
            rel = float(ds.width()) / ds.height()
            s.setWidth(s.height() * rel)
        print s

        img = QtGui.QImage(s, QtGui.QImage.Format_ARGB32_Premultiplied)
        img.fill(0)
        renderer.render(QtGui.QPainter(img))
        return img

app = QtGui.QApplication(sys.argv)

view = QDeclarativeView()
view.setResizeMode(QDeclarativeView.SizeRootObjectToView)

provider = ImageProvider()
view.engine().addImageProvider('theme', provider)

ctx = view.rootContext()

print "source", sys.argv[1]
view.setSource(sys.argv[1])
view.show()

#sys.exit(
app.exec_()
#)

