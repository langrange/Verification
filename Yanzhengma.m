function varargout = Yanzhengma(varargin)
% YANZHENGMA MATLAB code for Yanzhengma.fig
%      YANZHENGMA, by itself, creates a new YANZHENGMA or raises the existing
%      singleton*.
%
%      H = YANZHENGMA returns the handle to a new YANZHENGMA or the handle to
%      the existing singleton*.
%
%      YANZHENGMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YANZHENGMA.M with the given input arguments.
%
%      YANZHENGMA('Property','Value',...) creates a new YANZHENGMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Yanzhengma_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Yanzhengma_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Yanzhengma

% Last Modified by GUIDE v2.5 12-May-2017 18:23:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Yanzhengma_OpeningFcn, ...
                   'gui_OutputFcn',  @Yanzhengma_OutputFcn, ...
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


% --- Executes just before Yanzhengma is made visible.
function Yanzhengma_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Yanzhengma (see VARARGIN)

% Choose default command line output for Yanzhengma
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Yanzhengma wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Yanzhengma_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in OpenImage.
function OpenImage_Callback(hObject, eventdata, handles)
% hObject    handle to OpenImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[filename,pathname]=uigetfile({'*.bmp';'*.jpg';'*.tif';'*.*'},'载入图像');
pathname = 'test/';
global filename ;
if isequal(filename,0)|isequal(pathname,0)
    errordlg('没有选中文件','出错');
    return;
else
    file=[pathname,filename];
    global S ;
    S=file;
    x=imread(file);
    set(handles.axes1,'HandleVisibility','ON');
    axes(handles.axes1);
    imshow(x);
    handles.img=x;
    set(handles.edit1,'String','')
    guidata(hObject,handles);
end
set(handles.axes1,'HandleVisibility','ON');
axes(handles.axes1);

% --- Executes on button press in ShiBie.
function ShiBie_Callback(hObject, eventdata, handles)
% hObject    handle to ShiBie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global S ;
global filename ;
strdisp=Segment(S) ;
%set(handles.edit1,'String',strdisp);
Reality = get(handles.edit1,'String') ;
if (size(Reality)~=4)    
errordlg('数目不对','出错');
else
% Reality = filename(1:4) ;
    EuDistance = double(Reality == strdisp) ;
    Radit = sum(EuDistance)/4.0*100;
    set(handles.edit2,'String',[num2str(Radit) '%']);
end
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

% --------------------------------------------------------------------
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename ;
pathname = 'F:/Caffe/test/';
d = dir(pathname) ;
d = d(3:end);
set(handles.listbox2,'string',{d.name});
Index = get(handles.listbox2,'value') ;
filename = d(Index).name ;
guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
