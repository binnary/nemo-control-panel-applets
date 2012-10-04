set(APPLET_DIR ${CPANEL_DATA_DIR}/power)

install(FILES nemo-cp-power.desktop DESTINATION ${CPANEL_LIB_DIR})
install(FILES PowerInfo.qml mainpage.qml DESTINATION ${APPLET_DIR})
