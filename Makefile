
PORT_PREFIX := /opt/local
SLUG = macports-pep

all: $(SLUG).tar.gz

.PHONY: $(SLUG).tar.gz

$(SLUG).tar.gz:
	git diff-index --quiet HEAD -- >/dev/null 2>&1
	$(PORT_PREFIX)/bin/portindex
	git archive --format=tar HEAD | gzip -9 >$(SLUG).tar.gz

