function output = comp(input)
output = bitxor(input , (2^32)-1) +1;