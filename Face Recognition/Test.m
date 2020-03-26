function [im, ff  ]=Test(FinalImages , EigenFaces, meanVec,input)
input
%filename = 'E:\universty\matlab\Face Recognition\inputs\unknown #1.jpg';
filename=input;
input_dir = 'E:\universty\matlab\Face Recognition\Database';
img = FaceDetection(filename)
img=imresize(img,[60 60]);

input_image = rgb2gray(img);
input_image = single(input_image);
input_image = input_image(:,:,1);
[r,c] = size(input_image);
input_image = reshape(input_image',r*c,1);
%[FinalImages , EigenFaces , m,num_images] = Train();
shifted_image = input_image - meanVec;
FinalTestImage = EigenFaces' * shifted_image;
num_images=size(FinalTestImage,1);
Threshold  = 1.3847e+13;

Euclidean_dist = [];

for i = 1:num_images
    temp = ( norm ( FinalTestImage - FinalImages(:,i) ) )^2;
    Euclidean_dist = [Euclidean_dist temp];
end
% %------------Calc Similiarity ----------------%
% 
% for i=1:size(Euclidean_dist,2)
%     similarity_score = arrayfun(@(i) 1 / (1 +Euclidean_dist(1,i)), 1:num_images);
% end
% [match_score, match_ix] = max(similarity_score);
% 
% %---------------------------------------------%
[minimum index] = min(Euclidean_dist)
if minimum <= Threshold
%     subplot(2,2,1)
%     imshow( uint8(img));
%     title('Input');
    filenames = dir(fullfile(input_dir, '*.jpg'));
    ff = fullfile(input_dir , filenames(index).name);
    im=imread(ff);
%     subplot(2,2,2)
%     imshow( im);
%    title('Face Detected');
else
    im=0;
    ff='';
    disp('Unknown ! Catch this person');
end
end