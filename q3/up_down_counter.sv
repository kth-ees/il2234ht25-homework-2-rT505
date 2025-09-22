module up_down_counter #(parameter N = 4)
                       (input  logic clk,
                        input  logic rst_n,
                        input  logic up_down,
                        input  logic load,
                        input  logic [N-1:0] input_load,
                        output logic [N-1:0] count_out,
                        output logic carry_out);
  
logic carry;
logic [N-1:0]temp_counter;

always_ff @(posedge clk or negedge rst_n) begin : count_logic
    if(!rst_n) begin
        temp_counter <= '0;
        carry <= 0;
    end
        else if(load)
            temp_counter <= input_load;
        else if(up_down)
            {carry, temp_counter} = temp_counter + 1;
        else if(!up_down)
            {carry, temp_counter} = temp_counter -1;
end : count_logic

assign count_out = temp_counter;
assign carry_out = carry;


endmodule
