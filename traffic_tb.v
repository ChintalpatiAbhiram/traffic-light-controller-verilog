`timescale 1ns / 1ps

module traffic_tb;

reg clk, reset;
wire [2:0] vlight,hlight;

traffic_light uut(
    .vlight(vlight),
    .hlight(hlight),
    .clk(clk),
    .reset(reset)
);

initial
begin
clk = 1'b0;
forever #5 clk = ~clk;
end

initial
begin
reset = 1;
#200;
reset = 0;
#100000;
$finish;
end

endmodule
