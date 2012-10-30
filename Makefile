PREFIX   ?= $(HOME)/libraries
SRCDIR    = src
THINDIR   = thin
TESTDIR   = tests
OBJDIR    = obj
LIBDIR    = lib
GPR_FILES = gnat/*.gpr

BUILD_OPTS = -p

all: build_tests

build_tests:
	@gprbuild $(BUILD_OPTS) -Ptests

build_lib:
	@gprbuild $(BUILD_OPTS) -Plib

tests: build_tests
	@$(OBJDIR)/$(TESTDIR)/test_runner

install: install_lib

install_lib: build_lib
	mkdir -p $(PREFIX)/lib/gnat
	mkdir -p $(PREFIX)/lib/x509ada/thin
	mkdir -p $(PREFIX)/include/x509ada/thin
	install -m 644 $(SRCDIR)/*.ad* $(PREFIX)/include/x509ada
	install -m 644 $(THINDIR)/ada/* $(PREFIX)/include/x509ada/thin
	install -m 444 $(LIBDIR)/*.ali $(PREFIX)/lib/x509ada
	install -m 444 $(OBJDIR)/thin/*.ali $(PREFIX)/lib/x509ada/thin
	install -m 644 $(GPR_FILES) $(PREFIX)/lib/gnat
	install -m 444 $(LIBDIR)/libx509ada.a $(PREFIX)/lib
	install -m 444 $(LIBDIR)/libx509ada-thin.a $(PREFIX)/lib

clean:
	@rm -rf $(OBJDIR)
	@rm -rf $(LIBDIR)

.PHONY: tests
