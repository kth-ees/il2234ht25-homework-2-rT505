module registerfile (input logic clk,
                     input logic rst_n,
                     input logic write_en,
                     input logic [3:0] write_addr,
                     input logic [7:0] data_in,
                     input logic [3:0] read_addr1,
                     input logic [3:0] read_addr2,
                     output logic [7:0] data_out1,
                     output logic [7:0] data_out2
                     );
logic [7:0] register [15:0];

always_ff @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        for (int i = 0; i < 16; i++) register[i] = 8'b0;
        else if (write_en)
          register[write_addr] <= data_in; 
end
assign data_out1 = register[read_addr1];
assign data_out2 = register[read_addr2];
endmodule
