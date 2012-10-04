LIB_DIR:=$(DESTDIR)/$(LIBDIR)
export LIB_DIR
DATA_DIR:=$(DESTDIR)/$(DATADIR)
export DATA_DIR

DIR_PERM:=-o $(USER)
INSTALL_DIR:=/usr/bin/install -d $(DIR_PERM)
export INSTALL_DIR

NEXEC_PERM:=-m 0644 -o $(USER)
INSTALL_FILES:=/usr/bin/install $(NEXEC_PERM)
export INSTALL_FILES

install :
	$(MAKE) -C qml
	$(MAKE) -C media

.PHONY : install
