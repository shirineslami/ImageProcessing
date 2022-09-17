function [ResultDecrypt , ResultEncrypt] = process2(im)
% This function give an image as input and return encrypted and 
%decrypted image .
%in first step of this function,RC6_init recalled.

[key] = RC6_init ();
% Key of encryption is used for get k of decryption.
k = comp (key);

imR(:,:) = im(:,:,1);

imEncryptR(:,:) = 0;

imDecryptR(:,:) = 0;

[h,w,~] = size (im);
% The input plaintext has 128 bits.
for x = 1 : 4 : h
    for y = 1 : 4 : w
        
        plaintextR=img_2_vec(x,y,imR); 
 
        %encryption
        strcat('Encrypting Block: (',int2str(x),',',int2str(y),')')     
        ciphertextR = cipher (plaintextR , key , 1);
        
        
        %decryption
        strcat('Decrypting Block: (',int2str(x),',',int2str(y),')')
        decrypttextR = cipher(ciphertextR , k , 0);
        
        
        %a is encrypted block
        aR = reshape(ciphertextR , 4 , 4);
        
        %b is decrypted block
        bR = reshape(decrypttextR , 4 , 4);
                        
        for xx = 1 : 4
            for yy = 1 : 4
                imEncryptR(x+xx-1, y+yy-1) = aR(xx, yy);
                
                imDecryptR(x+xx-1, y+yy-1) = bR(xx, yy);
            end
        end
        clear plaintextR plaintextG plaintextB ciphertextR ciphertextG ciphertextB
        clear decrypttextR decrypttextG decrypttextB bR bG bB aR aG aB
    end
end

ResultEncrypt(:,:,1) = imEncryptR(:,:);

ResultDecrypt(:,:,1) = imDecryptR(:,:);