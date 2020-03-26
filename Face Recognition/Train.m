function [FinalImages , EigenFaces, meanVec]=Train()
input_dir = 'E:\universty\matlab\Face Recognition\Database';

filenames = dir(fullfile(input_dir, '*.jpg'));
num_images = numel(filenames);
images = [];
for n = 1:num_images
    filename = fullfile(input_dir, filenames(n).name);
    img = FaceDetection(filename);
    img =rgb2gray(img);
    img=single(img);
    img=imresize(img,[60 60]);
    [irow icol] = size(img);
    temp = reshape(img',irow*icol,1);
    images = [images temp];
end
   [row_Nums,col_Nums] = size(images);
   meanVec = [];
   for i=1:row_Nums
        summ = sum(images(i,:));
        meanVec = [meanVec; summ / col_Nums];
   end
   shifted_images = [];
for i= 1:num_images
    shifted_images = [ shifted_images (images(:,i) - meanVec ) ];
end
cov = shifted_images' * shifted_images;
[eigVec D] = eig(cov);
eigVal =diag(D);
%eigVec=[];
% Threshold = sum(meanVec)
% 
% for i=1:size(V,2)
%     
%    if D(i,i) > Threshold
%        eigVec = [eigVec V(:,i)];
%    end
% end
eigVec_ordered=[];
for i=size(eigVec,2):-1:1
   mx=eigVec(:,i);
   eigVec_ordered = [eigVec_ordered mx];
end
EigenFaces = shifted_images * eigVec;
FinalImages=[];
for i = 1:num_images
    temp = EigenFaces' * shifted_images(:,i);
    FinalImages =[FinalImages temp];
end

end
