function varargout = AdviceGUI(varargin)
% ADVICEGUI MATLAB code for AdviceGUI.fig
%      ADVICEGUI, by itself, creates a new ADVICEGUI or raises the existing
%      singleton*.
%
%      H = ADVICEGUI returns the handle to a new ADVICEGUI or the handle to
%      the existing singleton*.
%
%      ADVICEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADVICEGUI.M with the given input arguments.
%
%      ADVICEGUI('Property','Value',...) creates a new ADVICEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AdviceGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AdviceGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AdviceGUI

% Last Modified by GUIDE v2.5 09-Apr-2019 23:17:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AdviceGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @AdviceGUI_OutputFcn, ...
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


% --- Executes just before AdviceGUI is made visible.
function AdviceGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AdviceGUI (see VARARGIN)

% Choose default command line output for AdviceGUI
handles.output = hObject;

% Update handles structure

guidata(hObject, handles);

set(handles.arrow,'visible','off');

handles.pHonestArray.Value = [.5,.5,.5,.5,.5,.5];

%Loads images that are static in the background
avatar = imread('avatar3.jpg');
redcup = imread('redcup1.png');
yellowcup = imread('yellowcup1.png');
greencup = imread('greencup1.png');
orangecup = imread('orangecup1.png');
dbluecup = imread('dbluecup1.png');
axes(handles.dice1);
imshow(avatar);
axes(handles.dice2);
imshow(yellowcup);
axes(handles.dice3);
imshow(greencup);
axes(handles.dice4);
imshow(redcup);
axes(handles.dice5);
imshow(orangecup);
axes(handles.dice6);
imshow(dbluecup);

%Sets background "rectangles"
curBackground = .2;
axes(handles.layoutAxes1);
set(handles.layoutAxes1,'visible','off');
rectangle('position', [0,0,30,30],'FaceColor','blue','Curvature',curBackground);

axes(handles.layoutAxes2);
set(handles.layoutAxes2,'visible','off');
rectangle('position', [0,0,30,30],'FaceColor','blue','Curvature',curBackground);

axes(handles.layoutAxes3);
set(handles.layoutAxes3,'visible','off');
rectangle('position', [0,0,30,30],'FaceColor','blue','Curvature',curBackground);

axes(handles.layoutAxes4);
set(handles.layoutAxes4,'visible','off');
rectangle('position', [0,0,30,30],'FaceColor','white','Curvature',(curBackground+.05));
uistack(handles.layoutAxes4,'bottom');

axes(handles.layoutAxes5);
set(handles.layoutAxes5,'visible','off');
rectangle('position', [0,0,30,30],'FaceColor','black');
uistack(handles.layoutAxes5,'bottom');

axes(handles.layoutAxes6);
set(handles.layoutAxes6,'visible','off');
rectangle('position', [0,0,30,30],'FaceColor',[.85 .05 .05]);
uistack(handles.layoutAxes6,'bottom');


%Creates the black dot for the arrow background
axes(handles.arrowBackground);
set(handles.arrowBackground,'visible','off');
d = 2;
c = [0 0];
pos = [c-d/2 d d];
rectangle('Position',pos,'Curvature',[1 1],'FaceColor','black');

set(handles.nextPlayer, 'UserData',0);

%Sets the initial values for the round counter and dice counter
handles.roundNumber.String = '0';
handles.totalDiceLabel.String = '0';

% UIWAIT makes AdviceGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AdviceGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function userDice1_Callback(hObject, eventdata, handles)
% hObject    handle to userDice1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of userDice1 as text
%        str2double(get(hObject,'String')) returns contents of userDice1 as a double
dice1String = handles.userDice1.String;
dice1Val = str2double(dice1String);
handles.userDice1.Value = dice1Val;

% --- Executes during object creation, after setting all properties.
function userDice1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to userDice1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function userDice2_Callback(hObject, eventdata, handles)
% hObject    handle to userDice2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of userDice2 as text
%        str2double(get(hObject,'String')) returns contents of userDice2 as a double
dice2String = handles.userDice2.String;
dice2Val = str2double(dice2String);
handles.userDice2.Value = dice2Val;

% --- Executes during object creation, after setting all properties.
function userDice2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to userDice2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function userDice3_Callback(hObject, eventdata, handles)
% hObject    handle to userDice3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of userDice3 as text
%        str2double(get(hObject,'String')) returns contents of userDice3 as a double
dice3String = handles.userDice3.String;
dice3Val = str2double(dice3String);
handles.userDice3.Value = dice3Val;

% --- Executes during object creation, after setting all properties.
function userDice3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to userDice3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function userDice4_Callback(hObject, eventdata, handles)
% hObject    handle to userDice4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of userDice4 as text
%        str2double(get(hObject,'String')) returns contents of userDice4 as a double
dice4String = handles.userDice4.String;
dice4Val = str2double(dice4String);
handles.userDice4.Value = dice4Val;

% --- Executes during object creation, after setting all properties.
function userDice4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to userDice4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function userDice5_Callback(hObject, eventdata, handles)
% hObject    handle to userDice5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of userDice5 as text
%        str2double(get(hObject,'String')) returns contents of userDice5 as a double
dice5String = handles.userDice5.String;
dice5Val = str2double(dice5String);
handles.userDice5.Value = dice5Val;

% --- Executes during object creation, after setting all properties.
function userDice5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to userDice5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in roundReset.
function roundReset_Callback(hObject, eventdata, handles)
% hObject    handle to roundReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Calls another gui for the truth/lie data
TruthLiePopUp
uiwait(gcf);

%Transfers data from the TruthLie gui to this gui
lies = zeros(1,6);
truths = zeros(1,6);
lies(1,2) = getappdata(0,'p2lies');
lies(1,3) = getappdata(0,'p3lies');
lies(1,4) = getappdata(0,'p4lies');
lies(1,5) = getappdata(0,'p5lies');
lies(1,6) = getappdata(0,'p6lies');
truths(1,2) = getappdata(0,'p2truths');
truths(1,3) = getappdata(0,'p3truths');
truths(1,4) = getappdata(0,'p4truths');
truths(1,5) = getappdata(0,'p5truths');
truths(1,6) = getappdata(0,'p6truths');
switchArray = zeros(1,6);
switchArray(1,1) = 3;
switchArray(1,2) = getappdata(0,'p2current');
switchArray(1,3) = getappdata(0,'p3current');
switchArray(1,4) = getappdata(0,'p4current');
switchArray(1,5) = getappdata(0,'p5current');
switchArray(1,1) = getappdata(0,'p6current');

%Arranges data that will be necessary for modifying pHonesty
initialPosition = handles.startingPlayer.Value;
totalDice = handles.totalDiceLeft.Value;
nsDice = zeros(1,6);
nsDice(1,1) = handles.dice1Count.Value;
nsDice(1,2) = handles.dice2Count.Value;
nsDice(1,3) = handles.dice3Count.Value;
nsDice(1,4) = handles.dice4Count.Value;
nsDice(1,5) = handles.dice5Count.Value;
nsDice(1,6) = handles.dice6Count.Value;

%Calls the formatting bets function to arrange the bets into a usable format
[formBets,turn] = formatBets(handles.currentBet.Value,initialPosition,nsDice);
formBets{1,end+1}=[0;0;turn];
[handles.pHonestArray,lies,truths] = modifiedpHonestyAdjustG(handles.pHonestArray.Value,lies,truths,switchArray);

rounds = handles.roundNumber.Value;
likelyBS = handles.likelyBS.Value;
handles.likelyBS.Value = changeLikelyBSG(rounds,turn,nsDice,formBets,totalDice,likelyBS);

handles.userDice1.Value = 0;
handles.userDice1.String = '';
handles.userDice2.Value = 0;
handles.userDice2.String = '';
handles.userDice3.Value = 0;
handles.userDice3.String = '';
handles.userDice4.Value = 0;
handles.userDice4.String = '';
handles.userDice5.Value = 0;
handles.userDice5.String = '';

handles.startingPlayer.Value = 0;
handles.startingPlayer.String = '';

handles.roundNumber.String = str2double(handles.roundNumber.String) + 1;
handles.totalDiceLeft.String = str2double(handles.totalDiceLeft.String)- 1;
handles.totalDiceLeft.Value = handles.totalDiceLeft.Value - 1;

handles.diceLoser.String = '';
handles.diceLoser.Value = 0;
handles.currentBet.String = '';
handles.currentBet.Value = 0;

handles.counter.Value = 1;

function startingPlayer_Callback(hObject, eventdata, handles)
% hObject    handle to startingPlayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startingPlayer as text
%        str2double(get(hObject,'String')) returns contents of startingPlayer as a double
arrow = imread('arrow3.png');
arrowG = rgb2gray(arrow);
[nRow,nCol] = size(arrowG);
imageIntensity = arrowG;
for iRow = 1:nRow
    for iCol = 1:nCol
        if imageIntensity(iRow, iCol) > 246;
            imageIntensity(iRow, iCol) = 0;
        end
    end
end
arrow = repmat(imageIntensity,[1,1,3]);
for k = 1:3
    for iRow = 1:nRow
        for iCol = 1:nCol
            if arrow(iRow, iCol,k) > 0
                if k == 2
                    arrow(iRow, iCol,k) = 255;
                else
                    arrow(iRow, iCol,k) = 0;
                end
            end
        end
    end
end

startingPosStr = handles.startingPlayer.String;
startingPos = str2double(startingPosStr);
handles.startingPlayer.Value = startingPos;
axes(handles.arrow);
handles.counter.Value = 0;
set(handles.arrow,'visible','off');
if startingPos == 1
    theta = 270;
elseif startingPos == 2
    theta = 335;
elseif startingPos == 3
    theta = 40;
elseif startingPos == 4
    theta = 90;
elseif startingPos == 5
    theta = 140;
elseif startingPos == 6
    theta = 210;
else
    handles.startingPlayer.String = '';
    theta = 0;
end
if theta ~= 0 
    arrow = imrotate(arrow,theta,'crop');
    imshow(arrow);
end


% --- Executes during object creation, after setting all properties.
function startingPlayer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startingPlayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function currentBet_Callback(hObject, eventdata, handles)
% hObject    handle to currentBet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of currentBet as text
%        str2double(get(hObject,'String')) returns contents of currentBet as a double
unparsedBet = handles.currentBet.String;
if strcmp(unparsedBet(1), '(')
    unparsedBet = unparsedBet(2:end);
end
if strcmp(unparsedBet(2), ',')
    unparsedBet = [unparsedBet(1),unparsedBet(3:end)];
elseif length(unparsedBet) >= 3 && strcmp(unparsedBet(3), ',')
    unparsedBet = [unparsedBet(1:2),unparsedBet(4:end)];
end
if strcmp(unparsedBet(end),')')
    L = length(unparsedBet);
    unparsedBet = unparsedBet(1:(L-1));
end
handles.currentBet.Value = [handles.currentBet.Value , str2double(unparsedBet)];


% --- Executes during object creation, after setting all properties.
function currentBet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to currentBet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nextPlayer.
function nextPlayer_Callback(hObject, eventdata, handles)
% hObject    handle to nextPlayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.arrow);
initialPosition = handles.startingPlayer.Value;

%handles.user.Value = initialPosition;

counter = handles.counter.Value + 1;
position = counter + initialPosition;
handles.counter.Value = handles.counter.Value + 1;

handles.currentBet.String = '';
handles.diceLoser.String = '';
handles.diceLoser.Value = 0;

canPoint1 = true;
canPoint2 = true;
canPoint3 = true;
canPoint4 = true;
canPoint5 = true;
canPoint6 = true;
if handles.dice1Count.Value <= 0
    canPoint1 = false;
end
if handles.dice2Count.Value <= 0
    canPoint2 = false;
end
if handles.dice3Count.Value <= 0
    canPoint3 = false;
end
if handles.dice4Count.Value <= 0
    canPoint4 = false;
end
if handles.dice5Count.Value <= 0
    canPoint5 = false;
end
if handles.dice6Count.Value <= 0
    canPoint6 = false;

end
countThis1 = true;
countThis2 = true;
countThis3 = true;
countThis4 = true;
countThis5 = true;
countThis6 = true;
playersLeft = 6;
if handles.dice1Count.Value == 0 && countThis1
    playersLeft = playersLeft - 1;
    countThis1 = false;
end
if handles.dice2Count.Value == 0 && countThis2
    playersLeft = playersLeft - 1;
    countThis2 = false;
end
if handles.dice3Count.Value == 0 && countThis3
    playersLeft = playersLeft - 1;
    countThis3 = false;
end
if handles.dice4Count.Value == 0 && countThis4
    playersLeft = playersLeft - 1;
    countThis4 = false;
end
if handles.dice5Count.Value == 0 && countThis5
    playersLeft = playersLeft - 1;
    countThis5 = false;
end
if handles.dice6Count.Value == 0 && countThis6
    playersLeft = playersLeft - 1;
    countThis6 = false;
end

while position > 6
    position = position - 6;
end

thetaNotAssigned = true;
if playersLeft > 2
    while thetaNotAssigned     
        if position == 1 && canPoint1 == true
            theta = 270;
            thetaNotAssigned = false;
        elseif position == 2 && canPoint2 == true
            theta = 335;
            thetaNotAssigned = false;
        elseif position == 3 && canPoint3 == true
            theta = 40;
            thetaNotAssigned = false;
        elseif position == 4 && canPoint4 == true
            theta = 90;
            thetaNotAssigned = false;
        elseif position == 5 && canPoint5 == true
            theta = 140;
            thetaNotAssigned = false;
        elseif position == 6 && canPoint6 == true
            theta = 210;
            thetaNotAssigned = false;
        else
            position = position + 1;
            while position > 6
                position = position - 6;
            end
            handles.counter.Value = handles.counter.Value + 1;
        end
    end
else
    while thetaNotAssigned
        isEven = rem(position,2) == 0;
        if canPoint1
            pos1used = true;
            theta1 = 270;
        elseif canPoint2
            pos2used = true;
            theta1 = 335;
        elseif canPoint3
            pos3used = true;
            theta1 = 40;
        elseif canPoint4
            pos4used = true;
            theta1 = 90;
        elseif canPoint5
            pos5used = true;
            theta1 = 140;
        else
            theta1 = 210;
        end
        if canPoint1 && ~pos1used
            theta2 = 270;
        elseif canPoint2 && ~pos2used
            theta2 = 335;
        elseif canPoint3 && ~pos3used
            theta2 = 40;
        elseif canPoint4 && ~pos4used
            theta2 = 90;
        elseif canPoint5 && ~pos5used
            theta2 = 140;
        else
            theta2 = 210;
        end
        
        if isEven
            theta = theta1;
            thetaNotAssigned = false;
        else
            theta = theta2;
            thetaNotAssigned = false;
        end
    end
end

arrow1 = imread('arrow3.png');
arrowG = rgb2gray(arrow1);
[nRow,nCol] = size(arrowG);
imageIntensity = arrowG;
for iRow = 1:nRow
    for iCol = 1:nCol
        if imageIntensity(iRow, iCol) > 246
            imageIntensity(iRow, iCol) = 0;
        end
    end
end
arrow = repmat(imageIntensity,[1,1,3]);
for k = 1:3
    for iRow = 1:nRow
        for iCol = 1:nCol
            if arrow(iRow, iCol,k) > 0
                if k == 2
                    arrow(iRow, iCol,k) = 255;
                else
                    arrow(iRow, iCol,k) = 0;
                end
            end
        end
    end
end
    
arrow = imrotate(arrow,theta,'crop');
imshow(arrow);

function diceLoser_Callback(hObject, eventdata, handles)
% hObject    handle to diceLoser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of diceLoser as text
%        str2double(get(hObject,'String')) returns contents of diceLoser as a double
loserStr = handles.diceLoser.String;
loserVal = str2double(loserStr);
handles.diceLoser.Value = loserVal;
if loserVal == 1
    handles.dice1Count.String = str2double(handles.dice1Count.String) - 1;
    handles.dice1Count.Value = handles.dice1Count.Value - 1;
elseif loserVal == 2
    handles.dice2Count.String = str2double(handles.dice2Count.String) - 1;
    handles.dice2Count.Value = handles.dice2Count.Value - 1;
elseif loserVal == 3
    handles.dice3Count.String = str2double(handles.dice3Count.String) - 1;
    handles.dice3Count.Value = handles.dice3Count.Value - 1;
elseif loserVal == 4
    handles.dice4Count.String = str2double(handles.dice4Count.String) - 1;
    handles.dice4Count.Value = handles.dice4Count.Value - 1;
elseif loserVal == 5
    handles.dice5Count.String = str2double(handles.dice5Count.String) - 1;
    handles.dice5Count.Value = handles.dice5Count.Value - 1;
elseif loserVal == 6
    handles.dice6Count.String = str2double(handles.dice6Count.String) - 1;
    handles.dice6Count.Value = handles.dice6Count.Value - 1;
end

redx = imread('redx3.jpg');

if handles.dice1Count.Value <= 0
    axes(handles.dice1);
    imshow(redx);
end
if handles.dice2Count.Value <= 0
    axes(handles.dice2);
    imshow(redx);
end
if handles.dice3Count.Value <= 0
    axes(handles.dice3);
    imshow(redx);
end
if handles.dice4Count.Value <= 0
    axes(handles.dice4);
    imshow(redx);
end
if handles.dice5Count.Value <= 0
    axes(handles.dice5);
    imshow(redx);
end
if handles.dice6Count.Value <= 0
    axes(handles.dice6);
    imshow(redx);
end

% --- Executes during object creation, after setting all properties.
function diceLoser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diceLoser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in advice.
function advice_Callback(hObject, eventdata, handles)
% hObject    handle to advice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
goDice = zeros(1,5);
goDice(1,1) = handles.userDice1.Value;
goDice(1,2) = handles.userDice2.Value;
goDice(1,3) = handles.userDice3.Value;
goDice(1,4) = handles.userDice4.Value;
goDice(1,5) = handles.userDice5.Value;
totalDice = handles.totalDiceLeft.Value;
a = nonzeros(goDice);
goDice = a';

nsDice = zeros(1,6);
nsDice(1,1) = handles.dice1Count.Value;
nsDice(1,2) = handles.dice2Count.Value;
nsDice(1,3) = handles.dice3Count.Value;
nsDice(1,4) = handles.dice4Count.Value;
nsDice(1,5) = handles.dice5Count.Value;
nsDice(1,6) = handles.dice6Count.Value;

traits.honesty(1) = .4;
traits.trust(1) = .5;
traits.aggressive(1) = .6;
traits.threshold(1) = .65;
traits.shifty(1) = .4;
traits.consideration(1) = .8;

initialPosition = handles.startingPlayer.Value;
turn = 1;
pHonestArray = handles.pHonestArray.Value;

valStr = num2str(handles.currentBet.Value(end));
if handles.currentBet.Value == 0
    areBets = false;
else
    areBets = true;
end

if length(valStr) == 2 && areBets
    quantity = valStr(1:1);
    numb = valStr(2:2);
    quantity = str2double(quantity);
    numb = str2double(numb);
elseif length(valStr) == 3 && areBets
    quantity = valStr(1:2);
    numb = valStr(3:3);
    quantity = str2double(quantity);
    numb = str2double(numb);
end

bs = false;
likelyBS = handles.likelyBS.Value;
%% Generate bet!
if handles.currentBet.Value == 0
    [quantity,identity] = firstTurn(goDice,traits,turn,totalDice);
    advice1 = ['Bet that there are ', num2str(quantity), ' ', num2str(identity),'s'];
    handles.recBet.String = advice1;
else
    formBets = formatBets(handles.currentBet.Value,initialPosition,nsDice);
    [quantity, identity, bs] = normalTurnG(goDice,traits,turn,totalDice,formBets,likelyBS,...
                                           pHonestArray,nsDice, quantity, numb,bs);
    if bs
        advice2 = 'You should call BS!';
    else
        advice2 = ['Bet that there are ', num2str(quantity), ' ', num2str(identity),'s'];
    end
    handles.recBet.String = advice2;
end
