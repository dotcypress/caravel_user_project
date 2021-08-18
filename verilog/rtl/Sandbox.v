// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : Sandbox
// Git hash  : 392b5b6c1d63a138952b99b249ff6cda04a16e5e



module Sandbox (
  input               io_clk2,
  input               io_bus_CYC,
  input               io_bus_STB,
  output              io_bus_ACK,
  input               io_bus_WE,
  input      [31:0]   io_bus_ADR,
  output     [31:0]   io_bus_DAT_MISO,
  input      [31:0]   io_bus_DAT_MOSI,
  input      [3:0]    io_bus_SEL,
   inout     [28:0]   io_analog,
  input      [37:0]   io_gpio_read,
  output     [37:0]   io_gpio_write,
  output              io_gpio_writeEnable,
  output     [127:0]  io_logicAnalyzer_read,
  input      [127:0]  io_logicAnalyzer_write,
  input               io_logicAnalyzer_writeEnable,
  output     [2:0]    io_irq,
  input               clk,
  input               reset
);
  wire       [15:0]   _zz__zz_io_logicAnalyzer_read_1;
  wire       [0:0]    _zz__zz_io_logicAnalyzer_read_1_1;
  wire       [15:0]   _zz_io_logicAnalyzer_read_3;
  wire                when_Utils_l357;
  reg                 _zz_io_logicAnalyzer_read;
  reg        [15:0]   _zz_io_logicAnalyzer_read_1;
  reg        [15:0]   _zz_io_logicAnalyzer_read_2;

  assign _zz__zz_io_logicAnalyzer_read_1_1 = _zz_io_logicAnalyzer_read;
  assign _zz__zz_io_logicAnalyzer_read_1 = {15'd0, _zz__zz_io_logicAnalyzer_read_1_1};
  assign _zz_io_logicAnalyzer_read_3 = _zz_io_logicAnalyzer_read_2;
  assign io_bus_DAT_MISO = 32'h0;
  assign io_bus_ACK = 1'b0;
  assign io_irq = 3'b000;
  assign io_gpio_writeEnable = 1'b1;
  assign io_gpio_write = 38'h0;
  assign when_Utils_l357 = 1'b1;
  always @(*) begin
    _zz_io_logicAnalyzer_read = 1'b0;
    if(when_Utils_l357) begin
      _zz_io_logicAnalyzer_read = 1'b1;
    end
  end

  always @(*) begin
    _zz_io_logicAnalyzer_read_1 = (_zz_io_logicAnalyzer_read_2 + _zz__zz_io_logicAnalyzer_read_1);
    if(1'b0) begin
      _zz_io_logicAnalyzer_read_1 = 16'h0;
    end
  end

  assign io_logicAnalyzer_read = {112'd0, _zz_io_logicAnalyzer_read_3};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_io_logicAnalyzer_read_2 <= 16'h0;
    end else begin
      _zz_io_logicAnalyzer_read_2 <= _zz_io_logicAnalyzer_read_1;
    end
  end


endmodule
