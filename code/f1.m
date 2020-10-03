function varargout = f1(varargin)
% F1 MATLAB code for f1.fig
%      F1, by itself, creates a new F1 or raises the existing
%      singleton*.
%
%      H = F1 returns the handle to a new F1 or the handle to
%      the existing singleton*.
%
%      F1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in F1.M with the given input arguments.
%
%      F1('Property','Value',...) creates a new F1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before f1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to f1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help f1

% Last Modified by GUIDE v2.5 26-Apr-2018 14:16:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @f1_OpeningFcn, ...
                   'gui_OutputFcn',  @f1_OutputFcn, ...
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

% --- Executes just before f1 is made visible.
function f1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to f1 (see VARARGIN)

% Choose default command line output for f1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes f1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = f1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles) %read original signal
% hObject handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1 = get (handles.popupmenu1,'value' )
if(val1==1)
    [speech , fs]=audioread('amy.wav');
    speech1=speech(:,1);
    sound(speech1,fs);
elseif(val1==2)
    [speech , fs]=audioread('joey.wav');
    speech1=speech(:,1);
    sound(speech1,fs);
elseif(val1==3)
    [speech , fs]=audioread('kendra.wav');
    speech1=speech(:,1);
    sound(speech1,fs);
elseif(val1==4)
    [speech , fs]=audioread('eric.wav');
    speech1=speech(:,1);
    sound(speech1,fs);
elseif(val1==5)
    [speech , fs]=audioread('emma.wav');
    speech1=speech(:,1);
    sound(speech1,fs);
end
axes(handles.axes1);
plot(speech1),title('Original Signal')
handles.data.speech1 = speech1;
handles.data.fs = fs;
handles.data.val1 = val1;
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles) %take noise from user
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val2 = get (handles.popupmenu2,'value' )
fsize=2205;
if(val2==1)
    noise1=(0.02).*randn(400000,1);
    noise=zeros(fsize+1,175);
    for j=1:175
        noise(:,j)=noise1(  10000+(fsize.*(j-1)) :  10000+ (fsize.*j) )';   
    end
    sound(noise1,fs);
elseif(val2==2)
    [noise1,fs]=audioread('WGN.wav');
    noise=zeros(fsize+1,175);
    for j=1:175
        noise(:,j)=noise1(  10000+(fsize.*(j-1)) :  10000+ (fsize.*j) )';   
    end
    noise=(0.1).*noise;
    sound(noise1,fs);
elseif(val2==3)
    [noise1,fs]=audioread('train.wav');
    noise=zeros(fsize+1,175);
    for j=1:175
        noise(:,j)=noise1(  10000+(fsize.*(j-1)) :  10000+ (fsize.*j) )';   
    end
    sound(noise1,fs);
elseif(val2==4)
    [noise1,fs]=audioread('tcb.wav');
    noise=zeros(fsize+1,175);
    for j=1:175
        noise(:,j)=noise1(  10000+(fsize.*(j-1)) :  10000+ (fsize.*j) )';   
    end
    sound(noise1,fs);
elseif(val2==5)
    [noise1,fs]=audioread('traffic.wav');
    noise=zeros(fsize+1,175);
    for j=1:175
        noise(:,j)=noise1(  10000+(fsize.*(j-1)) :  10000+ (fsize.*j) )';   
    end
    sound(noise1,fs);
end
axes(handles.axes2);
plot(noise1),title('Noise Signal')
handles.data.noise = noise;
handles.data.fsize = fsize;
guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fd=0.050;
fs = handles.data.fs;
fsize=handles.data.fsize;
speech1= handles.data.speech1;
noise= handles.data.noise;
val1=handles.data.val1;
if(val1==5)
    width=165;
else
    width=175;
end
s = zeros(fsize+1,width);
for j=1:width
 s(:,j) = speech1(  10000+(fsize.*(j-1)) :  10000+ (fsize.*j) )';
end 
j=1;k=1;
for j=1:width
    for k=1:2206
        s(k,j) = s(k,j) +  noise(k,j);
    end
end
for l=1:width
    p( ((2206.*l)+ 1): (2206.*(l+1) ) , 1)= s(:,l);
end
sound(p,fs)
axes(handles.axes3);
plot(p),title('Noisy Signal')
handles.data.p = p;
handles.data.s = s;
handles.data.width=width;
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
noise=handles.data.noise;
fs=handles.data.fs;
s=handles.data.s;
width=handles.data.width;
j=1;k=1;
for j=1:width
    for k=1:2206
        y_fft(k,j)= fft(s(k,j));
        d_fft(k,j)=fft(noise(k,j));
    end
end

j=1;k=1;
for j=1:width
    for k=1:2206
       phase(k,j)=angle(y_fft(k,j));
       mag_y(k,j)=abs(y_fft(k,j));
       mag_d(k,j)=abs(d_fft(k,j));
    end
end

Y = mag_y.*mag_y;
D = mag_d.*mag_d;

sum_Y=0;
sum_D=0;
j=1;k=1;
for j=1:width
    for k=1:2206
        sum_Y=sum_Y + Y(k,j);
        sum_D=sum_D + D(k,j);
    end
end

snr=(sum_Y/sum_D);
snr=20.*log10(snr);
snr_diff=20;
alpha = 4- (3/20).*(snr)
beta=0.00040
a=[alpha;beta]
c= 1 ./(alpha+ beta);

S=zeros(2206,width);
j=1;k=1;
for j=1:width
    for k=1:2206
    if( (D(k,j)/Y(k,j)) < c)
        S(k,j) =( Y(k,j) - alpha.*D(k,j));
    else
        S(k,j) = beta.*D(k,j);
    end
    end
end

j=1;k=1;
for j=1:width
    for k=1:2206
        S(k,j)=sqrt(S(k,j));
    end
end
i=sqrt(-1);

j=1;k=1;
for j=1:width
    for k=1:2206
        S(k,j)=ifft( S(k,j).*(exp(i*phase(k,j))) , 'symmetric');
    end
end

for l=1:width
    req( ((2206.*l)+ 1): (2206.*(l+1) ) , 1)= S(:,l);
end
sound(req,fs)
axes(handles.axes4);
plot(req),title('Recovered signals')

set(handles.edit1,'string',alpha);
set(handles.edit2,'string',beta);

handles.data.phase = phase;
handles.data.Y = Y;
handles.data.D = D;
handles.data.width=width;
handles.data.alpha = alpha;
handles.data.beta = beta;
guidata(hObject, handles);



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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
phase=handles.data.phase;
fs=handles.data.fs;
width=handles.data.width;
Y=handles.data.Y ;
D=handles.data.D; 
a=str2num(get(handles.edit1,'string'));
b=str2num(get(handles.edit2,'string'));
alpha=a;
beta=b;
c= 1 ./(alpha+ beta);
S=zeros(2206,width);
j=1;k=1;
for j=1:width
    for k=1:2206
    if( (D(k,j)/Y(k,j)) < c)
        S(k,j) =( Y(k,j) - alpha.*D(k,j));
    else
        S(k,j) = beta.*D(k,j);
    end
    end
end

j=1;k=1;
for j=1:width
    for k=1:2206
        S(k,j)=sqrt(S(k,j));
    end
end
i=sqrt(-1);

j=1;k=1;
for j=1:width
    for k=1:2206
        S(k,j)=ifft( S(k,j).*(exp(i*phase(k,j))) , 'symmetric');
    end
end

for l=1:width
    req( ((2206.*l)+ 1): (2206.*(l+1) ) , 1)= S(:,l);
end
sound(req,fs)
axes(handles.axes4);
plot(req),title('Recovered signals')

set(handles.edit1,'string',alpha);
set(handles.edit2,'string',beta);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
