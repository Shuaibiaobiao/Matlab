function varargout = Data_statistics(varargin)
% DATA_STATISTICS MATLAB code for Data_statistics.fig
%      DATA_STATISTICS, by itself, creates a new DATA_STATISTICS or raises the existing
%      singleton*.
%
%      H = DATA_STATISTICS returns the handle to a new DATA_STATISTICS or the handle to
%      the existing singleton*.
%
%      DATA_STATISTICS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATA_STATISTICS.M with the given input arguments.
%
%      DATA_STATISTICS('Property','Value',...) creates a new DATA_STATISTICS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Data_statistics_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Data_statistics_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Data_statistics

% Last Modified by GUIDE v2.5 27-Nov-2018 20:33:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Data_statistics_OpeningFcn, ...
                   'gui_OutputFcn',  @Data_statistics_OutputFcn, ...
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


% --- Executes just before Data_statistics is made visible.
function Data_statistics_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Data_statistics (see VARARGIN)

% Choose default command line output for Data_statistics
handles.output = hObject;
handles.data=[];
handles.data1=[];
handles.data2=[];
handles.data3=[];

h = handles.figure1; %返回其句柄
newIcon = javax.swing.ImageIcon('图1.jpg');
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Data_statistics wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Data_statistics_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.axes1,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
set(handles.axes2,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
set(handles.axes3,'xtick',[],'xticklabel',[],'ytick',[],'yticklabel',[]);
axis(handles.axes1,'off');
axis(handles.axes2,'off');
axis(handles.axes3,'off');
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename
global data
output=['程序正在运行'];
set(handles.text5,'string',output,'fontsize',13);
axes(handles.axes3);
m=str2num(char(data(:,7)));
md=m';
x=1:10;
hist(md,x);
[b,~]=hist(md,x);


[errorNum,xaxis] = hist(md,x); 
for i = 1:length(xaxis)
text(xaxis(i),errorNum(i),num2str(errorNum(i),'%g'),...
    'HorizontalAlignment','center',...
    'VerticalAlignment','bottom','fontsize',12,'color','b')
end
set(gca,'box','off');
h=findobj(gca,'type','patch');
set(h,'FaceColor',[0.4 0.8 0.7],'EdgeColor','k');
set(gca,'XTick',[0 2.5 5 7.5 10 ]);

axes(handles.axes1);
labels = {'0.5级~1.5级','1.5级~2.5级','2.5级~3.5级','3.5级~4.5级','4.5级~5.5级','5.5级~6.5级','6.5级~7.5级','7.5级~8.5级','8.5级~9.5级','9.5级以上'};
ii=find(b~=0);
pie3(b(ii));
freezeColors;
legend(labels(ii),'Location','NorthEastoutside');
set(handles.text5,'string','地图已绘制','fontsize',13);




popupmenu1_Callback(hObject, eventdata, handles);
% Update handles structure
guidata(hObject, handles);

function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global data
global data5

set(handles.popupmenu1,'string',[]);
[i,~]=size(data);
ptt=[];
outcd={};
for n=1:10
    zj=num2str(n);
    ptt=strcat('大于',zj,'级');
    outcd=[outcd;ptt];    
    set(handles.popupmenu1,'string',outcd);
end
switch  get(handles.popupmenu1,'Value') 
   case get(handles.popupmenu1,'Value')  
data5=[];
m=str2num(char(data(:,7)));
la=str2num(char(data(:,4)));
lo=str2num(char(data(:,5)));
md=m';
lat=la';
lon=lo';
for n=1:i
if md(n)>get(handles.popupmenu1,'Value')
data5=[data5;md(n),lat(n),lon(n)];
end
end
end
% Update handles structure
guidata(hObject, handles);
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

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global data5
[i,~]=size(data5);
load topo;
load coast;
axes(handles.axes2);
ax=worldmap(topo,topolegend);
meshm(topo,topolegend);
zlimits = [min(topo(:)) max(topo(:))];
demcmap(zlimits);
setm(ax,'parallellabel','off') % 关闭坐标轴标记
setm(ax,'meridianlabel','off')
plotm(lat,long,'k');
for n=1:i
    la(n)=data5(n,2);
    lon(n)=data5(n,3);
    hold on;
    plotm(la(n),lon(n),'ro','MarkerFaceColor','r');
end
set(handles.text5,'string','地图已绘制','fontsize',13);
% Update handles structure
guidata(hObject, handles);
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
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
[FileName,PathName]=uiputfile({'*.jpg','JPEG(*.jpg)';'*.bmp','Bitmap(*.bmp)';'*.gif','GIF(*.gif)';'*.*',  'All Files (*.*)'},'保存饼状图','Untitled');
if FileName==0
    return;
else
    h=getframe(handles.axes2);
    imwrite(h.cdata,[PathName,FileName]);
end;
[FileName,PathName]=uiputfile({'*.jpg','JPEG(*.jpg)';'*.bmp','Bitmap(*.bmp)';'*.gif','GIF(*.gif)';'*.*',  'All Files (*.*)'},'保存柱状图','Untitled');
if FileName==0
    return;
else
    h=getframe(handles.axes3);
    imwrite(h.cdata,[PathName,FileName]);
end;
output=[FileName,'图像已保存'];
set(handles.text5,'string',output,'fontsize',13);
fclose all;
% Update handles structure
guidata(hObject, handles);



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
h=gcf;
Earthquake_catalogue;
close(h);

% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
