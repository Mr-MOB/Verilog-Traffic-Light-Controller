module testbench();

reg clk, rst;
wire [2:0] L2R, D2R, L2D, R2LandR2D;
wire [3:0] count;
wire [2:0] ps;

Traffic_Light_Controller DUT(
    .clk(clk),
    .rst(rst),
    .L2R(L2R),
    .D2R(D2R),
    .L2D(L2D),
    .R2LandR2D(R2LandR2D),
    .count(count),
    .ps(ps)
);

initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    #4000 $finish;
end

endmodule
