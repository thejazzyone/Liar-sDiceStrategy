function varargout = MenuGUI(varargin)
% MENUGUI MATLAB code for MenuGUI.fig
%      MENUGUI, by itself, creates a new MENUGUI or raises the existing
%      singleton*.
%
%      H = MENUGUI returns the handle to a new MENUGUI or the handle to
%      the existing singleton*.
%
%      MENUGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MENUGUI.M with the given input arguments.
%
%      MENUGUI('Property','Value',...) creates a new MENUGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MenuGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MenuGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MenuGUI

% Last Modified by GUIDE v2.5 31-Mar-2019 14:43:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MenuGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MenuGUI_OutputFcn, ...
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


% --- Executes just before MenuGUI is made visible.
function MenuGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MenuGUI (see VARARGIN)
backgroundImage = imread('titleimage1.jpg');
imshow(backgroundImage)
% Choose default command line output for MenuGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MenuGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MenuGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in MainMenuSelection.
function MainMenuSelection_Callback(hObject, eventdata, handles)
% hObject    handle to MainMenuSelection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MainMenuSelection contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MainMenuSelection
iM = handles.MainMenuSelection.Value;
if iM == 1
    %Stuff
elseif iM == 2
    simulationsGUI
elseif iM == 3
    AdviceGUI
end

% --- Executes during object creation, after setting all properties.
function MainMenuSelection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MainMenuSelection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
