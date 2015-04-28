clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.
workspace;  % Make sure the workspace panel is showing.
 

rawimg =imread('cube3.jpg');% imread('TestHT_Chkbd1.bmp');
rawimg= rgb2gray(rawimg)
 fltr4img = [1 2 3 2 1; 2 3 4 3 2; 3 4 6 4 3; 2 3 4 3 2; 1 2 3 2 1];
 fltr4img = fltr4img / sum(fltr4img(:));
 imgfltrd = filter2( fltr4img , rawimg );
 tic;
 [accum, axis_rho, axis_theta, lineprm, lineseg] = ...
     Hough_Grd(imgfltrd, 6, 0.02);
 toc;
 figure(1); imagesc(axis_theta*(180/pi), axis_rho, accum); axis xy;
 xlabel('Theta (degree)'); ylabel('Pho (pixels)');
 title('Accumulation Array from Hough Transform');
 figure(2); imagesc(rawimg); colormap('gray'); axis image;
 DrawLines_2Ends(lineseg);
 title('Raw Image with Line Segments Detected');