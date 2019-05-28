function varargout = Phase_analysis(varargin)
% PHASE_ANALYSIS MATLAB code for Phase_analysis.fig
%      PHASE_ANALYSIS, by itself, creates a new PHASE_ANALYSIS or raises the existing
%      singleton*.
%
%      H = PHASE_ANALYSIS returns the handle to a new PHASE_ANALYSIS or the handle to
%      the existing singleton*.
%
%      PHASE_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHASE_ANALYSIS.M with the given input arguments.
%
%      PHASE_ANALYSIS('Property','Value',...) creates a new PHASE_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Phase_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Phase_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Phase_analysis

% Last Modified by GUIDE v2.5 28-Nov-2018 16:30:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Phase_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Phase_analysis_OutputFcn, ...
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


% --- Executes just before Phase_analysis is made visible.
function Phase_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Phase_analysis (see VARARGIN)

% Choose default command line output for Phase_analysis
handles.output = hObject;
handles.data=[];


h = handles.figure1; %返回其句柄
newIcon = javax.swing.ImageIcon('图1.jpg');
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Phase_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Phase_analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
output=['程序正在运行'];
set(handles.text5,'string',output,'fontsize',13);
guidata(hObject,handles);
%% choose the txt file
% [handles.filename]=uigetfile({'*txt'}, 'Pick an txt-file'); 
global filename
global data1
global data
global data3
global sout2
global g
global outcd4
global sout1

sout2=[];
data3=[];
outcd4={};
outcd5={};
outcd6={};
zysd=str2num(char(data(g,6)));
[i,~]=size(data1);

ptt2={};
btt2={};
ttt2={};

for n=1:i
    ptt1(n)=data1(n,1);
    ptt3=str2mat(char(ptt1(n)));
    ptt2=[ptt2;ptt3];
    btt1(n)=data1(n,6);
    btt3=str2mat(char(btt1(n)));
    btt2=[btt2;btt3];
    ttt1(n)=data1(n,7);
    ttt3=str2mat(char(ttt1(n)));
    ttt2=[ttt2;ttt3];
end
outcd1=ptt2;
outcd2=btt2;
outcd3=ttt2;
for n=1:length(outcd1)-1
    if strcmp(outcd1(n),outcd1(n+1))
    else
        outcd4=[outcd4;ptt2(n)];
        outcd5=[outcd5;btt2(n)];
        outcd6=[outcd6;ttt2(n)];
    end
end
for n=1:length(outcd4)
data3=[data3;outcd4(n),outcd5(n),outcd6(n)];
end
for n=1:length(outcd4)
    set(handles.popupmenu1,'string',outcd4);
    if str2double(char(outcd5(n)))<=10
        fx=['近源震'];
    elseif str2double(char(outcd5(n)))<=104
        fx=['远源震'];
    elseif str2double(char(outcd5(n)))<=180
        fx=['极远震'];
     else
        fx=['数据有误或不规范'];
    end
    if zysd<=36
        zs=['浅源地震'];
    elseif zysd<=648
        zs=['深源地震'];
    else
        zs=['数据有误'];
    end
    sout2=[sout2;strcat('台站:',outcd4(n)),strcat('震中距:',outcd5(n),'度'),strcat('方位角:',outcd6(n),'度'),strcat('震源震相:',fx),strcat('深度震相:',zs)]; 
end

switch  g
   case g
       set(handles.text11,'string',sout1((g),:),'fontsize',15);
end
popupmenu1_Callback(hObject, eventdata, handles)
%% print the information in GUI
output=[filename,'已准备好'];
set(handles.text5,'string',output,'fontsize',13);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text10,'string',[]);
global data
global sout2
global picc
global outcd4
picc=0;

[i,~]=size(outcd4);


for n=1:i
    if strcmp(get(handles.edit1,'string'),outcd4(n))
        set(handles.text8,'string',sout2(n,:),'fontsize',15) ;
        set(handles.popupmenu1,'Value',n);
        picc=get(handles.popupmenu1,'Value');
        popupmenu3_Callback(hObject, eventdata, handles)
    end
end
if picc==0 
    set(handles.text8,'string','此地区数据不存在','fontsize',15);
end  




% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

global sout2

set(handles.popupmenu3,'Value',1);
set(handles.popupmenu3,'string',[]);
set(handles.text10,'string',[]) ;


switch  get(handles.popupmenu1,'Value') 
   case get(handles.popupmenu1,'Value')  
      set(handles.text8,'string',sout2(get(handles.popupmenu1,'Value'),:),'fontsize',15) ;
end

popupmenu3_Callback(hObject, eventdata, handles)
%% Update handles structure
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
global data1
global data3
global sout3

[i,~]=size(data1);
sout3={};
data2={};
for n=1:i
if strcmp(data1(n,1),data3(get(handles.popupmenu1,'Value'),1))
    style=[data1(n,2),data1(n,3),data1(n,4),data1(n,5)];
    data2=[data2;style];
end
end

[ii,~]=size(data2);
for n=1:ii
    set(handles.popupmenu3,'string',data2(:,1)); 
    sout3=[sout3;strcat('震相波形:',data2(n,1)),data2(n,2),data2(n,3),data2(n,4)];   

end

switch  get(handles.popupmenu3,'Value') 
   case get(handles.popupmenu3,'Value')  
      set(handles.text10,'string',sout3(get(handles.popupmenu3,'Value'),:),'fontsize',15) ;
end



%% Update handles structure
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sout2
global sout3
global FileName
global path
output=['文本正在保存'];
set(handles.text5,'string',output,'fontsize',13);

fw=fopen([path,FileName],'a');
if isempty(fw)
    return;
else
    h=sout2(get(handles.popupmenu1,'Value'),:);
    h1=sout3(get(handles.popupmenu3,'Value'),:);
    for n=1:length(h)
    fprintf(fw,'%s\n',h{n});
    end
    for n=1:length(h1)
    fprintf(fw,'%s\n',h1{n});
    end
end
 fclose all;
output=[FileName,'文本已保存'];
set(handles.text5,'string',output,'fontsize',13);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data3
global data2
global data1
global data
set(handles.popupmenu1,'Value',1);
set(handles.popupmenu3,'Value',1);
data=[];
data1=[];
data2=[];
data3=[];
set(handles.text8,'string',[]) ;
set(handles.text10,'string',[]) ;


set(handles.popupmenu3,'string',[]);


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
Earthquake_catalogue;
close(h);

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
Data_statistics;
close(h);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on edit1 and none of its controls.
function edit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

set(hObject,'string','','Enable','on');
uicontrol(hObject);
