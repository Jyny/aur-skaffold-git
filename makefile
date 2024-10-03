VERSION_FILE := VERSION
VERSION := $(shell cat $(VERSION_FILE))

.PHONY: all
all: update_pkgbuild test_makepkg update_srcinfo clean

.PHONY: update_pkgbuild
update_pkgbuild:
# TODO: update pkgver in PKGBUILD
# TODO: update sha256sums in PKGBUILD

.PHONY: test_makepkg
test_makepkg:
	@echo "Testing PKGBUILD..."
	@makepkg --syncdeps --cleanbuild
	@echo "PKGBUILD test completed successfully."

.PHONY: update_srcinfo
update_srcinfo:
	@makepkg --printsrcinfo > .SRCINFO
	@echo "Updated .SRCINFO file."

.PHONY: clean
clean:
	@git clean -ffdx
	@echo "Cleanup complete."
