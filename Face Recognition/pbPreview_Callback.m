function pbPreview_Callback(hObject, eventdata, handles)

vid = videoinput('winvideo', 1);

% only capture one frame per trigger, we are not recording a video

vid.FramesPerTrigger = 1;

% output would image in RGB color space

vid.ReturnedColorspace = 'rgb';

% tell matlab to start the webcam on user request, not automatically

triggerconfig(vid, 'manual');

% we need this to know the image height and width

vidRes = get(vid, 'VideoResolution');

% image width

imWidth = vidRes(1);

% image height

imHeight = vidRes(2);

% number of bands of our image (should be 3 because it's RGB)

nBands = get(vid, 'NumberOfBands');

% create an empty image container and show it on axPreview

hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.axPreview);

% begin the webcam preview

preview(vid, hImage);

% --- Executes on button press in pbCapture.

function pbCapture_Callback(hObject, eventdata, handles)

% hObject    handle to pbCapture (see GCBO)

% eventdata  reserved - to be defined in a future version of MATLAB

% handles    structure with handles and user data (see GUIDATA)

vid = videoinput('winvideo', 1, 'YUY2_176x144');

vid.FramesPerTrigger = 1;

vid.ReturnedColorspace = 'rgb';

triggerconfig(vid, 'manual');

vidRes = get(vid, 'VideoResolution');

imWidth = vidRes(1);

imHeight = vidRes(2);

nBands = get(vid, 'NumberOfBands');

hImage = image(zeros(imHeight, imWidth, nBands), 'parent', handles.axPreview)

preview(vid, hImage);

 x=1;

 %while 1

% prepare for capturing the image preview
start(vid); 

% pause for 3 seconds to give our webcam a "warm-up" time

pause(3); 

% do capture!

trigger(vid);

% stop the preview

stoppreview(vid);

% get the captured image data and save it on capt1 variable

capt1 = getdata(vid);

% now write capt1 into file named captured.png

imwrite(capt1, 'captured.png');

% just dialog that we are done capturing

warndlg('Done!');



function pushbutton3_Callback(hObject, eventdata, handles)

imshow('C:\Documents and Settings\Anita\My Documents\MATLAB\captured.png');