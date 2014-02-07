module alucontrol(input      [1:0] aluop, 
                  input      [3:0] funct, 
                  output reg [2:0] alucontrol);

	// FUNCT field definitions
	parameter	ADD = 4'b0000;
	parameter	SUB = 4'b0010;
	parameter	AND = 4'b0100;
	parameter	OR  = 4'b0101;
	parameter	SLT = 4'b1010;

	always @(*)
        begin
	        alucontrol <= 3'b000;  //default
		case (aluop) 
			2'b00: alucontrol <= 3'b010; // add (for lb/sb/addi)
			2'b01: alucontrol <= 3'b110; // sub (for beq)
			2'b10: case (funct) 
				ADD: alucontrol <= 3'b010; // add (for add)
				SUB: alucontrol <= 3'b110; // subtract (for sub)
				AND: alucontrol <= 3'b000; // logical and (for and)
				OR:  alucontrol <= 3'b001; // logical or (for or)
				SLT: alucontrol <= 3'b111; // set on less (for slt)
				// no other functions are legal
			endcase
			// aluop=11 is never given
		endcase
         end
endmodule
