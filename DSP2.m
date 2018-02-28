function varargout = DSP2(varargin)
% DSP2 MATLAB code for DSP2.fig
%      DSP2, by itself, creates a new DSP2 or raises the existing
%      singleton*.
%
%      H = DSP2 returns the handle to a new DSP2 or the handle to
%      the existing singleton*.
%
%      DSP2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSP2.M with the given input arguments.
%
%      DSP2('Property','Value',...) creates a new DSP2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DSP2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DSP2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DSP2

% Last Modified by GUIDE v2.5 27-Feb-2018 23:14:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DSP2_OpeningFcn, ...
                   'gui_OutputFcn',  @DSP2_OutputFcn, ...
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


% --- Executes just before DSP2 is made visible.
function DSP2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DSP2 (see VARARGIN)

% Choose default command line output for DSP2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DSP2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DSP2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Select_1st_photo.
function Select_1st_photo_Callback(hObject, eventdata, handles)
% hObject    handle to Select_1st_photo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image1
global Mag1
global Theta1
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
handles.myImage = strcat(pathname, filename);
image1 = imread(handles.myImage);
image1 = rgb2gray(image1);
image1= imresize(image1,[200 200]);
axes(handles.axes1);
imshow(image1);
F1 = fft2(image1);
Mag1 =abs(F1); Theta1 = angle(F1);

% --- Executes on button press in Select_2nd_photo.
function Select_2nd_photo_Callback(hObject, eventdata, handles)
% hObject    handle to Select_2nd_photo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image2
global Mag2
global Theta2
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
handles.myImage = strcat(pathname, filename);
image2 = imread(handles.myImage);
image2 = rgb2gray(image2);
image2= imresize(image2,[200 200]);
axes(handles.axes2);
imshow(image2);
F2 = fft2(image2);
Mag2 =abs(F2); Theta2 = angle(F2);


% --- Executes on button press in Hyprid1.
function Hyprid1_Callback(hObject, eventdata, handles)
% hObject    handle to Hyprid1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global image1
global Mag1
%global Theta1
%global image2
%global Mag2
global Theta2
FHyprid1 = Mag1.*exp(i*Theta2);
ImHyprid1 = ifft2(FHyprid1);
ImHyprid1 = uint8(ImHyprid1);
axes(handles.axes3);
imshow(ImHyprid1);


% --- Executes on button press in Hyprid2.
function Hyprid2_Callback(hObject, eventdata, handles)
% hObject    handle to Hyprid2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Mag2
global Theta1
FHyprid2 = Mag2.*exp(i*Theta1);
ImHyprid2 = ifft2(FHyprid2);
ImHyprid2 = uint8(ImHyprid2);
axes(handles.axes4);
imshow(ImHyprid2);
