| alu.cmd
| Written 2/6/02 David_Harris@hmc.edu
|
| Simulate the ALU for Lab 3.
| give less, cin known values
l less
l cin


| ADD setup
l binv
h binvb
h op[1]
l opb[1]
l op[0]
h opb[0]

| 0 + 0 + 0 = 00
l a
l b
l cin
s 5
assert result 0
assert cout 0

| 0 + 0 + 1 = 01
l a
l b
h cin
s 5
assert result 1
assert cout 0

| 0 + 1 + 0 = 01
l a
h b
l cin
s 5
assert result 1
assert cout 0

| 0 + 1 + 1 = 10
l a
h b
h cin
s 5
assert result 0
assert cout 1

| 1 + 0 + 0 = 01
h a
l b
l cin
s 5
assert result 1
assert cout 0

| 1 + 0 + 1 = 10
h a
l b
h cin
s 5
assert result 0
assert cout 1

| 1 + 1 + 0 = 10
h a
h b
l cin
s 5
assert result 0
assert cout 1

| 1 + 1 + 1 = 11
h a
h b
h cin
s 5
assert result 1
assert cout 1

