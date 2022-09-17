function [ResultDecrypt , ResultEncrypt] = process2(im)
% This function give an image as input and return encrypted and 
%decrypted image.
%in first step of this function,idea_init recalled.
[key] = idea_init();
% Key of encryption  is used for get k of decryption.
[k] = dec_idea_init(key);

[h,w,~]=size(im);

imR(:,:)=im(:,:,1);

imEncryptR(:,:) = 0;

imDecryptR(:,:) = 0;

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
        
        %b is decrypted block
        bR = reshape(decrypttextR , 4 , 2);
        
        for yy = 1 : 4
            for xx = 1 : 2
                imEncryptR(y+yy-1, x+xx-1) = aR(yy, xx);
                
                imDecryptR(y+yy-1, x+xx-1) = bR(yy, xx);
            end
        end
        clear plaintextR ciphertextR aR
    end
end


    ResultEncrypt(:,:,1) = imEncryptR(:,:);

    ResultDecrypt(:,:,1) = imDecryptR(:,:);