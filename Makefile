PREFIX   ?= $(HOME)/libraries
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
	install -d $(PREFIX)/lib/gnat
	install -d $(PREFIX)/lib/x509-ada
	install -d $(PREFIX)/include/x509-ada
	install -m 644 src/ada/*.ad* $(PREFIX)/include/x509-ada
	install -m 644 src/ada/thin/* $(PREFIX)/include/x509-ada
	install -m 444 $(LIBDIR)/*.ali $(PREFIX)/lib/x509-ada
	install -m 644 $(GPR_FILES) $(PREFIX)/lib/gnat
	install -m 444 $(LIBDIR)/libx509ada.a $(PREFIX)/lib

clean:
	@rm -rf $(OBJDIR)
	@rm -rf $(LIBDIR)

.PHONY: tests
