function S = key_expansion(KEY )

L = KEY;
r = 20;   c = 4;
P = 'b7e15163';
Q = '9e3779b9';

% Golden constants
p = hex2dec(P);
q = hex2dec(Q);


% In this step S_array get primary value.
t = 2*r+4;  S(1) = p;
for i = 2 : t
    S(i) = add(S(i-1) , q);
end

% In this step main key incorporates with L_array & S_array.
i = 1;  j = 1;
A = 0; B = 0;

for counter = 1 : 3*t
    sum = add(A,B);
    temp1 = rotl ( add(S(i), sum)  ,3);
    S(i) = temp1;   A = temp1;
    
    x = dec2binvec(sum,32);
    x1 = [x(1) , x(2) , x(3), x(4) , x(5)];
    shft = binvec2dec(x1);
    temp2 = rotl ( add(L(j), sum)  , shft );
    L(j) = temp2;   B = temp2;
    
    i = mod(i+1 , t) + 1;
    j = mod(j+1 , c) + 1;
end