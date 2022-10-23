module testa(
input	   wire	            sclk,
input	wire 							rst,
output	reg   odata
	);
 
reg [10:0]	cnt;
always @(posedge sclk) begin
	if(~rst) begin
		odata <= 1'b0;
		cnt <= 0;
	end
	else begin
		cnt <= cnt + 1;
		if(cnt[10]) begin
			odata <= 1'b1;
		end
		else begin
			odata <= 1'b0;
		end
	end
end

endmodule