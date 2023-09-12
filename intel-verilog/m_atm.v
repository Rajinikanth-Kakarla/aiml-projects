`define true 1'b1
`define false 1'b0

`define FIND 1'b0
`define AUTHENTICATE 1'b1

`define WAITING               3'b000
`define MENU                  3'b010
`define BALANCE               3'b011
`define WITHDRAW              3'b100
`define WITHDRAW_SHOW_BALANCE 3'b101
`define TRANSACTION           3'b110

module ATM(
  input clk,
  input exit,
  input [11:0] accNumber,
  input [3:0] pin,
  input [11:0] destinationAcc, 
  input [2:0]menuOption,
  input [10:0] amount, 
  output reg error,
  output reg [10:0] balance
  );


  reg [31:0] balance_database [0:9];
  initial begin
    $display("Welcome to the ATM");
     balance_database[0] = 32'd15000;
     balance_database[1] = 32'd16000;
     balance_database[2] = 32'd17000;
     balance_database[3] = 32'd18000;
     balance_database[4] = 32'd19000;
     balance_database[5] = 32'd10000;
     balance_database[6] = 32'd11000;
     balance_database[7] = 32'd12000;
     balance_database[8] = 32'd13000;
     balance_database[9] = 32'd14000;

  end
  
  reg [2:0] currState = `WAITING;
  
  wire [3:0] accIndex;
  wire [3:0] destinationAccIndex;
  wire isAuthenticated;
  wire wasFound;
  
  reg deAuth = `false;

  authentication authAccNumberModule(accNumber, pin, `AUTHENTICATE, deAuth, isAuthenticated, accIndex);
  authentication findAccNumberModule(destinationAcc, 0, `FIND, deAuth, wasFound, destinationAccIndex);

  always @(posedge clk or isAuthenticated or menuOption or exit) begin
    
	error = `false;
    if(exit == `true) begin
      
      currState = `WAITING;
      
      deAuth = `true;
      #20;      
    end
    
    if(currState == `MENU) begin
      if((menuOption >= 0) & (menuOption <= 7))begin 
        currState = menuOption;
      end else
      currState = menuOption;
    end
    
      case (currState)


      `WAITING: begin
        if (isAuthenticated == `true) begin
          currState = `MENU;
          $display("Logged In.");
        end
        else if(isAuthenticated == `false) begin
          $display("Account number or password was incorrect");
          currState = `WAITING;
        end
      end


      `BALANCE: begin
        balance = balance_database[accIndex];
        $display("Account %d has balance %d", accNumber, balance_database[accIndex]);
        currState = `MENU;
      end


      `WITHDRAW: begin
          if (amount <= balance_database[accIndex]) begin
            balance_database[accIndex] = balance_database[accIndex] - amount;
            balance = balance_database[accIndex];
            currState = `MENU;
            error = `false;
          end
          else begin
            currState = `MENU;
            error = `true;
          end
      end


      `WITHDRAW_SHOW_BALANCE: begin
          if (amount <= balance_database[accIndex]) begin
            balance_database[accIndex] = balance_database[accIndex] - amount;
            balance = balance_database[accIndex];
            currState = `MENU;
            error = `false;
            $display("Account %d has balance %d after withdrawing %d", accNumber, balance_database[accIndex], amount);
          end
          else begin
            currState = `MENU;
            error = `true;
          end
      end


      `TRANSACTION: begin
        if ((amount <= balance_database[accIndex]) & (wasFound == `true) & (balance_database[accIndex] + amount < 2048)) begin
            currState = `MENU;
            error = `false;
            balance_database[destinationAccIndex] = balance_database[destinationAccIndex] + amount;
            balance_database[accIndex] = balance_database[accIndex] - amount;
            $display("Destination account %d after transaction has a total balance of %d", destinationAcc, balance_database[destinationAccIndex]);
        end
        else begin
            currState = `MENU;
            error = `true;
        end
      end

    endcase 
		

  end

endmodule