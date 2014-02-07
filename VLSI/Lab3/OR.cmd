| alu.cmd
| Written 2/6/02 David_Harris@hmc.edu
|
| Simulate the ALU for Lab 3.
| give less, cin known values
l less
l cin


| OR setup
l binv
h binvb
l op[1]
h opb[1]
h op[0]
l opb[0]

| 0 | 0 = 0
l a
l b
s 5
assert result 0

| 0 | 1 = 1
l a
h b
s 5
assert result 1

| 1 | 0 = 1
h a
l b
s 5
assert result 1

| 1 | 1 = 1
h a
h b
s 5
assert result 1
