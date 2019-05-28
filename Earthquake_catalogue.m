function varargout = Earthquake_catalogue(varargin)
% EARTHQUAKE_CATALOGUE MATLAB code for Earthquake_catalogue.fig
%      EARTHQUAKE_CATALOGUE, by itself, creates a new EARTHQUAKE_CATALOGUE or raises the existing
%      singleton*.
%
%      H = EARTHQUAKE_CATALOGUE returns the handle to a new EARTHQUAKE_CATALOGUE or the handle to
%      the existing singleton*.
%
%      EARTHQUAKE_CATALOGUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EARTHQUAKE_CATALOGUE.M with the given input arguments.
%
%      EARTHQUAKE_CATALOGUE('Property','Value',...) creates a new EARTHQUAKE_CATALOGUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Earthquake_catalogue_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Earthquake_catalogue_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Earthquake_catalogue

% Last Modified by GUIDE v2.5 28-Nov-2018 09:18:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Earthquake_catalogue_OpeningFcn, ...
                   'gui_OutputFcn',  @Earthquake_catalogue_OutputFcn, ...
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


% --- Executes just before Earthquake_catalogue is made visible.
function Earthquake_catalogue_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Earthquake_catalogue (see VARARGIN)

% Choose default command line output for Earthquake_catalogue
handles.output = hObject;
handles.data=[];
handles.data1=[];
handles.data2=[];
handles.data3=[];
a=get(handles.edit1,'string');
disp(a);

% Update handles structure
guidata(hObject, handles);

h = handles.figure1; %返回其句柄
newIcon = javax.swing.ImageIcon('图1.jpg');
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标

% UIWAIT makes Earthquake_catalogue wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Earthquake_catalogue_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.axes1,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
set(handles.axes2,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
axis(handles.axes1,'off');
axis(handles.axes2,'off');


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename
global data

output=['程序正在运行'];
set(handles.text5,'string',output,'fontsize',13);
guidata(hObject,handles);
%% choose the txt file
[filename,handles.path]=uigetfile({'*txt'}, 'Pick an txt-file'); 
addpath(handles.path);
fid=fopen(filename,'r','n','UTF-8');
ybs=0;
data=[];
TT={};
tt={};
ltt={};
lgg={};
edd={};
mbb={};
ptt={};
while ~feof(fid)
    L=fgetl(fid);
    if isempty(L);
    elseif strcmp(L(1:3),'DBO')
       S=regexp(L,'\s+','split');
       T=str2mat(char(S{3}));
       t=str2mat(char(S{4}));
       lt=str2mat(char(S{5}));
       lg=str2mat(char(S{6}));
       ed=str2mat(char(S{7}));
       mb=str2mat(char(S{9}));  
       if strcmp(S{16},'eq') 
              pt=str2mat(char(S{17}));
          else
              pt=str2mat(char(S{16}));
       end
       TT=[TT;T];
       tt=[tt;t];
       ltt=[ltt;lt];
       lgg=[lgg;lg];
       edd=[edd;ed];
       mbb=[mbb;mb];
       ptt=[ptt;pt];
       ybs=ybs+1; 
     end
end
 fclose all;
%% turn the number format data to string format
for i=1:ybs
data=[data;ptt(i),TT(i),tt(i),ltt(i),lgg(i),edd(i),mbb(i)];
end
handles.data=data;

%% print the information in GUI
output=[filename,'已准备好'];
set(handles.text5,'string',output,'fontsize',13);

%% Update handles structure
guidata(hObject,handles);
popupmenu1_Callback(hObject, eventdata, handles);
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global filename
global data
global data1
global data2
global data3
global sout1
global g
global pic
pic=[];
data1=[];
data2=[];
data3=[];
axes(handles.axes1);
cla;
axes(handles.axes2);
cla;
set(handles.text8,'string',[]) ;
set(handles.popupmenu1,'string',[]);

[i,~]=size(handles.data);
sout1=[];
outcd={};
for n=1:i
sout1=[sout1;strcat('发震地点:',handles.data(n,1)),strcat('发震日期:',handles.data(n,2)),strcat('发震时间:',handles.data(n,3)),...
    strcat('震源纬度:',handles.data(n,4),'度'),strcat('震源经度:',handles.data(n,5),'度'),strcat('震源深度:',handles.data(n,6),'千米'),...
    strcat('震级:',handles.data(n,7),'级')];

    ptt(n)=handles.data(n,1);
    outcd=[outcd;ptt(n)];    
    set(handles.popupmenu1,'string',outcd);
end
switch  get(handles.popupmenu1,'Value') 
   case get(handles.popupmenu1,'Value')  
       set(handles.text8,'string',sout1(get(handles.popupmenu1,'Value'),:),'fontsize',15) ;
       fid=fopen(filename,'r','n','UTF-8');
       data1={};
       data4={};
while ~feof(fid)
    L=fgetl(fid);
    if ~isempty(L);
         S=regexp(L,'\s+','split');
      if strcmp(S{1},'DBO')
          time=S{4};
        if strcmp(S{16},'eq') 
              pt1=S{17};
          else
              pt1=S{16};
        end
       elseif strcmp(S{1},'DPB')
             if strcmp(pt1,outcd(get(handles.popupmenu1,'Value')))
             if strcmp(time,handles.data(get(handles.popupmenu1,'Value'),3))    
              if strcmp(S{8},'0')
                 T=[];
                 spwc=[];
                 [~,sj]=size(char(S{10}));
              if sj~=10
                   sat=str2mat(char(S{3}));
                   zxb=str2mat(char(S{7}));
                  spwc=str2mat(char(S{12}));
                  czwc=str2mat(char(S{13}));
                  deta=str2mat(char(S{10}));
                  fwj=str2mat(char(S{11}));                  
                  if isempty(S{14});
                      zj=['nan'];
                  else
                      zj=[S{14},S{15}];
                  end 
              else
                  sat=str2mat(char(S{3}));
                  zxb=str2mat(char(S{7}));
                  T=str2mat(char(S{10}));
                  t=str2mat(char(S{11})); 
                  zswc=str2mat(char(S{12}));
                  if isempty(S{14});
                      zswc=['nan'];
                      deta=str2mat(char(S{12}));
                      fwj=str2mat(char(S{13}));
                  else
                      deta=str2mat(char(S{13}));
                      fwj=str2mat(char(S{14}));
                  end 
              end
      if isempty(T);
          data4={sat,zxb,strcat('振幅:',spwc),strcat('周期:',czwc),strcat('震级:',zj),deta,fwj};
      else
          data4={sat,zxb,strcat('到达日期:',T),strcat('到达时间:',t),strcat('走时误差:',zswc),deta,fwj};  
      end
              elseif strcmp(S{6},'1')
                  sat=str2mat(char(S{3}));
                  zxb=str2mat(char(S{5}));
                  T=str2mat(char(S{8}));
                  t=str2mat(char(S{9})); 
                  if isempty(S{12})
                      zswc=['nan'];
                      deta=str2mat(char(S{10}));
                      fwj=str2mat(char(S{11}));                     
                  elseif str2num(char(S{10}))>=10
                      zswc=['nan'];
                      deta=str2mat(char(S{10}));
                      fwj=str2mat(char(S{11}));
                  else
                      zswc=str2mat(char(S{10}));
                      deta=str2mat(char(S{11}));
                      fwj=str2mat(char(S{12}));
                  end   
                     data4={sat,zxb,strcat('到达日期:',T),strcat('到达时间:',t),strcat('走时误差:',zswc),deta,fwj};  
              end
             data1=[data1;data4];
             end
             end
      end
    end
end
end
g=get(handles.popupmenu1,'Value');
pic=data(get(handles.popupmenu1,'Value'),4:5);
%% turn the number format data to string format
cfz={'nan','nan','nan','nan','nan','nan','nan'};
data1=[data1;cfz];

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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global sout1
global pic
pic=[];
axes(handles.axes1);
cla;
axes(handles.axes2);
cla;
[i,~]=size(handles.data);

for n=1:i
    if strcmp(get(handles.edit1,'string'),handles.data(n,1))
        pic=handles.data(n,4:5);
        set(handles.text8,'string',sout1(n,:),'fontsize',15) ;
    end
end
if isempty(pic)
    set(handles.text8,'string','此地区数据不存在','fontsize',15);
end  


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global pic
global data

la=str2num(char(pic(1,1)));
lon=str2num(char(pic(1,2)));
load topo;
load coast;
axes(handles.axes1);
ax=worldmap(topo,topolegend);
meshm(topo,topolegend);
zlimits = [min(topo(:)) max(topo(:))];
demcmap(zlimits);
setm(ax,'parallellabel','off') % 关闭坐标轴标记
setm(ax,'meridianlabel','off')
plotm(lat,long,'k');
hold on;
plotm(la,lon,'ro','MarkerFaceColor','r');
set(handles.text5,'string','局部放大图绘制中','fontsize',13);

axes(handles.axes2);
load topo;
load coast;
a=la;
b=lon;
latt=[a-14 a+14];
longg=[b-23 b+23];
worldmap(latt,longg);
[LAT,LON]=meshgrid([89.5:-1:-89.5],[0:360]);     %得到矩阵格式的经纬度
pcolorm(LAT,LON,fliplr(topo'));
[LAT2,LON2]=meshgrid([89.5:-0.2:-89.5],[0:0.2:360]);
topo=[topo,topo(:,1)];
topo2=interp2(LAT,LON,fliplr(topo'),LAT2,LON2);
pcolorm(LAT2,LON2,topo2);
demcmap(topo2);
hold on;
plotm(la,lon,'ro','MarkerFaceColor','r');
set(handles.text5,'string','地图已绘制','fontsize',13);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sout1
global FileName
global path
output=['文本正在保存'];
set(handles.text5,'string',output,'fontsize',13);

[FileName,path]=uiputfile({'*.txt'},'保存文本','Untitled'); 
addpath(handles.path);
fw=fopen([path,FileName],'w');
if FileName==0
    return;
else
    h=sout1(get(handles.popupmenu1,'Value'),:);
    for n=1:length(h)
    fprintf(fw,'%s  \n',h{n});
    end
end
 fclose (fw);
output=[FileName,'文本已保存'];
set(handles.text5,'string',output,'fontsize',13);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
output=['图像正在保存'];
set(handles.text5,'string',output,'fontsize',13);
[FileName,PathName]=uiputfile({'*.jpg','JPEG(*.jpg)';'*.bmp','Bitmap(*.bmp)';'*.gif','GIF(*.gif)';'*.*',  'All Files (*.*)'},'保存世界地图','Untitled');
if FileName==0
    return;
else
    h=getframe(handles.axes1);
    imwrite(h.cdata,[PathName,FileName]);
end;
[FileName,PathName]=uiputfile({'*.jpg','JPEG(*.jpg)';'*.bmp','Bitmap(*.bmp)';'*.gif','GIF(*.gif)';'*.*',  'All Files (*.*)'},'保存局部放大图','Untitled');
if FileName==0
    return;
else
    h=getframe(handles.axes2);
    imwrite(h.cdata,[PathName,FileName]);
end;
output=[FileName,'图像已保存'];
set(handles.text5,'string',output,'fontsize',13);
fclose all;
%% Update handles structure
guidata(hObject,handles);



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
h=gcf;
Phase_analysis;
close(h);

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
Data_statistics;
close(h);
