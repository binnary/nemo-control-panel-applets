set(QMLCP_DIR ${QMLDIR}/org/nemomobile/controlpanel)
set(QMLS
  Battery.qml InfoHeader.qml InfoRow.qml InfoContainer.qml
  InfoItem.qml InfoText.qml)

install(FILES ${QMLS} qmldir DESTINATION ${QMLCP_DIR})
