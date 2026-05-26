`timescale 1ns / 1ps

module traffic_light(
    output reg [2:0] vlight,
    output reg[2:0] hlight,
    input clk,
    input reset
    );
    
    parameter RED = 3'b100, YELLOW = 3'b010, GREEN = 3'b001;
    parameter S1 = 0, S2 = 1, S3 = 2, S4 = 3;
    
    
    reg [1:0] state;
    reg [3:0] count;
    
    
    //STATE DIAGRAM
    always@(posedge clk or posedge reset)
        begin
        if(reset == 1)
        begin
        state <= S1;
        count <= 0;
        end
        
        else
        
        case(state)
        S1 : if (count < 5)
                begin
                state <= S1;
                count <= count + 1;
                end
                
               else
                begin
                state <= S2;
                count <= 0;
                end
                
         S2 : if (count < 5)
                begin
                state <= S2;
                count <= count + 1;
                end
                
               else
                begin
                state <= S3;
                count <= 0;
                end
                
         S3 : if (count < 5)
                begin
                state <= S3;
                count <= count + 1;
                end
                
               else
                begin
                state <= S4;
                count <= 0;
                end
                
         S4 : if (count < 5)
                begin
                state <= S4;
                count <= count + 1;
                end
                
               else
                begin
                state <= S1;
                count <= 0;
                end
                
        default: state <= S1;
        endcase
        end
        
        
        //STATE DEFINE
        always@(*)
        begin
            case(state)
            S1 :
                begin
                vlight = GREEN;
                hlight = RED;
                end
                
            S2 :
                begin
                vlight = YELLOW;
                hlight = RED;
                end
                
            S3 :
                begin
                vlight = RED;
                hlight = GREEN;
                end
                
            S4 :
                begin
                vlight = RED;
                hlight = YELLOW;
                end
                
            default : 
            begin
            vlight = GREEN;
            hlight = RED;
            end
            
            endcase
        end
endmodule
