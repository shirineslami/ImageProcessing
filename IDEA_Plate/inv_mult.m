function output = inv_mult(input)

i=1;
output=0;

while(output == 0 && i<65537 )
    if mult(input , i) == 1
        output = i;
    end
    
    i=i+1;
end