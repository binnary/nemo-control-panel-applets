import Qt 4.7
import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.controlpanel 0.1
import org.nemomobile.controlpanel 1.0

PageStackWindow {
    id: mainWindow
    initialPage: powerInfo

    // this is a temporary workaround for orientation bug triggered in
    // case PageStackWindow is used as a top level component in CP
    // plugin
    rotation: screen.orientationString == 'Portrait' ? 90 : 0

    PowerInfo {
        id: powerInfo
        tools: DcpToolBar {}
    }
}
