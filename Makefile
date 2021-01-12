
PORT_PREFIX := /opt/local
SLUG = macports-pep

CHECK_CLEAN := @git diff-index --quiet HEAD -- >/dev/null 2>&1 || echo "*** WARNING: Uncommited changes, do not publish! ***"

all: ../$(SLUG).tar.gz
	# $(PORT_PREFIX)/bin/portindex
	$(CHECK_CLEAN)

.PHONY: ../$(SLUG).tar.gz

../$(SLUG).tar.gz:
	-@rm -f ../$(SLUG).tar ../$(SLUG).tar.gz
	-@rm -rf ../ports/PortIndex_*
	for CAT in $(shell ls -1d */. | xargs -n1 dirname) ; do ln -fsh "../repo/$$CAT" "../ports/$$CAT" ; done
	# See https://rsync.macports.org/macports/release/ports/PortIndex_*
	for PLAT in \
			11_i386  12_i386  13_i386  14_i386  15_i386  16_i386  17_i386  18_i386  19_i386  \
			20_i386  20_arm ; do  \
		$(PORT_PREFIX)/bin/portindex -p "darwin_$${PLAT}" -o ../ports/PortIndex_darwin_"$${PLAT}" ; \
	done
	rm -f ../ports/PortIndex ../ports/PortIndex.quick
	git archive --format=tar --prefix=ports/ -o ../$(SLUG).tar HEAD \
		mail python	security
	# tar -r -f ../$(SLUG).tar ../ports/PortIndex_darwin_{11,12,13,14,15,16,17,18}_i386
	gzip -9 ../$(SLUG).tar
	$(CHECK_CLEAN)

upload: ../$(SLUG).tar.gz
	scp "$^" software:"/var/www/html/$(SLUG).tar.gz"

clean:
	rm -rf ../ports
	rm -f ../$(SLUG).tar ../$(SLUG).tar.gz PortIndex PortIndex.quick
