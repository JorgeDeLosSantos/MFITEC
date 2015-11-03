function varargout = App_Turbinas_A(varargin)
% APP_TURBINAS_A MATLAB code for App_Turbinas_A.fig
%      APP_TURBINAS_A, by itself, creates a new APP_TURBINAS_A or raises the existing
%      singleton*.
%
%      H = APP_TURBINAS_A returns the handle to a new APP_TURBINAS_A or the handle to
%      the existing singleton*.
%
%      APP_TURBINAS_A('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_TURBINAS_A.M with the given input arguments.
%
%      APP_TURBINAS_A('Property','Value',...) creates a new APP_TURBINAS_A or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_Turbinas_A_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_Turbinas_A_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_Turbinas_A

% Last Modified by GUIDE v2.5 17-Dec-2013 23:32:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_Turbinas_A_OpeningFcn, ...
                   'gui_OutputFcn',  @App_Turbinas_A_OutputFcn, ...
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


% --- Executes just before App_Turbinas_A is made visible.
function App_Turbinas_A_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_Turbinas_A (see VARARGIN)

% Choose default command line output for App_Turbinas_A
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui('center');
VARS_TA=get(findobj('style','checkbox'),'String');
save('VARS_TA.mat','VARS_TA');
clearvars('VARS_TA');

% UIWAIT makes App_Turbinas_A wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = App_Turbinas_A_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in gQ.
function gQ_Callback(hObject, eventdata, handles)
% hObject    handle to gQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gQ


% --- Executes on button press in gn.
function gn_Callback(hObject, eventdata, handles)
% hObject    handle to gn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gn


% --- Executes on button press in geta.
function geta_Callback(hObject, eventdata, handles)
% hObject    handle to geta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of geta


% --- Executes on button press in geta_v.
function geta_v_Callback(hObject, eventdata, handles)
% hObject    handle to geta_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of geta_v


% --- Executes on button press in geta_h.
function geta_h_Callback(hObject, eventdata, handles)
% hObject    handle to geta_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of geta_h


% --- Executes on button press in geta_m.
function geta_m_Callback(hObject, eventdata, handles)
% hObject    handle to geta_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of geta_m


% --- Executes on button press in gHu.
function gHu_Callback(hObject, eventdata, handles)
% hObject    handle to gHu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gHu


% --- Executes on button press in gD.
function gD_Callback(hObject, eventdata, handles)
% hObject    handle to gD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gD


% --- Executes on button press in gdch.
function gdch_Callback(hObject, eventdata, handles)
% hObject    handle to gdch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gdch


% --- Executes on button press in galpha1.
function galpha1_Callback(hObject, eventdata, handles)
% hObject    handle to galpha1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of galpha1


% --- Executes on button press in galpha2.
function galpha2_Callback(hObject, eventdata, handles)
% hObject    handle to galpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of galpha2


% --- Executes on button press in gbeta2.
function gbeta2_Callback(hObject, eventdata, handles)
% hObject    handle to gbeta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gbeta2


% --- Executes on button press in gbeta1.
function gbeta1_Callback(hObject, eventdata, handles)
% hObject    handle to gbeta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gbeta1


% --- Executes on button press in gu.
function gu_Callback(hObject, eventdata, handles)
% hObject    handle to gu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gu


% --- Executes on button press in gc1.
function gc1_Callback(hObject, eventdata, handles)
% hObject    handle to gc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gc1


% --- Executes on button press in gc2.
function gc2_Callback(hObject, eventdata, handles)
% hObject    handle to gc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gc2


% --- Executes on button press in gc1u.
function gc1u_Callback(hObject, eventdata, handles)
% hObject    handle to gc1u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gc1u


% --- Executes on button press in gc1m.
function gc1m_Callback(hObject, eventdata, handles)
% hObject    handle to gc1m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gc1m


% --- Executes on button press in gc2u.
function gc2u_Callback(hObject, eventdata, handles)
% hObject    handle to gc2u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gc2u


% --- Executes on button press in gc2m.
function gc2m_Callback(hObject, eventdata, handles)
% hObject    handle to gc2m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gc2m


% --- Executes on button press in gw1.
function gw1_Callback(hObject, eventdata, handles)
% hObject    handle to gw1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gw1


% --- Executes on button press in gw2.
function gw2_Callback(hObject, eventdata, handles)
% hObject    handle to gw2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gw2


% --- Executes on button press in gP.
function gP_Callback(hObject, eventdata, handles)
% hObject    handle to gP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gP


% --- Executes on button press in gPa.
function gPa_Callback(hObject, eventdata, handles)
% hObject    handle to gPa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gPa


% --- Executes on button press in gPi.
function gPi_Callback(hObject, eventdata, handles)
% hObject    handle to gPi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gPi


% --- Executes on button press in checkbox26.
function checkbox26_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox26


% --- Executes on button press in checkbox27.
function checkbox27_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox27


% --- Executes on button press in checkbox28.
function checkbox28_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox28


% --- Executes on button press in checkbox29.
function checkbox29_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox29


% --- Executes on button press in checkbox30.
function checkbox30_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox30


% --- Executes on button press in checkbox31.
function checkbox31_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox31


% --- Executes on button press in checkbox32.
function checkbox32_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox32


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% Datos totales
totdatos=get(findobj('style','checkbox'),'value');
ndd=nnz(cell2mat(totdatos));

% Datos necesarios en cada tipo/subtipo
% T1
p1s1=cell2mat(get(findobj('str','H','-or','str','d','-or','str','D','-or','str','beta2','-or','str','Ku','-or','str','Kc',...
    '-or','str','Kw','-or','str','eta_m'),'value'));

% T2
p2s1=cell2mat(get(findobj('str','d','-or','str','c1','-or','str','u','-or','str','beta2'),'value'));
p2s2=cell2mat(get(findobj('str','d','-or','str','D','-or','str','c1','-or','str','u','-or','str','beta2'),'value'));
p2s3=cell2mat(get(findobj('str','d','-or','str','D','-or','str','c1','-or','str','u','-or','str','eta_h'),'value'));
p2s4=cell2mat(get(findobj('str','d','-or','str','D','-or','str','c1','-or','str','eta'),'value'));

% T3
p3s1=cell2mat(get(findobj('str','c1','-or','str','Ku','-or','str','Q','-or','str','beta2'),'value'));
p3s2=cell2mat(get(findobj('str','c1','-or','str','Ku','-or','str','Q'),'value'));

% T4
p4s1=cell2mat(get(findobj('str','Kc','-or','str','Ku','-or','str','Kw','-or','str','d','-or','str','beta2','-or','str','eta_m',...
    '-or','str','Hb','-or','str','L','-or','str','dt','-or','str','fr'),'value'));

% T5
p5s1=cell2mat(get(findobj('str','Ku','-or','str','Kc','-or','str','Pa','-or','str','H','-or','str','eta','-or','str','D'),'value'));
p5s2=cell2mat(get(findobj('str','Ku','-or','str','Kc','-or','str','Pa','-or','str','H','-or','str','eta','-or','str','n',...
    '-or','str','vE'),'value'));

% T6
p6s1=cell2mat(get(findobj('str','d','-or','str','D','-or','str','c1','-or','str','Kw','-or','str','beta2','-or','str','Pa',...
    '-or','str','eta_m'),'value'));
p6s2=cell2mat(get(findobj('str','d','-or','str','D','-or','str','Pa','-or','str','n','-or','str','beta2'),'value'));


if all(p1s1==1) & ndd==nnz(p1s1)
    close(gcf);
    run('ta_1.m');
elseif all(p2s1==1) & ndd==nnz(p2s1)
    close(gcf);
    run('ta_2(1).m');
elseif all(p2s2==1) & ndd==nnz(p2s2)
    close(gcf);
    run('ta_2(2).m');
elseif all(p2s3==1) & ndd==nnz(p2s3)
    close(gcf);
    run('ta_2(3).m');
elseif all(p2s4==1) & ndd==nnz(p2s4)
    close(gcf);
    run('ta_2(4).m');
elseif all(p3s1==1) & ndd==nnz(p3s1)
    close(gcf);
    run('ta_3(1).m');
elseif all(p3s2==1) & ndd==nnz(p3s2)
    close(gcf);
    run('ta_3(2).m');
elseif all(p4s1==1) & ndd==nnz(p4s1)
    close(gcf);
    run('ta_4.m');
elseif all(p5s1==1) & ndd==nnz(p5s1)
    close(gcf);
    run('ta_5(1).m');
elseif all(p5s2==1) & ndd==nnz(p5s2)
    close(gcf);
    run('ta_5(2).m');
elseif all(p6s1==1) & ndd==nnz(p6s1)
    close(gcf);
    run('ta_6(1).m');
elseif all(p6s2==1) & ndd==nnz(p6s2)
    close(gcf);
    run('ta_6(2).m');
else
    warndlg('Datos no suficientes','MFITEC');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
winopen('data/docs/Notacion_ta.html');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
close(gcf);
run('Inicio.m');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
winopen('data/docs/Ayuda.pdf');


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function goayuda_Callback(hObject, eventdata, handles)
winopen('data/docs/Ayuda.pdf');


% --------------------------------------------------------------------
function acercade_Callback(hObject, eventdata, handles)
run('data/mfun/acerca.m');


% --------------------------------------------------------------------
function tablasgo_Callback(hObject, eventdata, handles)
winopen('data/docs/Tablas.pdf');


% --------------------------------------------------------------------
function moody_diag_Callback(hObject, eventdata, handles)
winopen('data/docs/Moody.pdf');


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox33.
function checkbox33_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox33


% --- Executes on button press in checkbox34.
function checkbox34_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox34


% --- Executes on button press in checkbox36.
function checkbox36_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox36


% --- Executes on button press in checkbox37.
function checkbox37_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox37


% --- Executes on button press in checkbox38.
function checkbox38_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox38


% --- Executes on button press in checkbox39.
function checkbox39_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox39


% --- Executes on button press in checkbox40.
function checkbox40_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox40


% --- Executes on button press in checkbox41.
function checkbox41_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox41


% --- Executes on button press in checkbox42.
function checkbox42_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox42


% --- Executes on button press in checkbox43.
function checkbox43_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox43


% --------------------------------------------------------------------
function convunidades_Callback(hObject, eventdata, handles)
winopen('data/mfun/convert.exe');
