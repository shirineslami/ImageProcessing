function output = bit_slice(input)
% Input is 2*4_box  (64 bits).

for i = 1 : 8
    state = dec2binvec(input(i) , 8);
    for j = 8 : -1 : 1
        output(8*(i-1)+j) = state(9-j);
    end
    
end