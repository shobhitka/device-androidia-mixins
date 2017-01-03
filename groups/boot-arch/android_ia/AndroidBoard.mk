define generate_flashfiles
zip -qj $(1) $(2)
endef

out_flashfiles := $(PRODUCT_OUT)/$(TARGET_PRODUCT).flashfiles.$(TARGET_BUILD_VARIANT).$(USER).zip

$(PRODUCT_OUT)/efi/installer.cmd:
	$(ACP) $(TARGET_DEVICE_DIR)/$(@F) $@

$(PRODUCT_OUT)/efi/startup.nsh:
	$(ACP) $(TARGET_DEVICE_DIR)/$(@F) $@

$(out_flashfiles): $(BOARD_FLASHFILES) | $(ACP)
	$(call generate_flashfiles,$@, $^)

.PHONY: flashfiles
flashfiles: $(out_flashfiles)
