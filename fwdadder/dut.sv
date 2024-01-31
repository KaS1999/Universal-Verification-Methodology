module adder(intf if1);

always@(posedge if1.clk)
begin
if1.sum=if1.a + if1.b;
if1.carry=if1.a & if1.b;
end
endmodule
