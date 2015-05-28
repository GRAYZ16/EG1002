function varargout = pressureDisplay(varargin)
% PRESSUREDISPLAY MATLAB code for pressureDisplay.fig
%      PRESSUREDISPLAY, by itself, creates a new PRESSUREDISPLAY or raises the existing
%      singleton*.
%
%      H = PRESSUREDISPLAY returns the handle to a new PRESSUREDISPLAY or the handle to
%      the existing singleton*.
%
%      PRESSUREDISPLAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRESSUREDISPLAY.M with the given input arguments.
%
%      PRESSUREDISPLAY('Property','Value',...) creates a new PRESSUREDISPLAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pressureDisplay_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pressureDisplay_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pressureDisplay

% Last Modified by GUIDE v2.5 13-May-2015 22:11:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pressureDisplay_OpeningFcn, ...
                   'gui_OutputFcn',  @pressureDisplay_OutputFcn, ...
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


% --- Executes just before pressureDisplay is made visible.
function pressureDisplay_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pressureDisplay (see VARARGIN)

% Choose default command line output for pressureDisplay
handles.output = hObject;
handles.currentVariable = 'u';
handles.pressureData = getData(handles.currentVariable, 0, 101);
handles.currentRange = [0 20];

dataSet = getData(handles.currentVariable, 0, 101);
% obtain min and max pixel values
  ni = length(dataSet);
  imax=max( max(dataSet{1}) );
  imin=min( min(dataSet{1}) );
  for cnt = 2:ni
    imax=max(imax,max(max(dataSet{1})));
    imin=min(imin,min(min(dataSet{1})));
  end
  
  handles.imax = imax;
  handles.imin = imin;
  
  
  handles.editMax.String = num2str(imax);
  handles.editMin.String = num2str(imin);
 
  setDisplay();
  displayData(handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pressureDisplay wait for user response (see UIRESUME)
% uiwait(handles.figure);


% --- Outputs from this function are returned to the command line.
function varargout = pressureDisplay_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function selector_Callback(hObject, eventdata, handles, sliderTag)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of uSelector
handles.currentVariable = sliderTag(1);
handles.pressureData = getData(sliderTag(1), 0, 101);
[handles.imin, handles.imax] = calcRange(handles, sliderTag(1));
guidata(hObject, handles);

handles.editMax.String = num2str(handles.imax);
handles.editMin.String = num2str(handles.imin);

displayData(handles);

% --- Executes on slider movement.
function timeSlider_Callback(hObject, eventdata, handles)
% hObject    handle to timeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
hObject.Value = floor(hObject.Value);

displayData(handles);




% --- Executes during object creation, after setting all properties.
function timeSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function setDisplay()
    colormap(jet(300));
    axis equal;    
    axis([0 50 0 15]);
    colorbar;

function displayData(handles)
    handles.displayImage = image(handles.pressureData{floor((handles.timeSlider.Value + 1))} - handles.currentRange(1), 'CDataMapping', 'scaled', 'XData', [0 50], 'YData', [0 15]);
    colorbar;    
    caxis([handles.imin handles.imax]);
    
function [imin, imax] = calcRange(handles, sliderVariable)
    dataSet = getData(sliderVariable, 0, 101);
% obtain min and max pixel values
    ni = length(dataSet);
    imax=max( max(dataSet{1}) );
    imin=min( min(dataSet{1}) );
    
    for cnt = 2:ni
        imax=max(imax,max(max(dataSet{1})));
        imin=min(imin,min(min(dataSet{1})));
    end

% --- Executes on button press in btn_autoScale.
function btn_autoScale_Callback(hObject, eventdata, handles)
% hObject    handle to btn_autoScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.imin, handles.imax] = calcRange(handles, handles.currentVariable);
guidata(hObject, handles);
handles.editMax.String = num2str(handles.imax);
handles.editMin.String = num2str(handles.imin);




function editMin_Callback(hObject, eventdata, handles)
% hObject    handle to editMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMin as text
%        str2double(get(hObject,'String')) returns contents of editMin as a double
handles.imin = str2num(hObject.String);
guidata(hObject, handles);
displayData(handles);


% --- Executes during object creation, after setting all properties.
function editMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editMax_Callback(hObject, eventdata, handles)
% hObject    handle to editMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMax as text
%        str2double(get(hObject,'String')) returns contents of editMax as a double
handles.imax = str2num(hObject.String);
guidata(hObject, handles);
displayData(handles);

% --- Executes during object creation, after setting all properties.
function editMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
