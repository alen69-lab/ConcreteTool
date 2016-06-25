function varargout = TorsionTool(varargin)
% TORSIONTOOL MATLAB code for TorsionTool.fig
%      TORSIONTOOL, by itself, creates a new TORSIONTOOL or raises the existing
%      singleton*.
%
%      H = TORSIONTOOL returns the handle to a new TORSIONTOOL or the handle to
%      the existing singleton*.
%
%      TORSIONTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TORSIONTOOL.M with the given input arguments.
%
%      TORSIONTOOL('Property','Value',...) creates a new TORSIONTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TorsionTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TorsionTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TorsionTool

% Last Modified by GUIDE v2.5 10-Jun-2016 03:41:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TorsionTool_OpeningFcn, ...
                   'gui_OutputFcn',  @TorsionTool_OutputFcn, ...
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


% --- Executes just before TorsionTool is made visible.
function TorsionTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TorsionTool (see VARARGIN)

% Choose default command line output for TorsionTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TorsionTool wait for user response (see UIRESUME)
% uiwait(handles.torsion_figure);


% --- Outputs from this function are returned to the command line.
function varargout = TorsionTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function fywk_edit_Callback(hObject, eventdata, handles)
% hObject    handle to fywk_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fywk_edit as text
%        str2double(get(hObject,'String')) returns contents of fywk_edit as a double


% --- Executes during object creation, after setting all properties.
function fywk_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fywk_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stirrup_edit_Callback(hObject, eventdata, handles)
% hObject    handle to stirrup_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stirrup_edit as text
%        str2double(get(hObject,'String')) returns contents of stirrup_edit as a double


% --- Executes during object creation, after setting all properties.
function stirrup_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stirrup_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ted_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Ted_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ted_edit as text
%        str2double(get(hObject,'String')) returns contents of Ted_edit as a double


% --- Executes during object creation, after setting all properties.
function Ted_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ted_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sl_edit_Callback(hObject, eventdata, handles)
% hObject    handle to sl_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sl_edit as text
%        str2double(get(hObject,'String')) returns contents of sl_edit as a double
cs = handles.crossSection;
vt = cs.vt;
sl = str2double(get(hObject,'String'));
vt.s1 = sl;
handles.torsion_tab.s2_edit.String = num2str(vt.s2);
% update table
updateTable(handles);

function updateTable(handles)
cs = handles.crossSection;
vt = cs.vt;
%update text fields
handles.torsion_tab.s2_edit.String = num2str(vt.s2);
handles.torsion_tab.sl_edit.String = num2str(vt.s1);
% update table
out = [vt.s1 vt.s2 vt.cotTheta vt.Asw_sum vt.Asl vt.al];
% diplay VTcombined
fprintf('Vrd = %.2f \nTrd = %.2f \nV+T = %.2f\n\n', vt.Vrd/1000, vt.Trd*10^-6, vt.VTcombined);
% convert output to cell array and round to two decimal places
out = arrayfun(@(x)(sprintf('%.2f',x)), out, 'unif', 0);
table = handles.torsion_tab.Trd_table;
table.Data(2,2:end) = out;
% plot graf
vt.plotAsw();

% --- Executes during object creation, after setting all properties.
function sl_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sl_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in calcAsw_button.
function calcAsw_button_Callback(hObject, eventdata, handles)
% hObject    handle to calcAsw_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cs = handles.crossSection;
ax = handles.torsion_tab.Ted_axes;
vt = cs.calculateTrd(ax);
% convert output to cell array and round to two decimal places
out = arrayfun(@(x)(sprintf('%.2f',x)), out, 'unif', 0);
table = handles.torsion_tab.Trd_table;
table.Data(1,2:6) = out(1:end);


% --- Executes on button press in debug_button.
function debug_button_Callback(hObject, eventdata, handles)
% hObject    handle to debug_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
keyboard


% --- Executes on slider movement.
function s_slider_Callback(hObject, eventdata, handles)
% hObject    handle to s_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
cs = handles.crossSection;
slider = hObject;
s = slider.Value;
% zaokruzivanje na najblizi broj djeljiv sa 5
s = round(s/5)*5;
% korekcija polozaja klizaca
slider.Value = s;
handles.torsion_tab.sl_edit.String = num2str(s);
out = cs.recalculateAsw(s);

% convert output to cell array and round to two decimal places
% anonimna funkcija koja prima red vektor i konvertuje ga u cell array
% stringova vrijednosti zaokruzenih na drugu decimalu
out_str = arrayfun(@(x)(sprintf('%.2f',x)), out, 'unif', 0);
table = handles.torsion_tab.Trd_table;
table.Data(2,2:6) = out_str(1:end);

% --- Executes during object creation, after setting all properties.
function s_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in calculateS_button.
function calculateS_button_Callback(hObject, eventdata, handles)
% hObject    handle to calculateS_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cs = handles.crossSection;
ax = handles.torsion_tab.Ted_axes;
% VTModeler objekat
vt = cs.calculateTrd(ax);
% out = [s1 s2 cotTheta Asw/s Asl al]
cotTheta = vt.calcCotTheta();
Asw_sum = vt.calcAsw(cotTheta);
[Asl, al] = vt.calcAsl(cotTheta);
[s1 s2] = vt.calcS(cotTheta);
out = [s1 s2 cotTheta Asw_sum Asl al];
% plotanje VT dijagrama
vt.plotVT();
% convert output to cell array and round to two decimal places
% anonimna funkcija koja prima red vektor i konvertuje ga u cell array
% stringova vrijednosti zaokruzenih na drugu decimalu
out_str = arrayfun(@(x)(sprintf('%.2f',x)), out, 'unif', 0);
table = handles.torsion_tab.Trd_table;
table.Data(1,2:length(out_str)+1) = out_str(1:end);

vt.s1 = floor(s1/5)*5;
updateTable(handles);
% % podesavanje klizaca za usvajanje razmaka uzengija s
% slider = handles.torsion_tab.s_slider;
% if out(1) > 0
%     slider.Max = out(1)-mod(out(1), 5);
%     slider.SliderStep = [5/slider.Max 10/slider.Max];
%     slider.Value = slider.Max;
% else 
%     slider.Max = 1;
% end
% 
% handles.torsion_tab.sl_edit.String = num2str(slider.Max);



function m_edit_Callback(hObject, eventdata, handles)
% hObject    handle to m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m_edit as text
%        str2double(get(hObject,'String')) returns contents of m_edit as a double


% --- Executes during object creation, after setting all properties.
function m_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function s2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to s2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s2_edit as text
%        str2double(get(hObject,'String')) returns contents of s2_edit as a double


% --- Executes during object creation, after setting all properties.
function s2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function s2_slider_Callback(hObject, eventdata, handles)
% hObject    handle to s2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function s2_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s2_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in s2minus_button.
function s2minus_button_Callback(hObject, eventdata, handles)
% hObject    handle to s2minus_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cs = handles.crossSection;
vt = cs.vt;
if vt.s2 == vt.s1
    return;
end
vt.s2 = vt.s2-vt.s1;
updateTable(handles);

% --- Executes on button press in s2plus_button.
function s2plus_button_Callback(hObject, eventdata, handles)
% hObject    handle to s2plus_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cs = handles.crossSection;
vt = cs.vt;
vt.s2 = vt.s2+vt.s1;
updateTable(handles);


% --- Executes during object creation, after setting all properties.
function Ved_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ved_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in addTRebar_button.
function addTRebar_button_Callback(hObject, eventdata, handles)
% hObject    handle to addTRebar_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RebarTool(handles);
