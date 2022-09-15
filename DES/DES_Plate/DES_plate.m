function ResultEncrypt = DES_plate()

SIZE = 255;
clc
%read an image and show encrypting and decryoting of this image.
image = imread('cameraman.tif');
nh=128;
nw=128;
im = imresize(image, [nh nw]);


[~,~,l1]=size(im);
if l1 == 1
    tic
    [im1, im2, im3, im4, im5, im6, im7, im8] = bit_plate2(double(im));
    [RD1 , RE1] = process2(im1);
    [RD2 , RE2] = process2(im2);
    [RD3 , RE3] = process2(im3);
    [RD4 , RE4] = process2(im4);
    [RD5 , RE5] = process2(im5);
    [RD6 , RE6] = process2(im6);
    [RD7 , RE7] = process2(im7);
    [RD8 , RE8] = process2(im8);
    ResultEncrypt = inv_bit_plate2(RE1, RE2, RE3, RE4, RE5, RE6, RE7, RE8);
    ResultDecrypt = inv_bit_plate2(RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8);
    toc
else
    tic
    [im1, im2, im3, im4, im5, im6, im7, im8] = bit_plate(double(im));
    [RD1 , RE1] = process(im1);
    [RD2 , RE2] = process(im2);
    [RD3 , RE3] = process(im3);
    [RD4 , RE4] = process(im4);
    [RD5 , RE5] = process(im5);
    [RD6 , RE6] = process(im6);
    [RD7 , RE7] = process(im7);
    [RD8 , RE8] = process(im8);
    ResultEncrypt = inv_bit_plate(RE1, RE2, RE3, RE4, RE5, RE6, RE7, RE8);
    ResultDecrypt = inv_bit_plate(RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8);
    toc
end


figure
subplot(2,3,1);
imshow(im); title('cameraman')

subplot(2,3,2);
imshow(ResultEncrypt/SIZE); title('Encrypted Image')

subplot(2,3,3);
imshow(ResultDecrypt/SIZE); title('Decrypted Image')


subplot(2,3,4);
imhist(im); title('Histogram cameraman')

subplot(2,3,5);
imhist(ResultEncrypt/SIZE); title('Encrypted Histogram')

subplot(2,3,6);
imhist(ResultDecrypt/SIZE); title('Decrypted Histogram');

figure;
subplot(2,4,1);
imshow(RE1/SIZE);

subplot(2,4,2);
imshow(RE2/SIZE);

subplot(2,4,3);
imshow(RE3/SIZE);

subplot(2,4,4);
imshow(RE4/SIZE);

subplot(2,4,5);
imshow(RE5/SIZE);

subplot(2,4,6);
imshow(RE6/SIZE);

subplot(2,4,7);
imshow(RE7/SIZE);

subplot(2,4,8);
imshow(RE8/SIZE);