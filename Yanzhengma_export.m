function varargout = Yanzhengma_export(varargin)
% YANZHENGMA_EXPORT MATLAB code for Yanzhengma_export.fig
%      YANZHENGMA_EXPORT, by itself, creates a new YANZHENGMA_EXPORT or raises the existing
%      singleton*.
%
%      H = YANZHENGMA_EXPORT returns the handle to a new YANZHENGMA_EXPORT or the handle to
%      the existing singleton*.
%
%      YANZHENGMA_EXPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YANZHENGMA_EXPORT.M with the given input arguments.
%
%      YANZHENGMA_EXPORT('Property','Value',...) creates a new YANZHENGMA_EXPORT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Yanzhengma_export_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Yanzhengma_export_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Yanzhengma_export

% Last Modified by GUIDE v2.5 12-May-2017 20:28:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Yanzhengma_export_OpeningFcn, ...
                   'gui_OutputFcn',  @Yanzhengma_export_OutputFcn, ...
                   'gui_LayoutFcn',  @Yanzhengma_export_LayoutFcn, ...
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


% --- Executes just before Yanzhengma_export is made visible.
function Yanzhengma_export_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Yanzhengma_export (see VARARGIN)

% Choose default command line output for Yanzhengma_export
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Yanzhengma_export wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Yanzhengma_export_OutputFcn(hObject, eventdata, handles) 
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
%[filename,pathname]=uigetfile({'*.bmp';'*.jpg';'*.tif';'*.*'},'����ͼ��');
pathname = 'F:/Caffe/test/';
global filename ;
if isequal(filename,0)|isequal(pathname,0)
    errordlg('û��ѡ���ļ�','����');
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
errordlg('��Ŀ����','����');
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


% --- Creates and returns a handle to the GUI figure. 
function h1 = Yanzhengma_export_LayoutFcn(policy)
% policy - create a new figure or use a singleton. 'new' or 'reuse'.

persistent hsingleton;
if strcmpi(policy, 'reuse') & ishandle(hsingleton)
    h1 = hsingleton;
    return;
end

appdata = [];
appdata.GUIDEOptions = struct(...
    'active_h', -1, ...
    'taginfo', struct(...
    'figure', 2, ...
    'text', 4, ...
    'pushbutton', 3, ...
    'axes', 2, ...
    'slider', 3, ...
    'edit', 3, ...
    'listbox', 3, ...
    'uitable', 2), ...
    'override', 0, ...
    'release', [], ...
    'resize', 'none', ...
    'accessibility', 'callback', ...
    'mfile', 1, ...
    'callbacks', 1, ...
    'singleton', 1, ...
    'syscolorfig', 1, ...
    'blocking', 0, ...
    'lastSavedFile', 'F:\GitFile\caffe\matlab\demo\Yanzhengma_export.m', ...
    'lastFilename', 'F:\GitFile\caffe\matlab\demo\Yanzhengma.fig');
appdata.lastValidTag = 'figure1';
appdata.GUIDELayoutEditor = [];
appdata.initTags = struct(...
    'handle', [], ...
    'tag', 'figure1');

h1 = figure(...
'PaperUnits','inches',...
'Units','characters',...
'Position',[135.8 52.0769230769231 112 32.3076923076923],...
'PositionMode',get(0,'defaultfigurePositionMode'),...
'Visible',get(0,'defaultfigureVisible'),...
'Color',get(0,'defaultfigureColor'),...
'CurrentAxesMode','manual',...
'IntegerHandle','off',...
'MenuBar','none',...
'Name','Yanzhengma',...
'NumberTitle','off',...
'Tag','figure1',...
'Resize','off',...
'PaperPosition',get(0,'defaultfigurePaperPosition'),...
'PaperSize',[8.5 11],...
'PaperSizeMode',get(0,'defaultfigurePaperSizeMode'),...
'PaperType','usletter',...
'PaperTypeMode',get(0,'defaultfigurePaperTypeMode'),...
'PaperUnitsMode',get(0,'defaultfigurePaperUnitsMode'),...
'ScreenPixelsPerInchMode','manual',...
'HandleVisibility','callback',...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );

appdata = [];
appdata.lastValidTag = 'axes1';

h2 = axes(...
'Parent',h1,...
'FontUnits',get(0,'defaultaxesFontUnits'),...
'Units','characters',...
'CameraPosition',[0.5 0.5 9.16025403784439],...
'CameraPositionMode',get(0,'defaultaxesCameraPositionMode'),...
'CameraTarget',[0.5 0.5 0.5],...
'CameraTargetMode',get(0,'defaultaxesCameraTargetMode'),...
'CameraViewAngle',6.60861036031192,...
'CameraViewAngleMode',get(0,'defaultaxesCameraViewAngleMode'),...
'PlotBoxAspectRatio',[1 0.542372881355932 0.542372881355932],...
'PlotBoxAspectRatioMode',get(0,'defaultaxesPlotBoxAspectRatioMode'),...
'XTick',[0 0.2 0.4 0.6 0.8 1],...
'XTickMode',get(0,'defaultaxesXTickMode'),...
'XTickLabel',{  '0'; '0.2'; '0.4'; '0.6'; '0.8'; '1' },...
'XTickLabelMode',get(0,'defaultaxesXTickLabelMode'),...
'YTick',[0 0.5 1],...
'YTickMode',get(0,'defaultaxesYTickMode'),...
'YTickLabel',{  '0'; '0.5'; '1' },...
'YTickLabelMode',get(0,'defaultaxesYTickLabelMode'),...
'CameraMode',get(0,'defaultaxesCameraMode'),...
'DataSpaceMode',get(0,'defaultaxesDataSpaceMode'),...
'ColorSpaceMode',get(0,'defaultaxesColorSpaceMode'),...
'DecorationContainerMode',get(0,'defaultaxesDecorationContainerMode'),...
'ChildContainerMode',get(0,'defaultaxesChildContainerMode'),...
'XRulerMode',get(0,'defaultaxesXRulerMode'),...
'XBaselineMode',get(0,'defaultaxesXBaselineMode'),...
'YRulerMode',get(0,'defaultaxesYRulerMode'),...
'YBaselineMode',get(0,'defaultaxesYBaselineMode'),...
'ZRulerMode',get(0,'defaultaxesZRulerMode'),...
'ZBaselineMode',get(0,'defaultaxesZBaselineMode'),...
'AmbientLightSourceMode',get(0,'defaultaxesAmbientLightSourceMode'),...
'Tag','axes1',...
'Position',[39.6 20.1428571428571 47.2 9.14285714285714],...
'ActivePositionProperty','position',...
'ActivePositionPropertyMode',get(0,'defaultaxesActivePositionPropertyMode'),...
'LooseInset',[14.56 3.55142857142857 10.64 2.42142857142857],...
'LooseInsetMode',get(0,'defaultaxesLooseInsetMode'),...
'SortMethod','childorder',...
'SortMethodMode',get(0,'defaultaxesSortMethodMode'),...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );

h3 = get(h2,'title');

set(h3,...
'Parent',h2,...
'Units','data',...
'FontUnits','points',...
'DecorationContainer',[],...
'DecorationContainerMode','auto',...
'Color',[0 0 0],...
'ColorMode','auto',...
'Position',[0.500001280994738 1.021484375 0.5],...
'PositionMode','auto',...
'Interpreter','tex',...
'InterpreterMode','auto',...
'Rotation',0,...
'RotationMode','auto',...
'FontName','Helvetica',...
'FontNameMode','auto',...
'FontUnitsMode','auto',...
'FontSize',11,...
'FontSizeMode','auto',...
'FontAngle','normal',...
'FontAngleMode','auto',...
'FontWeight','normal',...
'FontWeightMode','auto',...
'HorizontalAlignment','center',...
'HorizontalAlignmentMode','auto',...
'VerticalAlignment','bottom',...
'VerticalAlignmentMode','auto',...
'EdgeColor','none',...
'EdgeColorMode','auto',...
'LineStyle','-',...
'LineStyleMode','auto',...
'LineWidth',0.5,...
'LineWidthMode','auto',...
'BackgroundColor','none',...
'BackgroundColorMode','auto',...
'Margin',3,...
'MarginMode','auto',...
'Clipping','off',...
'ClippingMode','auto',...
'Layer','middle',...
'LayerMode','auto',...
'FontSmoothing','on',...
'FontSmoothingMode','auto',...
'UnitsMode','auto',...
'IncludeRenderer','on',...
'IsContainer','off',...
'IsContainerMode','auto',...
'HG1EraseMode','auto',...
'BusyAction','queue',...
'Interruptible','on',...
'HitTest','on',...
'HitTestMode','auto',...
'PickableParts','visible',...
'PickablePartsMode','auto',...
'XLimInclude','on',...
'XLimIncludeMode','auto',...
'YLimInclude','on',...
'YLimIncludeMode','auto',...
'ZLimInclude','on',...
'ZLimIncludeMode','auto',...
'CLimInclude','on',...
'CLimIncludeMode','auto',...
'ALimInclude','on',...
'ALimIncludeMode','auto',...
'Description','Axes Title',...
'DescriptionMode','auto',...
'Visible','on',...
'VisibleMode','auto',...
'Serializable','on',...
'SerializableMode','auto',...
'HandleVisibility','off',...
'HandleVisibilityMode','auto',...
'TransformForPrintFcnImplicitInvoke','on',...
'TransformForPrintFcnImplicitInvokeMode','auto');

h4 = get(h2,'xlabel');

set(h4,...
'Parent',h2,...
'Units','data',...
'FontUnits','points',...
'DecorationContainer',[],...
'DecorationContainerMode','auto',...
'Color',[0.15 0.15 0.15],...
'ColorMode','auto',...
'Position',[0.500000476837158 -0.184895829375212 0],...
'PositionMode','auto',...
'Interpreter','tex',...
'InterpreterMode','auto',...
'Rotation',0,...
'RotationMode','auto',...
'FontName','Helvetica',...
'FontNameMode','auto',...
'FontUnitsMode','auto',...
'FontSize',11,...
'FontSizeMode','auto',...
'FontAngle','normal',...
'FontAngleMode','auto',...
'FontWeight','normal',...
'FontWeightMode','auto',...
'HorizontalAlignment','center',...
'HorizontalAlignmentMode','auto',...
'VerticalAlignment','top',...
'VerticalAlignmentMode','auto',...
'EdgeColor','none',...
'EdgeColorMode','auto',...
'LineStyle','-',...
'LineStyleMode','auto',...
'LineWidth',0.5,...
'LineWidthMode','auto',...
'BackgroundColor','none',...
'BackgroundColorMode','auto',...
'Margin',3,...
'MarginMode','auto',...
'Clipping','off',...
'ClippingMode','auto',...
'Layer','back',...
'LayerMode','auto',...
'FontSmoothing','on',...
'FontSmoothingMode','auto',...
'UnitsMode','auto',...
'IncludeRenderer','on',...
'IsContainer','off',...
'IsContainerMode','auto',...
'HG1EraseMode','auto',...
'BusyAction','queue',...
'Interruptible','on',...
'HitTest','on',...
'HitTestMode','auto',...
'PickableParts','visible',...
'PickablePartsMode','auto',...
'XLimInclude','on',...
'XLimIncludeMode','auto',...
'YLimInclude','on',...
'YLimIncludeMode','auto',...
'ZLimInclude','on',...
'ZLimIncludeMode','auto',...
'CLimInclude','on',...
'CLimIncludeMode','auto',...
'ALimInclude','on',...
'ALimIncludeMode','auto',...
'Description','AxisRulerBase Label',...
'DescriptionMode','auto',...
'Visible','on',...
'VisibleMode','auto',...
'Serializable','on',...
'SerializableMode','auto',...
'HandleVisibility','off',...
'HandleVisibilityMode','auto',...
'TransformForPrintFcnImplicitInvoke','on',...
'TransformForPrintFcnImplicitInvokeMode','auto');

h5 = get(h2,'ylabel');

set(h5,...
'Parent',h2,...
'Units','data',...
'FontUnits','points',...
'DecorationContainer',[],...
'DecorationContainerMode','auto',...
'Color',[0.15 0.15 0.15],...
'ColorMode','auto',...
'Position',[-0.120056494775802 0.500000476837158 0],...
'PositionMode','auto',...
'Interpreter','tex',...
'InterpreterMode','auto',...
'Rotation',90,...
'RotationMode','auto',...
'FontName','Helvetica',...
'FontNameMode','auto',...
'FontUnitsMode','auto',...
'FontSize',11,...
'FontSizeMode','auto',...
'FontAngle','normal',...
'FontAngleMode','auto',...
'FontWeight','normal',...
'FontWeightMode','auto',...
'HorizontalAlignment','center',...
'HorizontalAlignmentMode','auto',...
'VerticalAlignment','bottom',...
'VerticalAlignmentMode','auto',...
'EdgeColor','none',...
'EdgeColorMode','auto',...
'LineStyle','-',...
'LineStyleMode','auto',...
'LineWidth',0.5,...
'LineWidthMode','auto',...
'BackgroundColor','none',...
'BackgroundColorMode','auto',...
'Margin',3,...
'MarginMode','auto',...
'Clipping','off',...
'ClippingMode','auto',...
'Layer','back',...
'LayerMode','auto',...
'FontSmoothing','on',...
'FontSmoothingMode','auto',...
'UnitsMode','auto',...
'IncludeRenderer','on',...
'IsContainer','off',...
'IsContainerMode','auto',...
'HG1EraseMode','auto',...
'BusyAction','queue',...
'Interruptible','on',...
'HitTest','on',...
'HitTestMode','auto',...
'PickableParts','visible',...
'PickablePartsMode','auto',...
'XLimInclude','on',...
'XLimIncludeMode','auto',...
'YLimInclude','on',...
'YLimIncludeMode','auto',...
'ZLimInclude','on',...
'ZLimIncludeMode','auto',...
'CLimInclude','on',...
'CLimIncludeMode','auto',...
'ALimInclude','on',...
'ALimIncludeMode','auto',...
'Description','AxisRulerBase Label',...
'DescriptionMode','auto',...
'Visible','on',...
'VisibleMode','auto',...
'Serializable','on',...
'SerializableMode','auto',...
'HandleVisibility','off',...
'HandleVisibilityMode','auto',...
'TransformForPrintFcnImplicitInvoke','on',...
'TransformForPrintFcnImplicitInvokeMode','auto');

h6 = get(h2,'zlabel');

set(h6,...
'Parent',h2,...
'Units','data',...
'FontUnits','points',...
'DecorationContainer',[],...
'DecorationContainerMode','auto',...
'Color',[0.15 0.15 0.15],...
'ColorMode','auto',...
'Position',[0 0 0],...
'PositionMode','auto',...
'Interpreter','tex',...
'InterpreterMode','auto',...
'Rotation',0,...
'RotationMode','auto',...
'FontName','Helvetica',...
'FontNameMode','auto',...
'FontUnitsMode','auto',...
'FontSize',10,...
'FontSizeMode','auto',...
'FontAngle','normal',...
'FontAngleMode','auto',...
'FontWeight','normal',...
'FontWeightMode','auto',...
'HorizontalAlignment','left',...
'HorizontalAlignmentMode','auto',...
'VerticalAlignment','middle',...
'VerticalAlignmentMode','auto',...
'EdgeColor','none',...
'EdgeColorMode','auto',...
'LineStyle','-',...
'LineStyleMode','auto',...
'LineWidth',0.5,...
'LineWidthMode','auto',...
'BackgroundColor','none',...
'BackgroundColorMode','auto',...
'Margin',3,...
'MarginMode','auto',...
'Clipping','off',...
'ClippingMode','auto',...
'Layer','middle',...
'LayerMode','auto',...
'FontSmoothing','on',...
'FontSmoothingMode','auto',...
'UnitsMode','auto',...
'IncludeRenderer','on',...
'IsContainer','off',...
'IsContainerMode','auto',...
'HG1EraseMode','auto',...
'BusyAction','queue',...
'Interruptible','on',...
'HitTest','on',...
'HitTestMode','auto',...
'PickableParts','visible',...
'PickablePartsMode','auto',...
'XLimInclude','on',...
'XLimIncludeMode','auto',...
'YLimInclude','on',...
'YLimIncludeMode','auto',...
'ZLimInclude','on',...
'ZLimIncludeMode','auto',...
'CLimInclude','on',...
'CLimIncludeMode','auto',...
'ALimInclude','on',...
'ALimIncludeMode','auto',...
'Description','AxisRulerBase Label',...
'DescriptionMode','auto',...
'Visible','off',...
'VisibleMode','auto',...
'Serializable','on',...
'SerializableMode','auto',...
'HandleVisibility','off',...
'HandleVisibilityMode','auto',...
'TransformForPrintFcnImplicitInvoke','on',...
'TransformForPrintFcnImplicitInvokeMode','auto');

appdata = [];
appdata.lastValidTag = 'OpenImage';

h7 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Import Image',...
'Style',get(0,'defaultuicontrolStyle'),...
'Position',[41.8 7.21428571428571 17.6 2.07142857142857],...
'Callback',@(hObject,eventdata)Yanzhengma_export('OpenImage_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'Tag','OpenImage',...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );

appdata = [];
appdata.lastValidTag = 'ShiBie';

h8 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','Start',...
'Style',get(0,'defaultuicontrolStyle'),...
'Position',[63.8 7.21428571428571 18 1.92857142857143],...
'Callback',@(hObject,eventdata)Yanzhengma_export('ShiBie_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'Tag','ShiBie',...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );

appdata = [];
appdata.lastValidTag = 'edit1';

h9 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String',{  '�ɱ༭�ı�' },...
'Style','edit',...
'Position',[47.8 14.3571428571429 30.2 1.64285714285714],...
'BackgroundColor',[1 1 1],...
'Callback',@(hObject,eventdata)Yanzhengma_export('edit1_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'CreateFcn', {@local_CreateFcn, @(hObject,eventdata)Yanzhengma_export('edit1_CreateFcn',hObject,eventdata,guidata(hObject)), appdata} ,...
'Tag','edit1');

appdata = [];
appdata.lastValidTag = 'Back';

h10 = uimenu(...
'Parent',h1,...
'Callback',@(hObject,eventdata)Yanzhengma_export('Back_Callback',hObject,eventdata,guidata(hObject)),...
'Label','�˳�',...
'Tag','Back',...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );

appdata = [];
appdata.lastValidTag = 'listbox2';

h11 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String',{  '�б���' },...
'Style','listbox',...
'Value',1,...
'ValueMode',get(0,'defaultuicontrolValueMode'),...
'Position',[2.8 6.5 33.8 22.1428571428571],...
'BackgroundColor',[1 1 1],...
'Callback',@(hObject,eventdata)Yanzhengma_export('listbox2_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'CreateFcn', {@local_CreateFcn, @(hObject,eventdata)Yanzhengma_export('listbox2_CreateFcn',hObject,eventdata,guidata(hObject)), appdata} ,...
'Tag','listbox2');

appdata = [];
appdata.lastValidTag = 'text2';

h12 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','ͼƬ�б�',...
'Style','text',...
'Position',[3 28.6428571428571 33.6 1.64285714285714],...
'BackgroundColor',[1 1 0],...
'Children',[],...
'ForegroundColor',[1 0 0],...
'Tag','text2',...
'FontSize',12,...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );

appdata = [];
appdata.lastValidTag = 'edit2';

h13 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String',{  '�ɱ༭�ı�' },...
'Style','edit',...
'Position',[89.8 7.14285714285714 20.2 21.5],...
'BackgroundColor',[1 1 1],...
'Callback',@(hObject,eventdata)Yanzhengma_export('edit2_Callback',hObject,eventdata,guidata(hObject)),...
'Children',[],...
'CreateFcn', {@local_CreateFcn, @(hObject,eventdata)Yanzhengma_export('edit2_CreateFcn',hObject,eventdata,guidata(hObject)), appdata} ,...
'Tag','edit2');

appdata = [];
appdata.lastValidTag = 'text3';

h14 = uicontrol(...
'Parent',h1,...
'FontUnits',get(0,'defaultuicontrolFontUnits'),...
'Units','characters',...
'String','ƥ����',...
'Style','text',...
'Position',[89.8 28.6428571428571 20.2 1.42857142857143],...
'BackgroundColor',[1 1 0],...
'Children',[],...
'ForegroundColor',[1 0 0],...
'Tag','text3',...
'FontSize',12,...
'CreateFcn', {@local_CreateFcn, blanks(0), appdata} );


hsingleton = h1;


% --- Set application data first then calling the CreateFcn. 
function local_CreateFcn(hObject, eventdata, createfcn, appdata)

if ~isempty(appdata)
   names = fieldnames(appdata);
   for i=1:length(names)
       name = char(names(i));
       setappdata(hObject, name, getfield(appdata,name));
   end
end

if ~isempty(createfcn)
   if isa(createfcn,'function_handle')
       createfcn(hObject, eventdata);
   else
       eval(createfcn);
   end
end


% --- Handles default GUIDE GUI creation and callback dispatch
function varargout = gui_mainfcn(gui_State, varargin)

gui_StateFields =  {'gui_Name'
    'gui_Singleton'
    'gui_OpeningFcn'
    'gui_OutputFcn'
    'gui_LayoutFcn'
    'gui_Callback'};
gui_Mfile = '';
for i=1:length(gui_StateFields)
    if ~isfield(gui_State, gui_StateFields{i})
        error(message('MATLAB:guide:StateFieldNotFound', gui_StateFields{ i }, gui_Mfile));
    elseif isequal(gui_StateFields{i}, 'gui_Name')
        gui_Mfile = [gui_State.(gui_StateFields{i}), '.m'];
    end
end

numargin = length(varargin);

if numargin == 0
    % YANZHENGMA_EXPORT
    % create the GUI only if we are not in the process of loading it
    % already
    gui_Create = true;
elseif local_isInvokeActiveXCallback(gui_State, varargin{:})
    % YANZHENGMA_EXPORT(ACTIVEX,...)
    vin{1} = gui_State.gui_Name;
    vin{2} = [get(varargin{1}.Peer, 'Tag'), '_', varargin{end}];
    vin{3} = varargin{1};
    vin{4} = varargin{end-1};
    vin{5} = guidata(varargin{1}.Peer);
    feval(vin{:});
    return;
elseif local_isInvokeHGCallback(gui_State, varargin{:})
    % YANZHENGMA_EXPORT('CALLBACK',hObject,eventData,handles,...)
    gui_Create = false;
else
    % YANZHENGMA_EXPORT(...)
    % create the GUI and hand varargin to the openingfcn
    gui_Create = true;
end

if ~gui_Create
    % In design time, we need to mark all components possibly created in
    % the coming callback evaluation as non-serializable. This way, they
    % will not be brought into GUIDE and not be saved in the figure file
    % when running/saving the GUI from GUIDE.
    designEval = false;
    if (numargin>1 && ishghandle(varargin{2}))
        fig = varargin{2};
        while ~isempty(fig) && ~ishghandle(fig,'figure')
            fig = get(fig,'parent');
        end
        
        designEval = isappdata(0,'CreatingGUIDEFigure') || (isscalar(fig)&&isprop(fig,'GUIDEFigure'));
    end
        
    if designEval
        beforeChildren = findall(fig);
    end
    
    % evaluate the callback now
    varargin{1} = gui_State.gui_Callback;
    if nargout
        [varargout{1:nargout}] = feval(varargin{:});
    else       
        feval(varargin{:});
    end
    
    % Set serializable of objects created in the above callback to off in
    % design time. Need to check whether figure handle is still valid in
    % case the figure is deleted during the callback dispatching.
    if designEval && ishghandle(fig)
        set(setdiff(findall(fig),beforeChildren), 'Serializable','off');
    end
else
    if gui_State.gui_Singleton
        gui_SingletonOpt = 'reuse';
    else
        gui_SingletonOpt = 'new';
    end

    % Check user passing 'visible' P/V pair first so that its value can be
    % used by oepnfig to prevent flickering
    gui_Visible = 'auto';
    gui_VisibleInput = '';
    for index=1:2:length(varargin)
        if length(varargin) == index || ~ischar(varargin{index})
            break;
        end

        % Recognize 'visible' P/V pair
        len1 = min(length('visible'),length(varargin{index}));
        len2 = min(length('off'),length(varargin{index+1}));
        if ischar(varargin{index+1}) && strncmpi(varargin{index},'visible',len1) && len2 > 1
            if strncmpi(varargin{index+1},'off',len2)
                gui_Visible = 'invisible';
                gui_VisibleInput = 'off';
            elseif strncmpi(varargin{index+1},'on',len2)
                gui_Visible = 'visible';
                gui_VisibleInput = 'on';
            end
        end
    end
    
    % Open fig file with stored settings.  Note: This executes all component
    % specific CreateFunctions with an empty HANDLES structure.

    
    % Do feval on layout code in m-file if it exists
    gui_Exported = ~isempty(gui_State.gui_LayoutFcn);
    % this application data is used to indicate the running mode of a GUIDE
    % GUI to distinguish it from the design mode of the GUI in GUIDE. it is
    % only used by actxproxy at this time.   
    setappdata(0,genvarname(['OpenGuiWhenRunning_', gui_State.gui_Name]),1);
    if gui_Exported
        gui_hFigure = feval(gui_State.gui_LayoutFcn, gui_SingletonOpt);

        % make figure invisible here so that the visibility of figure is
        % consistent in OpeningFcn in the exported GUI case
        if isempty(gui_VisibleInput)
            gui_VisibleInput = get(gui_hFigure,'Visible');
        end
        set(gui_hFigure,'Visible','off')

        % openfig (called by local_openfig below) does this for guis without
        % the LayoutFcn. Be sure to do it here so guis show up on screen.
        movegui(gui_hFigure,'onscreen');
    else
        gui_hFigure = local_openfig(gui_State.gui_Name, gui_SingletonOpt, gui_Visible);
        % If the figure has InGUIInitialization it was not completely created
        % on the last pass.  Delete this handle and try again.
        if isappdata(gui_hFigure, 'InGUIInitialization')
            delete(gui_hFigure);
            gui_hFigure = local_openfig(gui_State.gui_Name, gui_SingletonOpt, gui_Visible);
        end
    end
    if isappdata(0, genvarname(['OpenGuiWhenRunning_', gui_State.gui_Name]))
        rmappdata(0,genvarname(['OpenGuiWhenRunning_', gui_State.gui_Name]));
    end

    % Set flag to indicate starting GUI initialization
    setappdata(gui_hFigure,'InGUIInitialization',1);

    % Fetch GUIDE Application options
    gui_Options = getappdata(gui_hFigure,'GUIDEOptions');
    % Singleton setting in the GUI MATLAB code file takes priority if different
    gui_Options.singleton = gui_State.gui_Singleton;

    if ~isappdata(gui_hFigure,'GUIOnScreen')
        % Adjust background color
        if gui_Options.syscolorfig
            set(gui_hFigure,'Color', get(0,'DefaultUicontrolBackgroundColor'));
        end

        % Generate HANDLES structure and store with GUIDATA. If there is
        % user set GUI data already, keep that also.
        data = guidata(gui_hFigure);
        handles = guihandles(gui_hFigure);
        if ~isempty(handles)
            if isempty(data)
                data = handles;
            else
                names = fieldnames(handles);
                for k=1:length(names)
                    data.(char(names(k)))=handles.(char(names(k)));
                end
            end
        end
        guidata(gui_hFigure, data);
    end

    % Apply input P/V pairs other than 'visible'
    for index=1:2:length(varargin)
        if length(varargin) == index || ~ischar(varargin{index})
            break;
        end

        len1 = min(length('visible'),length(varargin{index}));
        if ~strncmpi(varargin{index},'visible',len1)
            try set(gui_hFigure, varargin{index}, varargin{index+1}), catch break, end
        end
    end

    % If handle visibility is set to 'callback', turn it on until finished
    % with OpeningFcn
    gui_HandleVisibility = get(gui_hFigure,'HandleVisibility');
    if strcmp(gui_HandleVisibility, 'callback')
        set(gui_hFigure,'HandleVisibility', 'on');
    end

    feval(gui_State.gui_OpeningFcn, gui_hFigure, [], guidata(gui_hFigure), varargin{:});

    if isscalar(gui_hFigure) && ishghandle(gui_hFigure)
        % Handle the default callbacks of predefined toolbar tools in this
        % GUI, if any
        guidemfile('restoreToolbarToolPredefinedCallback',gui_hFigure); 
        
        % Update handle visibility
        set(gui_hFigure,'HandleVisibility', gui_HandleVisibility);

        % Call openfig again to pick up the saved visibility or apply the
        % one passed in from the P/V pairs
        if ~gui_Exported
            gui_hFigure = local_openfig(gui_State.gui_Name, 'reuse',gui_Visible);
        elseif ~isempty(gui_VisibleInput)
            set(gui_hFigure,'Visible',gui_VisibleInput);
        end
        if strcmpi(get(gui_hFigure, 'Visible'), 'on')
            figure(gui_hFigure);
            
            if gui_Options.singleton
                setappdata(gui_hFigure,'GUIOnScreen', 1);
            end
        end

        % Done with GUI initialization
        if isappdata(gui_hFigure,'InGUIInitialization')
            rmappdata(gui_hFigure,'InGUIInitialization');
        end

        % If handle visibility is set to 'callback', turn it on until
        % finished with OutputFcn
        gui_HandleVisibility = get(gui_hFigure,'HandleVisibility');
        if strcmp(gui_HandleVisibility, 'callback')
            set(gui_hFigure,'HandleVisibility', 'on');
        end
        gui_Handles = guidata(gui_hFigure);
    else
        gui_Handles = [];
    end

    if nargout
        [varargout{1:nargout}] = feval(gui_State.gui_OutputFcn, gui_hFigure, [], gui_Handles);
    else
        feval(gui_State.gui_OutputFcn, gui_hFigure, [], gui_Handles);
    end

    if isscalar(gui_hFigure) && ishghandle(gui_hFigure)
        set(gui_hFigure,'HandleVisibility', gui_HandleVisibility);
    end
end

function gui_hFigure = local_openfig(name, singleton, visible)

% openfig with three arguments was new from R13. Try to call that first, if
% failed, try the old openfig.
if nargin('openfig') == 2
    % OPENFIG did not accept 3rd input argument until R13,
    % toggle default figure visible to prevent the figure
    % from showing up too soon.
    gui_OldDefaultVisible = get(0,'defaultFigureVisible');
    set(0,'defaultFigureVisible','off');
    gui_hFigure = matlab.hg.internal.openfigLegacy(name, singleton);
    set(0,'defaultFigureVisible',gui_OldDefaultVisible);
else
    % Call version of openfig that accepts 'auto' option"
    gui_hFigure = matlab.hg.internal.openfigLegacy(name, singleton, visible);  
%     %workaround for CreateFcn not called to create ActiveX
%         peers=findobj(findall(allchild(gui_hFigure)),'type','uicontrol','style','text');    
%         for i=1:length(peers)
%             if isappdata(peers(i),'Control')
%                 actxproxy(peers(i));
%             end            
%         end
end

function result = local_isInvokeActiveXCallback(gui_State, varargin)

try
    result = ispc && iscom(varargin{1}) ...
             && isequal(varargin{1},gcbo);
catch
    result = false;
end

function result = local_isInvokeHGCallback(gui_State, varargin)

try
    fhandle = functions(gui_State.gui_Callback);
    result = ~isempty(findstr(gui_State.gui_Name,fhandle.file)) || ...
             (ischar(varargin{1}) ...
             && isequal(ishghandle(varargin{2}), 1) ...
             && (~isempty(strfind(varargin{1},[get(varargin{2}, 'Tag'), '_'])) || ...
                ~isempty(strfind(varargin{1}, '_CreateFcn'))) );
catch
    result = false;
end

