function varargout = cameraGUI(varargin)
% CAMERAGUI MATLAB code for cameraGUI.fig
%      CAMERAGUI, by itself, creates a new CAMERAGUI or raises the existing
%      singleton*.
%
%      H = CAMERAGUI returns the handle to a new CAMERAGUI or the handle to
%      the existing singleton*.
%
%      CAMERAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAMERAGUI.M with the given input arguments.
%
%      CAMERAGUI('Property','Value',...) creates a new CAMERAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cameraGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cameraGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cameraGUI

% Last Modified by GUIDE v2.5 27-Apr-2017 08:20:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cameraGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @cameraGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before cameraGUI is made visible.
function cameraGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cameraGUI (see VARARGIN)

axes(handles.axes1);

 vid = videoinput('winvideo', 1);
set(vid, 'ReturnedColorSpace', 'RGB');
 hImage=image(zeros(699,1500,1),'Parent',handles.axes1);
 preview(vid,hImage);

% Choose default command line output for cameraGUI

handles.vid=vid;
guidata(hObject, handles);
% Update handles structure


% UIWAIT makes cameraGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cameraGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.vid;


% --- Executes on button press in snapshot.
function snapshot_Callback(hObject, eventdata, handles)
% hObject    handle to snapshot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~isfield(handles, 'vid')
    warndlg('Please do the preview first!');
    return;
end
vid=handles.vid;
img = getsnapshot(vid);
 imshow(img);
  title('Initial Image', 'FontSize', 10);
%   fullImageFileName = fullfile(pwd, 'image/myfirstimage.jpg');
%   imwrite(img,fullImageFileName);
   counter  = 1;
baseDir  = 'E:\universty\matlab\Face Recognition\camera\';
baseName = 'unkown'; % Note that 'wysla is the name i have chosen for my images'
newName  = [baseDir baseName num2str(counter) '.jpg'];
while exist(newName,'file')
counter = counter + 1;
newName = [baseDir baseName num2str(counter) '.jpg'];
end    
imwrite(img, newName);
 delete(vid);
