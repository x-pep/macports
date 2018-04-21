
PORT_PREFIX := /opt/local
SLUG = macports-pep

all: $(SLUG).tar.gz
	$(PORT_PREFIX)/bin/portindex

.PHONY: $(SLUG).tar.gz

$(SLUG).tar.gz:
	git diff-index --quiet HEAD -- >/dev/null 2>&1
	-@rm -f $(SLUG).tar $(SLUG).tar.gz
	mkdir -p ports
	$(PORT_PREFIX)/bin/portindex -p darwin_11_i386 -o ports/PortIndex_darwin_11_i386
	$(PORT_PREFIX)/bin/portindex -p darwin_12_i386 -o ports/PortIndex_darwin_12_i386
	$(PORT_PREFIX)/bin/portindex -p darwin_13_i386 -o ports/PortIndex_darwin_13_i386
	$(PORT_PREFIX)/bin/portindex -p darwin_14_i386 -o ports/PortIndex_darwin_14_i386
	$(PORT_PREFIX)/bin/portindex -p darwin_15_i386 -o ports/PortIndex_darwin_15_i386
	$(PORT_PREFIX)/bin/portindex -p darwin_16_i386 -o ports/PortIndex_darwin_16_i386
	$(PORT_PREFIX)/bin/portindex -p darwin_17_i386 -o ports/PortIndex_darwin_17_i386
	git archive --format=tar --prefix=ports/ -o $(SLUG).tar HEAD mail python	
	tar -r -f $(SLUG).tar ports/PortIndex_darwin_{11,12,13,14,15,16,17}_i386
	gzip -9 $(SLUG).tar

