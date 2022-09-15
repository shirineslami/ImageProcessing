function s_out = s( input )
temp = input;
i = 1;
     b1 = temp(i);
     b2 = temp(i+5);
     b = [b1 , b2];
     row = binvec2dec(b);
     
     a1 = temp(i+1);
     a2 = temp(i+2);
     a3 = temp(i+3);
     a4 = temp(i+4);
     a = [a1 , a2 , a3 , a4];
     col = binvec2dec(a);

     s_box = s_box1_gen();
     state = s_box(row+1, col+1);
     s_out(1) = {dec2binvec(state,4)};
     
i = 7;
     b1 = temp(i);
     b2 = temp(i+5);
     b = [b1 , b2];
     row = binvec2dec(b);
     
     a1 = temp(i+1);
     a2 = temp(i+2);
     a3 = temp(i+3);
     a4 = temp(i+4);
     a = [a1 , a2 , a3 , a4];
     col = binvec2dec(a);
     
     s_box = s_box2_gen();
     state = s_box(row+1, col+1);
     s_out(2) = {dec2binvec(state,4)};
                  
i = 13; 
     b1 = temp(i);
     b2 = temp(i+5);
     b = [b1 , b2];
     row = binvec2dec(b);
     
     a1 = temp(i+1);
     a2 = temp(i+2);
     a3 = temp(i+3);
     a4 = temp(i+4);
     a = [a1 , a2 , a3 , a4];
     col = binvec2dec(a);
     
     s_box = s_box3_gen();
     state = s_box(row+1, col+1);
     s_out(3) = {dec2binvec(state,4)};
     
i = 19;
     b1 = temp(i);
     b2 = temp(i+5);
     b = [b1 , b2];
     row = binvec2dec(b);
     
     a1 = temp(i+1);
     a2 = temp(i+2);
     a3 = temp(i+3);
     a4 = temp(i+4);
     a = [a1 , a2 , a3 , a4];
     col = binvec2dec(a);
     
     s_box = s_box4_gen();
     state = s_box(row+1, col+1);
     s_out(4) = {dec2binvec(state,4)};
     
i = 25;
     b1 = temp(i);
     b2 = temp(i+5);
     b = [b1 , b2];
     row = binvec2dec(b);
     
     a1 = temp(i+1);
     a2 = temp(i+2);
     a3 = temp(i+3);
     a4 = temp(i+4);
     a = [a1 , a2 , a3 , a4];
     col = binvec2dec(a);
     
     s_box = s_box5_gen();
     state = s_box(row+1, col+1);
     s_out(5) = {dec2binvec(state,4)};
                      
i = 31;
     b1 = temp(i);
     b2 = temp(i+5);
     b = [b1 , b2];
     row = binvec2dec(b);
     
     a1 = temp(i+1);
     a2 = temp(i+2);
     a3 = temp(i+3);
     a4 = temp(i+4);
     a = [a1 , a2 , a3 , a4];
     col = binvec2dec(a);
     
     s_box = s_box6_gen();
     state = s_box(row+1, col+1);
     s_out(6) = {dec2binvec(state,4)};
                  
i = 37;
     b1 = temp(i);
     b2 = temp(i+5);
     b = [b1 , b2];
     row = binvec2dec(b);
     
     a1 = temp(i+1);
     a2 = temp(i+2);
     a3 = temp(i+3);
     a4 = temp(i+4);
     a = [a1 , a2 , a3 , a4];
     col = binvec2dec(a);
     
     s_box = s_box7_gen();
     state = s_box(row+1, col+1);
     s_out(7) = {dec2binvec(state,4)};
                
i = 43;
     b1 = temp(i);
     b2 = temp(i+5);
     b = [b1 , b2];
     row = binvec2dec(b);
     
     a1 = temp(i+1);
     a2 = temp(i+2);
     a3 = temp(i+3);
     a4 = temp(i+4);
     a = [a1 , a2 , a3 , a4];
     col = binvec2dec(a);
     
     s_box = s_box8_gen();
     state = s_box(row+1, col+1);
     s_out(8) = {dec2binvec(state,4)};
     