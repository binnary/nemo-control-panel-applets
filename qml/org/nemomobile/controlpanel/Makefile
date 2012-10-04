QMLCPDIR:=$(QMLDIR)/org/nemomobile/controlpanel
QMLS:=Battery.qml InfoHeader.qml InfoRow.qml InfoContainer.qml \
	InfoItem.qml InfoText.qml qmldir

install : $(QMLS)
	$(INSTALL_DIR) $(QMLCPDIR)/
	$(INSTALL_FILES) $^ $(QMLCPDIR)/

.PHONY : install
