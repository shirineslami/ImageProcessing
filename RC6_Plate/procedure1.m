function [A , B , C , D] = procedure1(A, B , C ,D , S)
% This function used for encryption.
% r : round  , w : word
r = 20;
w = 32;
lgw = log2(w);

nn=2;
n=1;

B = add(B , S(1));
D = add(D , S(2));

for i = 1 : r
    temp1 = mult(B , (nn*B+n) , w);
    t = rotl(temp1 , lgw);
    
    temp2 = mult(D , (nn*D+n) , w);
    u = rotl(temp2 , lgw);
    
    temp3 = bitxor(A , t);
    
    x = dec2binvec(u,32);
    x1 = [x(1) , x(2) , x(3), x(4) , x(5)];
    shft = binvec2dec(x1);
    
    temp4 = rotl(temp3 , shft);
    A = add(temp4 , S(2*i + 1));
    
    temp5 = bitxor(C , u);
    
    x = dec2binvec(t,32);
    x1 = [x(1) , x(2) , x(3), x(4) , x(5)];
    shft = binvec2dec(x1);
    
    temp6 = rotl(temp5 , shft);
    C = add (temp6 , S(2*i + 2));

    temp = A;
    A = B;
    B = C;
    C = D;
    D = temp;
end

A = add(A , S(43));
C = add(C , S(44));