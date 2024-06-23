module serial_adder (
  input inA, inB, clk,
  output sum, carry_out
);

  reg a, b, sum_reg, carry_reg;

  // Input registers for data synchronization
  always @(posedge clk) begin
    a <= inA;
    b <= inB;
  end

  // Serial addition logic
  always @(posedge clk) begin
    sum_reg <= a ^ b ^ carry_reg;
    carry_reg <= (a & b) | (a & carry_reg) | (b & carry_reg);
  end

  // Assign outputs
  assign sum = sum_reg;
  assign carry_out = carry_reg;

endmodule

module serial_adder_4bit (sum, clk, rst, a, b);
input clk, rst;
input [3:0] a, b;
output reg [4:0] sum;
reg [3:0] ina, inb;
reg [4:0] isum;
reg s, c;

  

  // Input registers for data synchronization
always @(posedge clk) begin
	
	if (rst) begin
		ina = a;
		inb = b;
		isum = 0;
	end
	
	else begin
	
		ina = {1'b0, ina [3:1]};
		inb = {1'b0, inb [3:1]};
		isum[4] = c;
		isum[3:0] = {s, isum [3:1]};
	
	end
	
	
	s = ina[0] ^ inb[0] ^ isum[4];
	c = (ina[0]&inb[0])|(ina[0]&isum[4])|(inb[0]&isum[4]);
	 sum = isum;
    
	 
end

endmodule


