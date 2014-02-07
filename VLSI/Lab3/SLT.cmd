| SLT setup
l binv
h binvb
h op[1]
l opb[1]
h op[0]
l opb[0]

| less = 0
l less
s 5
assert result 0

| less = 1
h less
s 5
assert result 1
