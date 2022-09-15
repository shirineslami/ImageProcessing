function output = half (input, start , finish)
% This function returns the half of vector.
a = start;

for i = start+1 : finish
    a = [a , i];
end
output = input(a);