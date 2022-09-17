function rot = rotr (Input , n)

input = dec2binvec(Input , 32);

% In this function the input "Rotated" n bit to right.
if n == 0 || n == 32
    rot = Input;
else
    j=1;
    for i = n+1 : 32
        t(j) = input(i);
        j = j+1;
    end
    
    for i = 1 : n
        t(j) = input(i);
        j = j+1;
    end

    rot = binvec2dec(t);
end