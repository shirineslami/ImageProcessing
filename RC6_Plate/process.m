function [ResultDecrypt , ResultEncrypt] = process(im)
% This function give an image as input and return encrypetd  and 
%decrypted image .
%in first step of this function,RC6_init recalled.

[key] = RC6_init();
% Key of encryption  is used for get k of decryption.
k=comp(key);

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
for x = 1 : 4 : h
    for y = 1 : 4 : w
        
        plaintextR=img_2_vec(x,y,imR);
        plaintextG=img_2_vec(x,y,imG);
        plaintextB=img_2_vec(x,y,imB);  
 
        %encryption
        strcat('Encrypting Block: (',int2str(x),',',int2str(y),')')     
        ciphertextR = cipher (plaintextR , key , 1);
        ciphertextG = cipher (plaintextG , key , 1);
        ciphertextB = cipher (plaintextB , key , 1);
        
        
        %decryption
        strcat('Decrypting Block: (',int2str(x),',',int2str(y),')')
        decrypttextR = cipher(ciphertextR , k , 0);
        decrypttextG = cipher(ciphertextG , k , 0);
        decrypttextB = cipher(ciphertextB , k , 0);
        
        
        %a is encrypted block
        aR = reshape(ciphertextR , 4 , 4);
        aG = reshape(ciphertextG , 4 , 4);
        aB = reshape(ciphertextB , 4 , 4);
        
        %b is decrypted block
        bR = reshape(decrypttextR , 4 , 4);
        bG = reshape(decrypttextG , 4 , 4);
        bB = reshape(decrypttextB , 4 , 4);
                        
        for xx = 1 : 4
            for yy = 1 : 4
                imEncryptR(x+xx-1, y+yy-1) = aR(xx, yy);
                imEncryptG(x+xx-1, y+yy-1) = aG(xx, yy);
                imEncryptB(x+xx-1, y+yy-1) = aB(xx, yy);
                
                imDecryptR(x+xx-1, y+yy-1) = bR(xx, yy);
                imDecryptG(x+xx-1, y+yy-1) = bG(xx, yy);
                imDecryptB(x+xx-1, y+yy-1) = bB(xx, yy);
            end
        end
        clear plaintextR plaintextG plaintextB ciphertextR ciphertextG ciphertextB
        clear decrypttextR decrypttextG decrypttextB bR bG bB aR aG aB
    end
end

ResultEncrypt(:,:,1) = imEncryptR(:,:);
ResultEncrypt(:,:,2) = imEncryptG(:,:);
ResultEncrypt(:,:,3) = imEncryptB(:,:);

ResultDecrypt(:,:,1) = imDecryptR(:,:);
ResultDecrypt(:,:,2) = imDecryptG(:,:);
ResultDecrypt(:,:,3) = imDecryptB(:,:);