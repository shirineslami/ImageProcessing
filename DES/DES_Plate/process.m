function [ResultDecrypt , ResultEncrypt] = process(im)
% This function give an image as input and return encrypetd  and 
%decrypted image .
%in first step of this function,DES_init recalled.

[key] = des_init();

% Key of encryption  is used for get k of decryption.

for i = 1 : 16
    k(17-i) = {key{i}};
end

imR(:,:)=im(:,:,1);
imG(:,:)=im(:,:,2);
imB(:,:)=im(:,:,3);

imEncryptR(:,:) = 0;
imEncryptG(:,:) = 0;
imEncryptB(:,:) = 0;

imDecryptR(:,:) = 0;
imDecryptG(:,:) = 0;
imDecryptB(:,:) = 0;

[h,w,~]=size(im);
% The input plaintext has 128 bits.
for y = 1 : 4 : h
    for x = 1 : 2 : w
        
        plaintextR = img_2_vec(y, x, imR);
        plaintextG = img_2_vec(y, x, imG);
        plaintextB = img_2_vec(y, x, imB);
        
        %encryption
        strcat('Encrypting Block: (',int2str(y),',',int2str(x),')')     
        ciphertextR = cipher (plaintextR, key);
        ciphertextG = cipher (plaintextG, key);
        ciphertextB = cipher (plaintextB, key);
        
        %decryption
        strcat('Decrypting Block: (',int2str(y),',',int2str(x),')')
        decrypttextR = cipher(double(ciphertextR), k);
        decrypttextG = cipher(double(ciphertextG), k);
        decrypttextB = cipher(double(ciphertextB), k);
        
        %a is encrypted block
        aR = reshape(ciphertextR , 4 , 2);
        aG = reshape(ciphertextG , 4 , 2);
        aB = reshape(ciphertextB , 4 , 2);
        
        %b is decrypted block
        bR = reshape(decrypttextR , 4 , 2);
        bG = reshape(decrypttextG , 4 , 2);
        bB = reshape(decrypttextB , 4 , 2);
        
        for yy = 1 : 4
            for xx = 1 : 2
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