function varargout = simple_gui2(varargin)
% SIMPLE_GUI2 MATLAB code for simple_gui2.fig
%      SIMPLE_GUI2, by itself, creates a new SIMPLE_GUI2 or raises the existing
%      singleton*.
%
%      H = SIMPLE_GUI2 returns the handle to a new SIMPLE_GUI2 or the handle to
%      the existing singleton*.
%
%      SIMPLE_GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMPLE_GUI2.M with the given input arguments.
%
%      SIMPLE_GUI2('Property','Value',...) creates a new SIMPLE_GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simple_gui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simple_gui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simple_gui2

% Last Modified by GUIDE v2.5 12-Nov-2014 09:23:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simple_gui2_OpeningFcn, ...
                   'gui_OutputFcn',  @simple_gui2_OutputFcn, ...
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


% --- Executes just before simple_gui2 is made visible.
function simple_gui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simple_gui2 (see VARARGIN)

% Choose default command line output for simple_gui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simple_gui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
amp = get(handles.slider_amp, 'Value');
freq = get(handles.slider_freq, 'Value');

% redrawing the sine curve according to 
% the sliders positions
x = linspace(-3,3);
y = amp*sin(freq*2*pi*x);
handles.sin_curve = plot(x,y);
set(handles.axes, 'YLim', [-3,3])

guidata(hObject, handles)



% --- Outputs from this function are returned to the command line.
function varargout = simple_gui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_amp_Callback(hObject, eventdata, handles)
% hObject    handle to slider_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
amp = get(handles.slider_amp, 'Value');
freq = get(handles.slider_freq, 'Value');

% redrawing the sine curve according to 
% the sliders positions
x = linspace(-3,3);
y = amp*sin(freq*2*pi*x);
set(handles.sin_curve, 'XData', x, 'YData', y);
set(handles.axes, 'YLim', [-3,3])


% --- Executes during object creation, after setting all properties.
function slider_amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

set(hObject, 'Value', 1, 'Min', 0.2, 'Max', 3)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_freq_Callback(hObject, eventdata, handles)
% hObject    handle to slider_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

set(hObject, 'Value', 1, 'Min', 0.2, 'Max', 3)

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
