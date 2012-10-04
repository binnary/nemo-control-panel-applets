MEDIADIR:=$(INSTALL_PREFIX)/share/themes/blanco/meegotouch
IMGDIR:=$(MEDIADIR)/icons

install: install-power

install-power: nemo-cp-power-*.svg
	$(INSTALL_DIR) -d $(IMGDIR)
	$(INSTALL_FILES) $^ $(IMGDIR)

.PHONY : install install-power
