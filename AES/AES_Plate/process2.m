function [ResultDecrypt , ResultEncrypt] = process2(im)
% This function give an image as input and return encrypetd  and 
%decrypted image .
%in first step of this function, AES_init recalled.
[s_box, inv_s_box, w, poly_mat, inv_poly_mat] = aes_init();

[h1,w1,~]=size(im);

imR(:,:)=im(:,:,1);

imEncryptR(:,:) = 0;

imDecryptR(:,:) = 0;

for y = 1 : 4 : h1
    for x = 1 : 4 : w1
        
        plaintextR = img_2_vec(y, x, imR);
        
        %encryption
        strcat('Encrypting Block: (',int2str(y),',',int2str(x),')')
        
        ciphertextR = cipher (plaintextR, w, s_box, poly_mat, 1);
        
        %decryption
        strcat('Decrypting Block: (',int2str(y),',',int2str(x),')')
        
        decrypttextR = inv_cipher (ciphertextR, w, inv_s_box, inv_poly_mat, 1);
 
        
        %a is encrypted block
        aR = reshape(ciphertextR , 4 , 4);
                
        %b is decrypted block
        bR = reshape(decrypttextR , 4 , 4);
        
        for yy = 1 : 4
            for xx = 1 : 4
                imEncryptR(y+yy-1, x+xx-1) = aR(yy, xx);
                
                imDecryptR(y+yy-1, x+xx-1) = bR(yy, xx);
            end
        end
        clear plaintextR ciphertextR aR
    end
end
        
     ResultEncrypt(:,:) = imEncryptR(:,:);

     ResultDecrypt(:,:) = imDecryptR(:,:);