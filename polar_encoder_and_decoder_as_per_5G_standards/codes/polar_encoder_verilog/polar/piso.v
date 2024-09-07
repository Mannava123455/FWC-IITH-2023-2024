module piso(
  input wire clk,
  input wire reset,
  input wire [1023:0] parallel_in,
  output reg serial_out,
  output wire empty,
  output wire full
);
  reg [9:0] rd_ptr;
  reg [9:0] wr_ptr;
  reg [1023:0] mem;
  always@(posedge clk)
  begin
    if (reset)
    begin
      rd_ptr <= 10'b0;
      wr_ptr <= 10'b0;
    end
    else
    begin
      if (!full)
      begin
        mem[wr_ptr] <= parallel_in;
        wr_ptr <= wr_ptr + 1;
      end
      if (!empty) 
      begin
        serial_out <= mem[rd_ptr];
        rd_ptr <= rd_ptr + 1;
      end
    end
  end
  
  assign empty = (rd_ptr == wr_ptr);
  assign full = ((wr_ptr - rd_ptr) == 1024);
endmodule
