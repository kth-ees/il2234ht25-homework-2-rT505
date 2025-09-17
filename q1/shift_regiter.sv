module shift_register #(parameter N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);
  
logic [N-1:0] LFSR_ff;

always_ff @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        LFSR_ff <= '0;
    end else if (load_enable) begin
        if(serial_parallel)
        LFSR_ff <= parallel_in;
        else LFSR_ff <= {serial_in, LFSR_ff[N-1:1]};
    end
end
assign parallel_out = LFSR_ff;
assign serial_out = LFSR_ff[N-1];
endmodule

