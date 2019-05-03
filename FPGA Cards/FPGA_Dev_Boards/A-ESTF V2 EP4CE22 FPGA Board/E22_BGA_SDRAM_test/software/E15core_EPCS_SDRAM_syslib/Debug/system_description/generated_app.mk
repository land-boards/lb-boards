# generated_app.mk
#
# Machine generated for a CPU named "cpu_0" as defined in:
# e:\E15K_ESTF_SDRAM\software\E15core_EPCS_SDRAM_syslib\..\..\SDRAM_NIOS.ptf
#
# Generated: 2018-01-26 18:36:32.218

# DO NOT MODIFY THIS FILE
#
#   Changing this file will have subtle consequences
#   which will almost certainly lead to a nonfunctioning
#   system. If you do modify this file, be aware that your
#   changes will be overwritten and lost when this file
#   is generated again.
#
# DO NOT MODIFY THIS FILE

# assuming the Quartus project directory is the same as the PTF directory
QUARTUS_PROJECT_DIR = E:/E15K_ESTF_SDRAM

# the simulation directory is a subdirectory of the PTF directory
SIMDIR = $(QUARTUS_PROJECT_DIR)/SDRAM_NIOS_sim

DBL_QUOTE := "


# macros defined by/for cfi_flash_0 & epcs_flash_controller_0
CFI_FLASH_0_FLASHTARGET_ALT_SIM_PREFIX = $(CFI_FLASH_0_FLASHTARGET_TMP1:0=)
CFI_FLASH_0_FLASHTARGET_TMP1 = $(ALT_SIM_OPTIMIZE:1=RUN_ON_HDL_SIMULATOR_ONLY_)
BOOT_COPIER = boot_loader_cfi.srec
CPU_CLASS = altera_nios2
CPU_RESET_ADDRESS = 0x4801800
EPCS_FLASH_CONTROLLER_0_BOOT_ROM_FLASHTARGET_ALT_SIM_PREFIX = $(EPCS_FLASH_CONTROLLER_0_BOOT_ROM_FLASHTARGET_TMP1:0=)
EPCS_FLASH_CONTROLLER_0_BOOT_ROM_FLASHTARGET_TMP1 = $(ALT_SIM_OPTIMIZE:1=RUN_ON_HDL_SIMULATOR_ONLY_)
BOOTS_FROM_EPCS = 1
BOOT_COPIER_EPCS = boot_loader_epcs.srec


all: delete_placeholder_warning flashfiles sim

delete_placeholder_warning: do_delete_placeholder_warning
.PHONY: delete_placeholder_warning

flashfiles: $(CFI_FLASH_0_FLASHTARGET_ALT_SIM_PREFIX)cfi_flash_0.flash $(EPCS_FLASH_CONTROLLER_0_BOOT_ROM_FLASHTARGET_ALT_SIM_PREFIX)epcs_flash_controller_0_boot_rom.flash
.PHONY: flashfiles

sim: $(SIMDIR)/dummy_file
.PHONY: sim

do_delete_placeholder_warning:
	rm -f $(SIMDIR)/contents_file_warning.txt
.PHONY: do_delete_placeholder_warning

$(CFI_FLASH_0_FLASHTARGET_ALT_SIM_PREFIX)cfi_flash_0.flash: $(ELF)
	@echo Post-processing to create $(notdir $@)
	elf2flash --input=$(ELF) --flash= --boot=$(DBL_QUOTE)$(shell $(DBL_QUOTE)$(QUARTUS_ROOTDIR)/sopc_builder/bin/find_sopc_component_dir$(DBL_QUOTE) $(CPU_CLASS) $(QUARTUS_PROJECT_DIR))/$(BOOT_COPIER)$(DBL_QUOTE) --outfile=$(CFI_FLASH_0_FLASHTARGET_ALT_SIM_PREFIX)cfi_flash_0.flash --sim_optimize=$(ALT_SIM_OPTIMIZE) --base=0x4400000 --end=0x47FFFFF --reset=$(CPU_RESET_ADDRESS)

$(EPCS_FLASH_CONTROLLER_0_BOOT_ROM_FLASHTARGET_ALT_SIM_PREFIX)epcs_flash_controller_0_boot_rom.flash: $(ELF)
	@if [ $(BOOTS_FROM_EPCS) -eq 1 ]; then echo Post-processing to create $(notdir $@) ; elf2flash --input=$(ELF) --flash= --boot=$(DBL_QUOTE)$(shell $(DBL_QUOTE)$(QUARTUS_ROOTDIR)/sopc_builder/bin/find_sopc_component_dir$(DBL_QUOTE) $(CPU_CLASS) $(QUARTUS_PROJECT_DIR))/$(BOOT_COPIER_EPCS)$(DBL_QUOTE) --outfile=$(EPCS_FLASH_CONTROLLER_0_BOOT_ROM_FLASHTARGET_ALT_SIM_PREFIX)epcs_flash_controller_0_boot_rom.flash --sim_optimize=$(ALT_SIM_OPTIMIZE) --epcs --base=0x0 --end=0x7FFFFFFF  ; fi

$(SIMDIR)/dummy_file: $(ELF)
	if [ ! -d $(SIMDIR) ]; then mkdir $(SIMDIR) ; fi
	@echo Hardware simulation is not enabled for the target SOPC Builder system. Skipping creation of hardware simulation model contents and simulation symbol files. \(Note: This does not affect the instruction set simulator.\)
	touch $(SIMDIR)/dummy_file


generated_app_clean:
	$(RM) $(CFI_FLASH_0_FLASHTARGET_ALT_SIM_PREFIX)cfi_flash_0.flash
	$(RM) $(EPCS_FLASH_CONTROLLER_0_BOOT_ROM_FLASHTARGET_ALT_SIM_PREFIX)epcs_flash_controller_0_boot_rom.flash
	$(RM) $(SIMDIR)/dummy_file
.PHONY: generated_app_clean
