APPLET_DIR:=${CPANEL_DATA_DIR}/power

install: install-desktop install-applet

install-desktop: nemo-cp-power.desktop
	$(INSTALL_DIR) $(CPANEL_LIB_DIR)/
	$(INSTALL_FILES) $< $(CPANEL_LIB_DIR)/

install-applet: PowerInfo.qml mainpage.qml
	$(INSTALL_DIR) $(APPLET_DIR)/
	$(INSTALL_FILES) $^ $(APPLET_DIR)/

.PHONY: install install-applet install-desktop
