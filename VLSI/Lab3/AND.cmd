| alu.cmd
| Written 2/6/02 David_Harris@hmc.edu
|
| Simulate the ALU for Lab 3.
| give less, cin known values
l less
l cin

| AND setup
l binv
h binvb
l op[1]
h opb[1]
l op[0]
h opb[0]

| 0 & 0 = 0
l a
l b
s 5
assert result 0

| 0 & 1 = 0
l a
h b
s 5
assert result 0

| 1 & 0 = 0
h a
l b
s 5
assert result 0

| 1 & 1 = 1
h a
h b
s 5
assert result 1

