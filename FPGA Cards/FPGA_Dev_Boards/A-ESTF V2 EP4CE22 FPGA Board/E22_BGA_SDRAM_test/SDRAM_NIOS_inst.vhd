  --Example instantiation for system 'SDRAM_NIOS'
  SDRAM_NIOS_inst : SDRAM_NIOS
    port map(
      address_to_the_cfi_flash_0 => address_to_the_cfi_flash_0,
      data_to_and_from_the_cfi_flash_0 => data_to_and_from_the_cfi_flash_0,
      dclk_from_the_epcs_flash_controller_0 => dclk_from_the_epcs_flash_controller_0,
      out_port_from_the_LED => out_port_from_the_LED,
      read_n_to_the_cfi_flash_0 => read_n_to_the_cfi_flash_0,
      sce_from_the_epcs_flash_controller_0 => sce_from_the_epcs_flash_controller_0,
      sdo_from_the_epcs_flash_controller_0 => sdo_from_the_epcs_flash_controller_0,
      select_n_to_the_cfi_flash_0 => select_n_to_the_cfi_flash_0,
      write_n_to_the_cfi_flash_0 => write_n_to_the_cfi_flash_0,
      zs_addr_from_the_sdram_0 => zs_addr_from_the_sdram_0,
      zs_ba_from_the_sdram_0 => zs_ba_from_the_sdram_0,
      zs_cas_n_from_the_sdram_0 => zs_cas_n_from_the_sdram_0,
      zs_cke_from_the_sdram_0 => zs_cke_from_the_sdram_0,
      zs_cs_n_from_the_sdram_0 => zs_cs_n_from_the_sdram_0,
      zs_dq_to_and_from_the_sdram_0 => zs_dq_to_and_from_the_sdram_0,
      zs_dqm_from_the_sdram_0 => zs_dqm_from_the_sdram_0,
      zs_ras_n_from_the_sdram_0 => zs_ras_n_from_the_sdram_0,
      zs_we_n_from_the_sdram_0 => zs_we_n_from_the_sdram_0,
      clk => clk,
      data0_to_the_epcs_flash_controller_0 => data0_to_the_epcs_flash_controller_0,
      reset_n => reset_n
    );


