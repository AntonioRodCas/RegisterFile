/******************************************************************
* Description
*	This is the verifaction envioroment ofr testeting the register file.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	12/06/2015
******************************************************************/

module RegisterFile_TB;

reg clk_tb = 0;
reg reset_tb;
reg RegWrite_tb;
reg [4:0] WriteRegister_tb;
reg [4:0] ReadRegister1_tb;
reg [4:0] ReadRegister2_tb;
reg [31:0] WriteData_tb;
wire [31:0] ReadData1_tb;
wire [31:0] ReadData2_tb;
  
  
RegisterFile
#(
	.WORD_LENGTH(32),
	.N(32)
)
DUV
(
	.clk(clk_tb),
	.reset(reset_tb),
	.RegWrite(RegWrite_tb),
	.WriteRegister(WriteRegister_tb),
	.ReadRegister1(ReadRegister1_tb),
	.ReadRegister2(ReadRegister2_tb),
	.WriteData(WriteData_tb),
	.ReadData1(ReadData1_tb),
	.ReadData2(ReadData2_tb)

);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset_tb = 0;
	#5 reset_tb = 1;
end

initial begin
	#0 RegWrite_tb = 0;
	#5 RegWrite_tb = 1;
	#50 RegWrite_tb = 0;
end


initial begin
	#0 ReadRegister1_tb = 0;
	#4 ReadRegister1_tb = 0;
	#70 ReadRegister1_tb = 2;
	#10 ReadRegister1_tb = 4;
	#10 ReadRegister1_tb = 25;
	#10 ReadRegister1_tb = 31;

end


initial begin
	#0 ReadRegister2_tb = 0;
	#4 ReadRegister2_tb = 0;
	#70 ReadRegister2_tb = 2;
	#10 ReadRegister2_tb = 4;
	#10 ReadRegister2_tb = 2;
	#10 ReadRegister2_tb = 31;

end

initial begin
	#0 WriteRegister_tb = 0;
	#4 WriteRegister_tb = 0;
	#8 WriteRegister_tb = 2;
	#8 WriteRegister_tb = 4;
	#8 WriteRegister_tb = 25;
	#8 WriteRegister_tb = 31;

end


/*********************************************************/
initial begin // reset generator
	#0 WriteData_tb = 3;
	#4 WriteData_tb = 3;
	#8 WriteData_tb = 7;
	#8 WriteData_tb = 20;
	#8 WriteData_tb = 6;
	#8 WriteData_tb = 78;
end

/*********************************************************/

endmodule