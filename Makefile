INSTALL_PREFIX:=$(DESTDIR)/usr
export INSTALL_PREFIX

DIR_PERM:=-o $(USER)
INSTALL_DIR:=/usr/bin/install -d
export INSTALL_DIR

NEXEC_PERM:=-m 0644 -o $(USER)
INSTALL_FILES:=/usr/bin/install $(NEXEC_PERM)
export INSTALL_FILES

install :
	$(MAKE) -C qml
	$(MAKE) -C media

.PHONY : install
