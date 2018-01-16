function varargout = symchaos(varargin)
% SYMCHAOS M-file for symchaos.fig
%      SYMCHAOS, by itself, creates a new SYMCHAOS or raises the existing
%      singleton*.
%
%      H = SYMCHAOS returns the handle to a new SYMCHAOS or the handle to
%      the existing singleton*.
%
%      SYMCHAOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SYMCHAOS.M with the given input arguments.
%
%      SYMCHAOS('Property','Value',...) creates a new SYMCHAOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before symchaos_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to symchaos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help symchaos

% Last Modified by GUIDE v2.5 18-May-2006 15:48:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @symchaos_OpeningFcn, ...
                   'gui_OutputFcn',  @symchaos_OutputFcn, ...
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


% --- Executes just before symchaos is made visible.
function symchaos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to symchaos (see VARARGIN)

% Choose default command line output for symchaos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes symchaos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = symchaos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Pentagon_Attractor.
function Pentagon_Attractor_Callback(hObject, eventdata, handles)
% hObject    handle to Pentagon_Attractor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N=1000000;

n=5;
lambda=-2.32;
alpha=2.32;
beta=0;
gamma=0.75;
omega=0;
p=0;

X=zeros(2,N);
z=.1+.1i;
M=zeros(512);
for k=1:N
 z=(lambda+alpha*z*conj(z)+beta*real(z^n)+omega*i)*z+gamma*conj(z)^(n-1);
 X(:,k)=[real(z);imag(z)];
 r=floor((real(z)+1.5)*170.66);
 j=floor((imag(z)+1.5)*170.66);
 M(r,j)=M(r,j)+1;
end
line(X(1,:),X(2,:),'Linestyle','none','Marker','.','MarkerSize',1)

map=pink(65);
colormap(map);
image(M)
colorbar


% --- Executes on button press in Halloween.
function Halloween_Callback(hObject, eventdata, handles)
% hObject    handle to Halloween (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N=1000000;

n=6;
lambda=-2.7;
alpha=5.0;
beta=1.5;
gamma=1;
omega=0;
p=0;

X=zeros(2,N);
z=.1+.1i;
M=zeros(512);
for k=1:N
 z=(lambda+alpha*z*conj(z)+beta*real(z^n)+omega*i)*z+gamma*conj(z)^(n-1);
 X(:,k)=[real(z);imag(z)];
 r=floor((real(z)+1.5)*170.66);
 j=floor((imag(z)+1.5)*170.66);
 M(r,j)=M(r,j)+1;
end
line(X(1,:),X(2,:),'Linestyle','none','Marker','.','MarkerSize',1)

map=pink(65);
colormap(map);
image(M)
colorbar


% --- Executes on button press in EmperorsCloak.
function EmperorsCloak_Callback(hObject, eventdata, handles)
% hObject    handle to EmperorsCloak (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N=1000000;

n=5;
lambda=-1.806;
alpha=1.806;
beta=0;
gamma=1;
omega=0;
p=0;

X=zeros(2,N);
z=.1+.1i;
M=zeros(512);
for k=1:N
 z=(lambda+alpha*z*conj(z)+beta*real(z^n)+omega*i)*z+gamma*conj(z)^(n-1);
 X(:,k)=[real(z);imag(z)];
 r=floor((real(z)+1.5)*170.66);
 j=floor((imag(z)+1.5)*170.66);
 M(r,j)=M(r,j)+1;
end
line(X(1,:),X(2,:),'Linestyle','none','Marker','.','MarkerSize',1)


map=hot(65);
colormap(map);
image(M)
colorbar


% --- Executes on button press in Swirling.
function Swirling_Callback(hObject, eventdata, handles)
% hObject    handle to Swirling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N=1000000;

n=4;
lambda=-1.86;
alpha=2;
beta=0;
gamma=1;
omega=0.1;
p=0;

X=zeros(2,N);
z=.1+.1i;
M=zeros(512);
for k=1:N
 z=(lambda+alpha*z*conj(z)+beta*real(z^n)+omega*i)*z+gamma*conj(z)^(n-1);
 X(:,k)=[real(z);imag(z)];
 r=floor((real(z)+1.5)*170.66);
 j=floor((imag(z)+1.5)*170.66);
 M(r,j)=M(r,j)+1;
end
line(X(1,:),X(2,:),'Linestyle','none','Marker','.','MarkerSize',1)


map=hot(65);
colormap(map);
image(M)
colorbar



% --- Executes on button press in Kachina.
function Kachina_Callback(hObject, eventdata, handles)
% hObject    handle to Kachina (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N=1000000;

n=23;
lambda=2.409;
alpha=-2.5;
beta=0;
gamma=0.9;
omega=0;
p=0;

X=zeros(2,N);
z=.1+.1i;
M=zeros(512);
for k=1:N
 z=(lambda+alpha*z*conj(z)+beta*real(z^n)+omega*i)*z+gamma*conj(z)^(n-1);
 X(:,k)=[real(z);imag(z)];
 r=floor((real(z)+1.5)*170.66);
 j=floor((imag(z)+1.5)*170.66);
 M(r,j)=M(r,j)+1;
end
line(X(1,:),X(2,:),'Linestyle','none','Marker','.','MarkerSize',1)


map=bone(45);
colormap(map);
image(M)
colorbar


% --- Executes on button press in Trinity.
function Trinity_Callback(hObject, eventdata, handles)
% hObject    handle to Trinity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

N=1000000;

n=3;
lambda=1.5;
alpha=-1;
beta=0.1;
gamma=-0.805;
omega=0;
p=0;

X=zeros(2,N);
z=.1+.1i;
M=zeros(512);
for k=1:N
 z=(lambda+alpha*z*conj(z)+beta*real(z^n)+omega*i)*z+gamma*conj(z)^(n-1);
 X(:,k)=[real(z);imag(z)];
 r=floor((real(z)+1.5)*170.66);
 j=floor((imag(z)+1.5)*170.66);
 M(r,j)=M(r,j)+1;
end
line(X(1,:),X(2,:),'Linestyle','none','Marker','.','MarkerSize',1)


map=bone(50);
colormap(map);
image(M)
colorbar
