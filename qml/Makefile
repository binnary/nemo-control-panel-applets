export INSTALL_PREFIX

QMLDIR:=$(INSTALL_PREFIX)/lib/qt4/imports
export QMLDIR
CPANEL_DATA_DIR:=$(INSTALL_PREFIX)/share/duicontrolpanel
export CPANEL_DATA_DIR
CPANEL_LIB_DIR:=$(INSTALL_PREFIX)/lib/duicontrolpanel
export CPANEL_LIB_DIR

export INSTALL_FILES
export INSTALL_DIR

install:
	$(INSTALL_DIR) $(QMLDIR)/
	$(MAKE) -C org/nemomobile/controlpanel install
	$(MAKE) -C power install
