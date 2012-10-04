QMLDIR:=$(LIB_DIR)/qt4/imports
export QMLDIR
CPANEL_DATA_DIR:=$(DATA_DIR)/duicontrolpanel
export CPANEL_DATA_DIR
CPANEL_LIB_DIR:=$(LIB_DIR)/duicontrolpanel
export CPANEL_LIB_DIR

export INSTALL_FILES
export INSTALL_DIR

install:
	$(INSTALL_DIR) $(QMLDIR)/
	$(MAKE) -C org/nemomobile/controlpanel install
	$(MAKE) -C power install
