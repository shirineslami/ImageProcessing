function output = sliceget(input)

for i = 1 : 8
    output(9-i) = uint16( bitsliceget(input , 16*(i) , 16*(i-1)+1));
end