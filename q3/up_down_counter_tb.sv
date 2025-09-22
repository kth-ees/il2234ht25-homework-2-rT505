module up_down_counter_tb;

parameter N = 4;
logic clk;
logic rst_n;
logic up_down;
logic load;
logic [N-1:0] input_load;
logic [N-1:0] count_out;
logic carry_out;

initial clk = 0;
always #5 clk = !clk;

initial begin
    rst_n = 0;
    #10;

    rst_n = 1;
    load = 1;
    input_load = 4'b0000;
    #50;

    $finish;

end

up_down_counter #(.N(N)) dut (
    .clk(clk),
    .rst_n(rst_n),
    .up_down(up_down),
    .load(load),
    .input_load(input_load),
    .count_out(count_out)
);
endmodule
