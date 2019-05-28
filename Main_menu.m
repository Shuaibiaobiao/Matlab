function varargout = Main_menu(varargin)
% MAIN_MENU MATLAB code for Main_menu.fig
%      MAIN_MENU, by itself, creates a new MAIN_MENU or raises the existing
%      singleton*.
%
%      H = MAIN_MENU returns the handle to a new MAIN_MENU or the handle to
%      the existing singleton*.
%
%      MAIN_MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_MENU.M with the given input arguments.
%
%      MAIN_MENU('Property','Value',...) creates a new MAIN_MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main_menu

% Last Modified by GUIDE v2.5 29-Nov-2018 10:04:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_menu_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_menu_OutputFcn, ...
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


% --- Executes just before Main_menu is made visible.
function Main_menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main_menu (see VARARGIN)

% Choose default command line output for Main_menu
handles.output = hObject;

ha=axes('units','normalized','pos',[0.17 0.2 0.6 0.6]);
uistack(ha,'down');
ii=imread('timg.jpg');
%设置程序的背景图为beijing1.jpg
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','off');

h = handles.figure1; %返回其句柄
newIcon = javax.swing.ImageIcon('图1.jpg');
figFrame = get(h,'JavaFrame'); %取得Figure的JavaFrame。
figFrame.setFigureIcon(newIcon); %修改图标



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main_menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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
Data_statistics;
close(h);

% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


h=gcf;
Earthquake_catalogue;
close(h);
