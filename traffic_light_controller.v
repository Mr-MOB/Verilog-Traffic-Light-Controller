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
    output reg [2:0]L2R,
    output reg [2:0]D2R,
    output reg [2:0]L2D,
    output reg [2:0]R2LandR2D,
    output reg [3:0]count,
    output reg [2:0]ps
    );
    
    parameter  S1=0, S2=1, S3 =2, S4=3, S5=4,S6=5;
    parameter  TY=7,TYY=5,TR=2,TRR=3;

   
    
    always@(posedge clk or posedge rst)
        begin
        if(rst==1)
        begin
        ps<=S1;
        count<=0;
        end
        else
        
      
       
            
            case(ps)
                S1: if(count<TY)
                        begin
                        ps<=S1;
                        count<=count+1;
                        end
                    else
                        begin
                        ps<=S2;
                        count<=0;
                        end
                S2: if(count<TR)
                        begin
                        ps<=S2;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S3;
                        count<=0;
                        end
                S3: if(count<TYY)
                        begin
                        ps<=S3;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S4;
                        count<=0;
                        end
                S4:if(count<TRR)
                        begin
                        ps<=S4;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S5;
                        count<=0;
                        end
                S5:if(count<TY)
                        begin
                        ps<=S5;
                        count<=count+1;
                        end

                    else
                        begin
                        ps<=S6;
                        count<=0;
                        end

                S6:if(count<TR)
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
                       L2R<=3'b001;
                       R2LandR2D<=3'b001;
                       L2D<=3'b100;
                       D2R<=3'b100;
                    end
                    S2:
                    begin 
                       L2R<=3'b001;
                       R2LandR2D<=3'b010;
                       L2D<=3'b100;
                       D2R<=3'b100;
                    end
                    S3:
                    begin
                       L2R<=3'b001;
                       R2LandR2D<=3'b100;
                       L2D<=3'b001;
                       D2R<=3'b100;
                    end
                    S4:
                    begin
                       L2R<=3'b010;
                       R2LandR2D<=3'b100;
                       L2D<=3'b010;
                       D2R<=3'b100;
                    end
                    S5:
                    begin
                       L2R<=3'b100;
                       R2LandR2D<=3'b100;
                       L2D<=3'b100;
                       D2R<=3'b001;
                    end
                    S6:
                    begin 
                       L2R<=3'b100;
                       R2LandR2D<=3'b100;
                       L2D<=3'b100;
                       D2R<=3'b010;
                    end
                    default:
                    begin 
                       L2R<=3'b000;
                       R2LandR2D<=3'b000;
                       L2D<=3'b000;
                       D2R<=3'b000;
                    end
                    endcase
            end                
              

endmodule
