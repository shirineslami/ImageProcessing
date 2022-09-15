 function output = binds(L , R , size)

half = size/2;
output = zeros();

for i = 1 : half
    output(i) = R(i);
end

for i = half+1 : size
    output(i) = L(i-half);
end