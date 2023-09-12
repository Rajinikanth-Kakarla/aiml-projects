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

module authentication(
  input [11:0] accNumber,
  input [3:0] pin,
  input action,
  input deAuth,
  output reg  wasSuccessful,
  output reg [3:0] accIndex
);


  reg [11:0] acc_database [0:9];
  reg [3:0] pin_database [0:9];

  initial begin
    acc_database[0] = 12'd2749; pin_database[0] = 4'b0000;
    acc_database[1] = 12'd2175; pin_database[1] = 4'b0001;
    acc_database[2] = 12'd2429; pin_database[2] = 4'b0010;
    acc_database[3] = 12'd2125; pin_database[3] = 4'b0011;
    acc_database[4] = 12'd2178; pin_database[4] = 4'b0100;
    acc_database[5] = 12'd2647; pin_database[5] = 4'b0101;
    acc_database[6] = 12'd2816; pin_database[6] = 4'b0110;
    acc_database[7] = 12'd2910; pin_database[7] = 4'b0111;
    acc_database[8] = 12'd2299; pin_database[8] = 4'b1000;
    acc_database[9] = 12'd2689; pin_database[9] = 4'b1001;
    end

  always @ (deAuth) begin
    if(deAuth == `true)
      wasSuccessful = 1'bx;
  end
  
  integer i;
  always @(accNumber or pin) begin
      wasSuccessful = `false;
      accIndex = 0;

      for(i = 0; i < 10; i = i+1) begin

          if(accNumber == acc_database[i]) begin
              
              if(action == `FIND) begin
                wasSuccessful = `true;
                accIndex = i;
              end

              if(action == `AUTHENTICATE) begin
                if(pin == pin_database[i]) begin
                  wasSuccessful = `true;
                  accIndex = i;

                end
              end
          end    
      end
  end

endmodule