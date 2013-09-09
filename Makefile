prefix=/usr/local

# files that need mode 755
EXEC_FILES=git-fork

# files that need mode 644
SCRIPT_FILES =git-fork-new
SCRIPT_FILES+=git-fork-start
SCRIPT_FILES+=git-fork-status
SCRIPT_FILES+=git-fork-submit
SCRIPT_FILES+=git-fork-update
SCRIPT_FILES+=fork-helpers

all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	install -d -m 0755 $(prefix)/bin
	install -m 0755 $(EXEC_FILES) $(prefix)/bin
	install -m 0644 $(SCRIPT_FILES) $(prefix)/bin

uninstall:
	test -d $(prefix)/bin && \
	cd $(prefix)/bin && \
	rm -f $(EXEC_FILES) $(SCRIPT_FILES)
