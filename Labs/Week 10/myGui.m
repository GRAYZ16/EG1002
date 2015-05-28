function myGui()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
fig = figure('Name', 'Colour Picker', 'NumberTitle', 'off');

myhandles = guihandles(fig); 
guidata(fig,myhandles) 
global redSlider;
global redEdit;

global greenSlider;
global greenEdit;

global blueSlider;
global blueEdit;

redSlider = uicontrol(fig, 'Style', 'slider', 'Position', [100 270 350 40], 'BackgroundColor', [0.9 0.9 0.9], 'Callback', @redSlider_callback);
greenSlider = uicontrol(fig, 'Style', 'slider', 'Position', [100 220 350 40], 'BackgroundColor', [0.9 0.9 0.9], 'Callback', @greenSlider_callback);
blueSlider = uicontrol(fig, 'Style', 'slider', 'Position', [100 170 350 40], 'BackgroundColor', [0.9 0.9 0.9], 'Callback', @blueSlider_callback);

redEdit = uicontrol(fig, 'Style', 'edit', 'Position', [470 270 80 40], 'Callback', @redEdit_callback);
greenEdit = uicontrol(fig, 'Style', 'edit', 'Position', [470 220 80 40], 'Callback', @greenEdit_callback);
blueEdit = uicontrol(fig, 'Style', 'edit', 'Position', [470 170 80 40], 'Callback', @blueEdit_callback);


end

function redSlider_callback(hObject, callBackData)
    global redEdit;

    redVal = hObject.Value;
    redEdit.String = num2str(redVal);
end

function greenSlider_callback(hObject, callBackData, handles)

    global greenEdit;
    
    greenVal = hObject.Value;
    greenEdit.String = num2str(greenVal);
end

function blueSlider_callback(hObject, callBackData, handles)
   global blueEdit;
   
    blueVal = hObject.Value;
    blueEdit.String = num2str(blueVal);
end

function redEdit_callback(hObject, callBackData)
    global redSlider;
    
    redVal = str2double(hObject.String);
    redSlider.Value = redVal;
    
end

function greenEdit_callback(hObject, callBackData)
    global greenSlider;
    
    greenVal = str2double(hObject.String);
    greenSlider.Value = greenVal;
    
end

function blueEdit_callback(hObject, callBackData)
    global blueSlider;
    
    blueVal = str2double(hObject.String);
    blueSlider.Value = blueVal;
    
end