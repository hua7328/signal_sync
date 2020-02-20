/*********************************************************************
* @Company:	WuHan SINOROCK Technology CO.,Ltd
			Copyright(c) 2008, 中岩科技, All right reserved
* @Author:	yinzhongnan
* @File Name:	
* @Module Name:	signal_sync
* @Description:	
* @Development Tools:	Quartus II 13.0
* @Revision History:	22-January-2015
*********************************************************************/

module	signal_sync(
			clk,rst_n,
			signal_in,
			signal_out	  	
		   ); 
input	clk;
input	rst_n;
input	signal_in;
output	signal_out;	

//****************************************************
wire	signal_out;
reg		q1,q2,q3;
always @(posedge clk or negedge rst_n)
	if(!rst_n)	{q3,q2,q1} <= {1'b0,1'b0,1'b0};
	else	{q3,q2,q1} <= {q2,q1,signal_in};
	
assign	signal_out = (~q3)&q2;   //检测signal_in的上升沿

endmodule
