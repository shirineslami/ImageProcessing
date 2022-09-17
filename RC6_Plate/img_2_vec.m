function plaintext = img_2_vec (y1,x1,im)
%convert an image block to a vector.
t=1;
plaintext=0;
for q=x1:x1+3
    for p=y1:y1+3
        plaintext(t)=im(p,q);
        t=t+1;
    end
end