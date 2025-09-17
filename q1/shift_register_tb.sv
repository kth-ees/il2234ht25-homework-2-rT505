module shift_register_tb;
parameter N = 4;
logic clk, rst_n, serial_parallel, load_enable, serial_in; 
logic [N-1:0] parallel_in;
logic [N-1:0] parallel_out;
logic serial_out;

initial clk = 0;
always #5 clk = ~clk;

initial begin
    rst_n = 0;
    load_enable = 0;
    parallel_in = 5'b00001;
    serial_in = 1'b1;
    #10;
    rst_n = 1;
    load_enable = 1;
    serial_parallel = 1;
    #10;
    serial_parallel = 0;
    repeat (2) begin
        #10;
    end
    serial_in = 1'b0;
    repeat (4) begin
        #10;
    end
    $finish;
    
end
shift_register #(.N(N)) dut (.clk(clk), .rst_n(rst_n), . serial_parallel(serial_parallel), .load_enable(load_enable),
            .serial_in(serial_in), .parallel_in(parallel_in), .parallel_out(parallel_out), .serial_out(serial_out));
endmodule
