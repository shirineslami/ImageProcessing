function [ResultDecrypt , ResultEncrypt] = process2(im)
% This function give an image as input and return encrypetd  and 
%decrypted image .
%in first step of this function,DES_init recalled.

[key] = des_init();

% Key of encryption  is used for get k of decryption.

for i = 1 : 16
    k(17-i) = {key{i}};
% K(i)s are keys for decryptions.
end

imR(:,:)=im(:,:,1);
% The first dimension of image.

imEncryptR(:,:) = 0;
% The first dimension of encrypted image.

imDecryptR(:,:) = 0;

[h,w,~]=size(im);
% The input plaintext has 128 bits.
for y = 1 : 4 : h
    for x = 1 : 2 : w
        
        plaintextR = img_2_vec(y, x, imR);
        
        %encryption
        strcat('Encrypting Block: (',int2str(y),',',int2str(x),')')     
        ciphertextR = cipher (plaintextR, key);
        
        %decryption
        strcat('Decrypting Block: (',int2str(y),',',int2str(x),')')
        decrypttextR = cipher(ciphertextR, k);
        
        %a is encrypted block
        aR = reshape(ciphertextR , 4 , 2);
        %aR is the first dimension of the encrypted block.
        
        %b is decrypted block
        bR = reshape(decrypttextR , 4 , 2);
        %bR is the first dimension of the decrypted block.
        
        for yy = 1 : 4
            for xx = 1 : 2
                imEncryptR(y+yy-1, x+xx-1) = aR(yy, xx);
                
                imDecryptR(y+yy-1, x+xx-1) = bR(yy, xx);
            end
        end
        clear plaintextR ciphertextR aR
    end
end


    ResultEncrypt(:,:) = imEncryptR(:,:);

    ResultDecrypt(:,:) = imDecryptR(:,:);