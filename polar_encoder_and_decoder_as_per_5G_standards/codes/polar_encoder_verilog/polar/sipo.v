module sipo (
  input wire clk,
  input wire reset,
  input wire serial_in,
  output reg [199:0] parallel_out,
  output wire empty,
  output wire full
);
  
  reg [9:0] rd_ptr, wr_ptr;
  reg [199:0] mem;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      rd_ptr <= 10'b0;
      wr_ptr <= 10'b0;
    end else begin
      if (!full && !empty) begin
        mem[wr_ptr] <= serial_in;
        wr_ptr <= wr_ptr + 1;
      end
      if (!empty) begin
        parallel_out <= mem;
        rd_ptr <= rd_ptr + 1;
      end
    end
  end
  
  assign empty = (rd_ptr == wr_ptr);
  assign full = (wr_ptr - rd_ptr == 200);
endmodule

