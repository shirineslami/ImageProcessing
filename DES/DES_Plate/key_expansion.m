function k = key_expansion (key)

pre_prm_box = k_pre_permution();
temp = key(pre_prm_box);

right = half(temp' , 29 , 56);
left = half(temp' , 1 , 28);

shift_mat = shift_mat_gen();

shift_box = shift();

for i = 1 : 16
    
    if (shift_box(i) == 1)
        shiftR = right(shift_mat);
        shiftL = left(shift_mat);
        
    else
        temp1 = right(shift_mat);
        temp2 = left(shift_mat);
        shiftR = temp1(shift_mat);
        shiftL = temp2(shift_mat);
    end
   right = shiftR;
   left = shiftL;
   
    bind = binds(shiftR , shiftL , 56);
    
    k(i) = {bind(k_secnd_permution)};
end