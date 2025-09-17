module register_file_tb;

logic         clk, rst_n;
logic [7:0]   data_in;
logic         write_en;
logic [3:0]   read_addr1, read_addr2 , write_addr;
logic [7:0]  data_out1, data_out2;

initial clk = 0;
always #5 clk = ~clk;

initial begin
    rst_n = 0;
    #10;
    rst_n = 1;
    write_en = 1;
    data_in = 8'b0000_0001;
    write_addr = 4'b0000;
    read_addr1 = 4'b0000;
    read_addr2 = 4'b0000;
    #10;
    write_en = 0;
    data_in = 8'b0000_0010;
    write_addr = 4'b0001;
    read_addr1 = 4'b0000;
    read_addr2 = 4'b0000;
    #10;
    write_en = 1;
    data_in = 8'b0000_0010;
    write_addr = 4'b0001;
    read_addr1 = 4'b0001;
    read_addr2 = 4'b0001;
    #10;
    data_in = 8'b0000_0100;
    write_addr = 4'b1111;
    read_addr1 = 4'b1111;
    read_addr2 = 4'b1111;
    #10;
    read_addr1 = 4'b0001;
    read_addr2 = 4'b0001;
    #10;
end
  register_file dut (.clk(clk), .rst_n(rst_n), .data_in(data_in), .write_en(write_en), .write_addr(write_addr), .read_addr1(read_addr1),
                     .read_addr2(read_addr2), .data_out1(data_out1), .data_out2(data_out2));



endmodule
