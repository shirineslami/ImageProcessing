function output = compact (input , size)
temp = input;
t = size/8;

for i = 1 : t

    a = 8*(i-1);
    s1 = temp(a + 1);
    s2 = temp(a + 2);
    s3 = temp(a + 3);
    s4 = temp(a + 4);
    s5 = temp(a + 5);
    s6 = temp(a + 6);
    s7 = temp(a + 7);
    s8 = temp(a + 8);
    
    s = [s8, s7, s6, s5, s4, s3, s2, s1];
    output(i) = binvec2dec(s);

end