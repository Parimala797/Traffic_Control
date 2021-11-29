`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2020 12:53:25
// Design Name: 
// Module Name: Traffic_Light_Controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Traffic_Light_Controller(


    input clk,rst,
    output reg [2:0]M1,
    output reg [2:0]SR,
    output reg [2:0]MT,
    output reg [2:0]M2
    );
    
    parameter  S1=0, S2=1, S3 =2, S4=3, S5=4,S6=5;
    reg [3:0]count;
    reg[2:0] ps;
    parameter  t1=7,t2=5,t3=2,t4=3;

   
    
    always@(posedge clk or posedge rst)
        begin
        if(rst==1)
        begin
        ps<=S1;
        count<=0;
        end
        else
        
      
       
            
            case(ps)
                S1: if(count<t1)
                        begin
                        ps<=S1;
                        count<=count+1;
                        end
                    else
                        begin
                        ps<=S2;
                        count<=0;
                        end
                S2: if(count<t2)
                        begin
                        ps<=S2;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S3;
                        count<=0;
                        end
                S3: if(count<t3)
                        begin
                        ps<=S3;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S4;
                        count<=0;
                        end
                S4:if(count<t2)
                        begin
                        ps<=S4;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S5;
                        count<=0;
                        end
                S5:if(count<t4)
                        begin
                        ps<=S5;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S6;
                        count<=0;
                        end

                S6:if(count<t2)
                        begin
                        ps<=S6;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S1;
                        count<=0;
                        end
                default: ps<=S1;
                endcase
            end   

            always@(ps)    
            begin
                
                case(ps)
                     
                    S1:
                    begin
                       M1<=3'b001;
                       M2<=3'b001;
                       MT<=3'b100;
                       SR<=3'b100;
                    end
                    S2:
                    begin 
                       M1<=3'b001;
                       M2<=3'b010;
                       MT<=3'b100;
                       S<=3'b100;
                    end
                    S3:
                    begin
                       M1<=3'b001;
                       M2<=3'b100;
                       MT<=3'b001;
                       SR<=3'b100;
                    end
                    S4:
                    begin
                       M1<=3'b010;
                       M2<=3'b100;
                       MT<=3'b010;
                       SR<=3'b100;
                    end
                    S5:
                    begin
                       M1<=3'b100;
                       M2<=3'b100;
                       MT<=3'b100;
                       SR<=3'b001;
                    end
                    S6:
                    begin 
                       M1<=3'b100;
                       M2<=3'b100;
                       MT<=3'b100;
                       SR<=3'b010;
                    end
                    default:
                    begin 
                       M1<=3'b000;
                       M2<=3'b000;
                       MT<=3'b000;
                       SR<=3'b000;
                    end
                    endcase
            end                
              

endmodule

module Traffic_Light_Controller_tb;
reg clk,rst;
wire [2:0]M1;
wire [2:0]SR;
wire [2:0]MT;
wire [2:0]M2;
Traffic_Light_Controller dut(.clk(clk), .rst(rst), .M1(M1), .SR(SR), .MT(MT), .M2(M2));
initial 
    begin
        $dumpfile("Traffic_Light_Controller.vcd");
        $dumpvars(0,Traffic_Light_Controller_tb);
      clk=1'b0;
      forever #(10000000000/2) clk=~clk;
    end
initial 
begin
  rst=0;
  #10000000000;
  rst=1;
  #10000000000;
  rst=0;
  #(10000000000*200);
  $finish;  
end
endmodule
