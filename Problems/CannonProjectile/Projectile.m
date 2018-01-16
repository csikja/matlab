function varargout = Projectile(varargin)
% PROJECTILE M-file for Projectile.fig
%      PROJECTILE, by itself, creates a new PROJECTILE or raises the existing
%      singleton*.
%
%      H = PROJECTILE returns the handle to a new PROJECTILE or the handle to
%      the existing singleton*.
%
%      PROJECTILE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTILE.M with the given input arguments.
%
%      PROJECTILE('Property','Value',...) creates a new PROJECTILE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Projectile_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Projectile_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Projectile

% Last Modified by GUIDE v2.5 08-May-2011 16:35:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Projectile_OpeningFcn, ...
                   'gui_OutputFcn',  @Projectile_OutputFcn, ...
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
end

% --- Executes just before Projectile is made visible.
function Projectile_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Projectile (see VARARGIN)

% Choose default command line output for Projectile
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Open simulink model
open_system('sim_projectile');


% Initial configurations
axes(handles.graphics_out);
grid on;
set(handles.graphics_out, 'NextPlot', 'add');
xlabel('Horizontal distance [m]');
ylabel('Vertical distance [m]');
end

% --- Outputs from this function are returned to the command line.
function varargout = Projectile_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in run_sim.
function run_sim_Callback(hObject, eventdata, handles)

theta = get(handles.input_attitude, 'String');
if get(handles.radiobutton_deg, 'Value') == 1;
    theta = str2num(theta);
    theta = theta * pi / 180;
    theta = num2str(theta);
end
set_param('sim_projectile/initial angle', 'Value', theta);

speed = get(handles.input_speed, 'String');
if get(handles.radiobutton_kmh, 'Value') == 1;
    speed = str2num(speed);
    speed = speed / 3.6;
    speed = num2str(speed);
end
set_param('sim_projectile/initial speed', 'Value', speed);

drag_coeff = 0;
if get(handles.checkbox_drag, 'Value') == 1 
    drag_coeff = get(handles.input_drag, 'String');
end

set_param('sim_projectile/drag coefficient', 'Gain', num2str(drag_coeff));
sim('sim_projectile');

plot(x,y, '-k', 'LineWidth', 1);
plot(x(end),y(end), 'xr', 'MarkerSize', 10, 'LineWidth', 2);

imp_dist = num2str(max(x));
max_height = num2str(max(y));

set(handles.text_impact_distance, 'String', ['Impact distance: ', imp_dist(1:end-3), ' m']);
set(handles.text_max_height, 'String', ['Maximal height: ', max_height(1:end-3), ' m']);

end

function input_attitude_Callback(hObject, eventdata, handles)
    if isempty(str2num(get(hObject, 'String')))
        set(hObject, 'String','0');
    end
end

% --- Executes during object creation, after setting all properties.
function input_attitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_attitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in radiobutton_deg.
function radiobutton_deg_Callback(hObject, eventdata, handles)
    set(handles.radiobutton_rad, 'Value', 0);
    if get(hObject, 'Value') == ''
        set (hObject, 'Value', 1);
    end
end

% --- Executes on button press in radiobutton_rad.
function radiobutton_rad_Callback(hObject, eventdata, handles)
    set(handles.radiobutton_deg, 'Value',0);
    if get(hObject, 'Value') == 0
        set (hObject, 'Value', 1);
    end
end   

function input_speed_Callback(hObject, eventdata, handles)
    if isempty(str2num(get(hObject, 'String')))
        set(hObject, 'String','0');
    end
end


% --- Executes during object creation, after setting all properties.
function input_speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in radiobutton_ms.
function radiobutton_ms_Callback(hObject, eventdata, handles)
    set(handles.radiobutton_kmh, 'Value',0);
    if get(hObject, 'Value') == 0
        set (hObject, 'Value', 1);
    end
end

% --- Executes on button press in radiobutton_kmh.
function radiobutton_kmh_Callback(hObject, eventdata, handles)
    set(handles.radiobutton_ms, 'Value',0);
    if get(hObject, 'Value') == 0
        set (hObject, 'Value', 1);
    end
end


% --- Executes on button press in checkbox_drag.
function checkbox_drag_Callback(hObject, eventdata, handles)
    if get(hObject, 'Value') == 1
        set(handles.input_drag, 'Enable','on');
    end
    if get(hObject, 'Value') == 0
        set(handles.input_drag, 'Enable','off');
    end
end


function input_drag_Callback(hObject, eventdata, handles)
    if isempty(str2num(get(hObject, 'String')))
        set(hObject, 'String','0');
    end
end


% --- Executes during object creation, after setting all properties.
function input_drag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_drag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
    cla(handles.graphics_out);

end
