function RC6()

clc
%read an image and show encrypting and decryoting of this image.
im = imread('Linux.jpg');
figure;
imshow(im);

process(im);