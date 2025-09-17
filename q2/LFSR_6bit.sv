module LFSR_6bit (
  input  logic clk, rst_n,
  input  logic sel,
  input  logic [5:0] parallel_in,
  output logic [5:0] parallel_out
);
 logic feedback;

always_ff @(posedge clk or negedge rst_n) begin
    if (~rst_n)
        parallel_out <= 6'b000001;
        else if (!sel)
            out <= parallel_in;
            else begin
                feedback = out[5] ^ out[2] ^ out[0];
                out <= {feedback, out[5:1]};
            end
end
endmodule

