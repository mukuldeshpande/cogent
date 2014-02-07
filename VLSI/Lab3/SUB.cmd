| alu.cmd
| Written 2/6/02 David_Harris@hmc.edu
|
| Simulate the ALU for Lab 3.
| give less, cin known values
l less
l cin

| SUB setup
h binv
l binvb
h op[1]
l opb[1]
l op[0]
h opb[0]

| 0 + 0b + 0 = 01 (just test one case to verify inversion works)
l a
l b
l cin
s 5
assert result 1
assert cout 0


