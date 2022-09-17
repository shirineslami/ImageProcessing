function [A , B , C , D] = procedure2(A, B , C ,D , S)
% This function used for decryption.
% r : round  , w : word
r = 20;
w = 32;
lgw = log2(w);

nn=2;
n=1;
C = sub(C , S(44));
A = sub(A , S(43));

for i = r : -1 : 1
    temp = A;
    A = D;
    D = C;
    C = B;
    B = temp;

    temp1 = mult(D , (nn*D+n) , w);
    u = rotl(temp1 , lgw);
    
    temp2 = mult(B , (nn*B+n) , w);
    t = rotl(temp2 , lgw);

    temp3 = sub(C , S(2*i + 2)); %temp3=:temp6 in procedure1
    
    x = dec2binvec(t,32);
    x1 = [x(1) , x(2) , x(3), x(4) , x(5)];
    shft = binvec2dec(x1);
    
    temp4 = rotr(temp3 , shft); %temp4=:temp5 in procedure1
    
    C = bitxor(temp4 , u);
    
    temp5 = sub (A , S(2*i + 1));%temp5=:temp4 in procedure1

    x = dec2binvec(u,32);
    x1 = [x(1) , x(2) , x(3), x(4) , x(5)];
    shft = binvec2dec(x1);
    
    temp6 = rotr(temp5 , shft);%temp6=:temp3 in procedure1
    A = bitxor(temp6 , t);
end

D = sub(D , S(2));
B = sub(B , S(1));