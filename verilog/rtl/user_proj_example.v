// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    input user_clock2,

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
    Sandbox mprj (
      //Clocks and Reset
      .clk(wb_clk_i),
      .reset(wb_rst_i),
      .io_clk2(user_clock2),

      // MGMT SoC Wishbone Slave
      .io_bus_CYC(wbs_cyc_i),
      .io_bus_STB(wbs_stb_i),
      .io_bus_WE(wbs_we_i),
      .io_bus_SEL(wbs_sel_i),
      .io_bus_ADR(wbs_adr_i),
      .io_bus_DAT_MOSI(wbs_dat_i),
      .io_bus_ACK(wbs_ack_o),
      .io_bus_DAT_MISO(wbs_dat_o),

      // Logic Analyzer
      .io_logicAnalyzer_read(la_data_out),
      .io_logicAnalyzer_write(la_data_in),
      .io_logicAnalyzer_writeEnable(la_oenb),

      // IO Pads
      .io_gpio_read(io_in),
      .io_gpio_write(io_out),
      .io_gpio_writeEnable(io_oeb),

      // Analog Pads
      .io_analog(analog_io),

      // IRQ
      .io_irq(user_irq)
    );

endmodule
`default_nettype wire
