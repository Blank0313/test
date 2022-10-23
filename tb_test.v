// -----------------------------------------------------------------------------
`timescale  1ns / 1ps
 
module tb_testa;
 
// testa Parameters
parameter PERIOD  = 10;
 
 
// testa Inputs
reg   sclk   = 0 ;
reg   rst_n  = 0 ;
 
// testa Outputs
wire  odata;
 
initial
begin
   $dumpfile("./build/wavets.vcd");
    $dumpvars(0, tb_testa);
   #100000 $finish;
end
 
initial
begin
    forever #(PERIOD/2)  sclk=~sclk;
end
 
initial
begin
    #(PERIOD*2) rst_n  =  1;
end
testa  u_testa (
    .sclk                    ( sclk    ),
    .rst                     ( rst_n     ),
    .odata                   ( odata   )
);

initial begin

    $dumpfile("./build/wavets.vcd");   // 指定VCD文件的名字为wavets.vcd，仿真信息将记录到此文件

    $dumpvars(0, tb_testa );  // 指定层次数为0，则tb_testa模块及其下面各层次的所有信号将被记录

    #100000 $finish;

end

endmodule

