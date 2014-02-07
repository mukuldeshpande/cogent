| alucontrol.cmd
| Written 2/12/02 David_Harris@hmc.edu
|
| Simulate the alucontrol block.
| only consider legal instructions

|vector aluop aluop[1] aluop[0]
|vector funct funct[3] funct[2] funct[1] funct[0]
vector alucontrol alucontrol[2] alucontrol[1] alucontrol[0]


l funct[3] 
l funct[2] 
l funct[1] 
l funct[0]

| test always adding
|set aluop 00
l aluop[1] aluop[0]
s 2
assert alucontrol 010

| test always subtracting
|set aluop 01
l aluop[1] 
h aluop[0]
s 2
assert alucontrol 110

| test funct ADD
|set aluop 10
h aluop[1] 
l aluop[0]
|set funct 0000
l funct[3] funct[2] funct[1] funct[0]
s 2
assert alucontrol 010


| test funct SUB
|set aluop 10
h aluop[1] 
l aluop[0]
set funct 0010
l funct[3] 
l funct[2] 
h funct[1] 
l funct[0]
s 2
assert alucontrol 110


| test funct AND
|set aluop 10
h aluop[1] 
l aluop[0]
|set funct 0100
l funct[3] 
h funct[2] 
l funct[1] 
l funct[0]
s 2
assert alucontrol 000

| test funct OR
|set aluop 10
h aluop[1] 
l aluop[0]
|set funct 0101
l funct[3] 
h funct[2] 
l funct[1] 
h funct[0]
s 2
assert alucontrol 001

| test funct SLT
|set aluop 10
h aluop[1] 
l aluop[0]
|set funct 1010
h funct[3] 
l funct[2] 
h funct[1] 
l funct[0]
s 2
assert alucontrol 111

