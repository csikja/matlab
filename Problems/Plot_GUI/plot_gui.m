function varargout = plot_gui(varargin)
% PLOT_GUI MATLAB code for plot_gui.fig
%      PLOT_GUI, by itself, creates a new PLOT_GUI or raises the existing
%      singleton*.
%
%      H = PLOT_GUI returns the handle to a new PLOT_GUI or the handle to
%      the existing singleton*.
%
%      PLOT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLOT_GUI.M with the given input arguments.
%
%      PLOT_GUI('Property','Value',...) creates a new PLOT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before plot_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to plot_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help plot_gui

% Last Modified by GUIDE v2.5 24-Nov-2011 09:13:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @plot_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @plot_gui_OutputFcn, ...
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


% --- Executes just before plot_gui is made visible.
function plot_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to plot_gui (see VARARGIN)

% Choose default command line output for plot_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes plot_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.axes1,'NextPlot', 'add');



% --- Outputs from this function are returned to the command line.
function varargout = plot_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu_fn.
function menu_fn_Callback(hObject, eventdata, handles)
% hObject    handle to menu_fn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_fn contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_fn


% --- Executes during object creation, after setting all properties.
function menu_fn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_fn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button1.
function button1_Callback(hObject, eventdata, handles)
% hObject    handle to button1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

x = linspace(-2,2);
fn = get(handles.menu_fn, 'Value');

switch fn
    case 1
        f = sin(x);
    case 2
        f = cos(x);
    case 3
        f = exp(x);
    case 4
        x = x(find(x > 0)); % domain of log
        f = log(x);
    case 5
        x = x(find(x >= 0)); % domain of sqrt
        f = sqrt(x);
    otherwise
        return;
end
plot(handles.axes1, x, f);


% --- Executes on button press in button_reset.
function button_reset_Callback(hObject, eventdata, handles)
% hObject    handle to button_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla(handles.axes1);



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
