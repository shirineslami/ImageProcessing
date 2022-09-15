function [ResultDecrypt , ResultEncrypt] = process(im)
% This function give an image as input and return encrypetd  and 
%decrypted image .
%in first step of this function,AES_init recalled.
[s_box, inv_s_box, w, poly_mat, inv_poly_mat] = aes_init;

imR(:,:)=im(:,:,1);
imG(:,:)=im(:,:,2);
imB(:,:)=im(:,:,3);

imEncryptR(:,:) = 0;
imEncryptG(:,:) = 0;
imEncryptB(:,:) = 0;

imDecryptR(:,:) = 0;
imDecryptG(:,:) = 0;
imDecryptB(:,:) = 0;

[h1,w1,~]=size(im);
% The input plaintext has 128 bits.
for y = 1 : 4 : h1
    for x = 1 : 4 : w1
        
        plaintextR = img_2_vec(y, x, imR);
        plaintextG = img_2_vec(y, x, imG);
        plaintextB = img_2_vec(y, x, imB);
        
        %encryption
        strcat('Encrypting Block: (',int2str(y),',',int2str(x),')')     
        ciphertextR = cipher (plaintextR, w, s_box, poly_mat, 1);
        ciphertextG = cipher (plaintextG, w, s_box, poly_mat, 1);
        ciphertextB = cipher (plaintextB, w, s_box, poly_mat, 1);
        
        %decryption
        strcat('Decrypting Block: (',int2str(y),',',int2str(x),')')
        decrypttextR = inv_cipher(ciphertextR, w, inv_s_box, inv_poly_mat, 1);
        decrypttextG = inv_cipher(ciphertextG, w, inv_s_box, inv_poly_mat, 1);
        decrypttextB = inv_cipher(ciphertextB, w, inv_s_box, inv_poly_mat, 1);
        
        %a is encrypted block
        aR = reshape(ciphertextR , 4 , 4);
        aG = reshape(ciphertextG , 4 , 4);
        aB = reshape(ciphertextB , 4 , 4);
        
        %b is decrypted block
        bR = reshape(decrypttextR , 4 , 4);
        bG = reshape(decrypttextG , 4 , 4);
        bB = reshape(decrypttextB , 4 , 4);
        
        for yy = 1 : 4
            for xx = 1 : 4
                imEncryptR(y+yy-1, x+xx-1) = aR(yy, xx);
                imEncryptG(y+yy-1, x+xx-1) = aG(yy, xx);
                imEncryptB(y+yy-1, x+xx-1) = aB(yy, xx);
                
                imDecryptR(y+yy-1, x+xx-1) = bR(yy, xx);
                imDecryptG(y+yy-1, x+xx-1) = bG(yy, xx);
                imDecryptB(y+yy-1, x+xx-1) = bB(yy, xx);
            end
        end
        clear plaintext ciphertext a
    end
end


    ResultEncrypt(:,:,1) = imEncryptR(:,:);
    ResultEncrypt(:,:,2) = imEncryptG(:,:);
    ResultEncrypt(:,:,3) = imEncryptB(:,:);



    ResultDecrypt(:,:,1) = imDecryptR(:,:);
    ResultDecrypt(:,:,2) = imDecryptG(:,:);
    ResultDecrypt(:,:,3) = imDecryptB(:,:);