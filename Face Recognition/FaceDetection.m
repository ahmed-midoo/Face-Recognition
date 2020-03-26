function J = FaseDetection(FileName)
FDetect = vision.CascadeObjectDetector;


I = imread(FileName);

BB = step(FDetect,I);



for i = 1:size(BB,1)
   % rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
    J= imcrop(I,BB(i,:));
   % J = reshape(J',180,200);
   %imshow(J);
end
end