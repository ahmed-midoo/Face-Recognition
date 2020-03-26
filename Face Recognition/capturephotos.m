%  vid = videoinput('winvideo',1);
%  img = snapshot('winvideo');
%  preview(vid);
%  start(vid);
%  im=getdata(vid);  % im = getsnapshot(vid); alternative use
%  imshow(im);
%  write(im,'myfirstimage.jpg');
% %vid = videoinput('winvideo', 1);

vid = videoinput('winvideo', 1);
set(vid, 'ReturnedColorSpace', 'RGB');
preview(vid);
 start(vid);
 
 %img = getsnapshot(vid);
% imshow(img);
%  title('Initial Image', 'FontSize', 10);
%  fullImageFileName = fullfile(pwd, 'image/myfirstimage.jpg');
%  imwrite(img,fullImageFileName);
%   
%  delete(vid);
%  
 
%write(img,'C:\Users\ahmed\Desktop\image\myfirstimage.jpg');

% > clc; % Clear command window.
% > clear; % Delete all variables.
% > close all; % Close all figure windows except those created by
% > imtool.
% > imtool close all; % Close all figure windows created by imtool.
% > workspace; % Make sure the workspace panel is showing.
% > fontSize = 36;
% >
% > % Start up the video.
% > vid = videoinput('winvideo', 1, 'RGB24_640x480');
% > vid.FramesPerTrigger = 1;
% > preview(vid);
% > start(vid);
% >
% > % Get image and display it.
% > rgbImage = getdata(vid);
% > subplot(1,2, 1);
% > imshow(rgbImage);
% > title('Initial Image', 'FontSize', fontSize);
% > % Enlarge figure to full screen.
% > set(gcf, 'Position', get(0,'Screensize'));
% >
% > % Save this image to disk.
% > fullImageFileName = fullfile(pwd, 'myfirstimage.jpg');
% > imwrite(rgbImage,fullImageFileName);
% >
% > % Read it back in to check it.
% > recalledImage = imread(fullImageFileName);
% > subplot(1,2, 2);
% > imshow(recalledImage);
% > title('Recalled Image', 'FontSize', fontSize);
% >
% > % Delete the file.
% > delete(fullImageFileName); 



% savepath = 'D:\karthi\s10';  %the folder
% nametemplate = 'image_%04d.tif';  %name pattern
% 
% imnum = 0;        %starting image number
% 
% for K = 1 : 50    %if you want to do this 50 times
%    YourImage = ... %capture the image
%    imnum = imnum + 1;
%    thisfile = sprintf(nametemplate, imnum);  %create filename
%    fullname = fullfile(savepath, thisfile);  %folder and all
%    imwrite( YourImage, fullname);  %write the image there as tif
% end




