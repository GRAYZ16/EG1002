function varargout = colorPicker(varargin)
% COLORPICKER MATLAB code for colorPicker.fig
%      COLORPICKER, by itself, creates a new COLORPICKER or raises the existing
%      singleton*.
%
%      H = COLORPICKER returns the handle to a new COLORPICKER or the handle to
%      the existing singleton*.
%
%      COLORPICKER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COLORPICKER.M with the given input arguments.
%
%      COLORPICKER('Property','Value',...) creates a new COLORPICKER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before colorPicker_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to colorPicker_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help colorPicker

% Last Modified by GUIDE v2.5 04-May-2015 18:20:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @colorPicker_OpeningFcn, ...
                   'gui_OutputFcn',  @colorPicker_OutputFcn, ...
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


% --- Executes just before colorPicker is made visible.
function colorPicker_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to colorPicker (see VARARGIN)

% Choose default command line output for colorPicker
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes colorPicker wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = colorPicker_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function redSlider_Callback(hObject, eventdata, handles)
% hObject    handle to redSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
redVal = hObject.Value;
handles.redEdit.String = num2str(redVal);
handles.axes1.Color(1) = redVal;



% --- Executes during object creation, after setting all properties.
function redSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function greenSlider_Callback(hObject, eventdata, handles)
% hObject    handle to greenSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
greenVal = hObject.Value;
handles.greenEdit.String = num2str(greenVal);
handles.axes1.Color(2) = greenVal;

% --- Executes during object creation, after setting all properties.
function greenSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function blueSlider_Callback(hObject, eventdata, handles)
% hObject    handle to blueSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
blueVal = hObject.Value;
handles.blueEdit.String = num2str(blueVal);
handles.axes1.Color(3) = blueVal;

% --- Executes during object creation, after setting all properties.
function blueSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blueSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function redEdit_Callback(hObject, eventdata, handles)
% hObject    handle to redEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of redEdit as text
%        str2double(get(hObject,'String')) returns contents of redEdit as a double
redVal = str2double(hObject.String);
handles.redSlider.Value = redVal;
handles.axes1.Color(1) = redVal;

% --- Executes during object creation, after setting all properties.
function redEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function greenEdit_Callback(hObject, eventdata, handles)
% hObject    handle to greenEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of greenEdit as text
%        str2double(get(hObject,'String')) returns contents of greenEdit as a double
greenVal = str2double(hObject.String);
handles.greenSlider.Value = greenVal;
handles.axes1.Color(2) = greenVal;

% --- Executes during object creation, after setting all properties.
function greenEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blueEdit_Callback(hObject, eventdata, handles)
% hObject    handle to blueEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blueEdit as text
%        str2double(get(hObject,'String')) returns contents of blueEdit as a double
blueVal = str2double(hObject.String);
handles.blueSlider.Value = blueVal;
handles.axes1.Color(3) = blueVal;

% --- Executes during object creation, after setting all properties.
function blueEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blueEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
