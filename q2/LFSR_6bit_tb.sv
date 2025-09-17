module LFSR_6bit_tb;
  logic clk;
  logic rst_n;
  logic sel;
  logic [5:0] parallel_in;
  logic [5:0] parallel_out;

    LFSR_6bit dut (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

 
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        sel = 0;
        parallel_in = 6'b101011; 
        #10;
        
        
        rst_n = 1;     
        #10;
        sel = 0; // Load mode
        #10;

        sel = 1;
        repeat (20) begin
            #10;
          $display("Time: %0t | LFSR output: %b", $time, parallel_out);
        end

        $finish;
    end



endmodule
