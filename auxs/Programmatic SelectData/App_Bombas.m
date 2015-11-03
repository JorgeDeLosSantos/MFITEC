function varargout = App_Bombas(varargin)
% APP_BOMBAS MATLAB code for App_Bombas.fig
%      APP_BOMBAS, by itself, creates a new APP_BOMBAS or raises the existing
%      singleton*.
%
%      H = APP_BOMBAS returns the handle to a new APP_BOMBAS or the handle to
%      the existing singleton*.
%
%      APP_BOMBAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_BOMBAS.M with the given input arguments.
%
%      APP_BOMBAS('Property','Value',...) creates a new APP_BOMBAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before App_Bombas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to App_Bombas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help App_Bombas

% Last Modified by GUIDE v2.5 14-Jan-2014 04:25:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @App_Bombas_OpeningFcn, ...
                   'gui_OutputFcn',  @App_Bombas_OutputFcn, ...
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


% --- Executes just before App_Bombas is made visible.
function App_Bombas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to App_Bombas (see VARARGIN)

% Choose default command line output for App_Bombas
handles.output = hObject;
movegui('center');
% Update handles structure
guidata(hObject, handles);
% Tomando datos
% VARS_BC=get(findobj('style','checkbox'),'String');
% save('VARS_BC.mat','VARS_BC');
% clearvars('VARS_BC');


% UIWAIT makes App_Bombas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = App_Bombas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in gH.
function gH_Callback(hObject, eventdata, handles)
% hObject    handle to gH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gH


% --- Executes on button press in gHu.
function gHu_Callback(hObject, eventdata, handles)
% hObject    handle to gHu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gHu


% --- Executes on button press in grho.
function grho_Callback(hObject, eventdata, handles)
% hObject    handle to grho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of grho


% --- Executes on button press in gQ.
function gQ_Callback(hObject, eventdata, handles)
% hObject    handle to gQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gQ


% --- Executes on button press in gu1.
function gu1_Callback(hObject, eventdata, handles)
% hObject    handle to gu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gu1


% --- Executes on button press in gc1.
function gc1_Callback(hObject, eventdata, handles)
% hObject    handle to gc1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gc1


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


% --- Executes on button press in galpha1.
function galpha1_Callback(hObject, eventdata, handles)
% hObject    handle to galpha1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of galpha1


% --- Executes on button press in gbeta1.
function gbeta1_Callback(hObject, eventdata, handles)
% hObject    handle to gbeta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gbeta1


% --- Executes on button press in gD1.
function gD1_Callback(hObject, eventdata, handles)
% hObject    handle to gD1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gD1


% --- Executes on button press in gb1.
function gb1_Callback(hObject, eventdata, handles)
% hObject    handle to gb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gb1


% --- Executes on button press in gu2.
function gu2_Callback(hObject, eventdata, handles)
% hObject    handle to gu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gu2


% --- Executes on button press in gc2.
function gc2_Callback(hObject, eventdata, handles)
% hObject    handle to gc2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gc2


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


% --- Executes on button press in gD2.
function gD2_Callback(hObject, eventdata, handles)
% hObject    handle to gD2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gD2


% --- Executes on button press in gb2.
function gb2_Callback(hObject, eventdata, handles)
% hObject    handle to gb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gb2


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


% --- Executes on button press in gP.
function gP_Callback(hObject, eventdata, handles)
% hObject    handle to gP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gP


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


% --- Executes on button press in geta.
function geta_Callback(hObject, eventdata, handles)
% hObject    handle to geta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of geta


% --- Executes on button press in gHrint.
function gHrint_Callback(hObject, eventdata, handles)
% hObject    handle to gHrint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gHrint


% --- Executes on button press in gHrext.
function gHrext_Callback(hObject, eventdata, handles)
% hObject    handle to gHrext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gHrext


% --- Executes on button press in gHra.
function gHra_Callback(hObject, eventdata, handles)
% hObject    handle to gHra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gHra


% --- Executes on button press in gHri.
function gHri_Callback(hObject, eventdata, handles)
% hObject    handle to gHri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gHri


% --- Executes on button press in gda.
function gda_Callback(hObject, eventdata, handles)
% hObject    handle to gda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gda


% --- Executes on button press in gdi.
function gdi_Callback(hObject, eventdata, handles)
% hObject    handle to gdi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gdi


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% Datos totales
totdatos=get(findobj('style','checkbox'),'value');
ndd=nnz(cell2mat(totdatos));
efi=cell2mat(get(findobj('str','eta_m','-or','str','eta_h','-or','str','eta_v','-or','str','eta'),'value'));

% Datos necesarios en cada tipo/subtipo
% T1
p1s1=cell2mat(get(findobj('str','H','-or','str','eta_h','-or','str','D2','-or','str','b2','-or','str','beta2','-or','str','n',...
    '-or','str','Hrext'),'value'));
p1s2=cell2mat(get(findobj('str','Pa','-or','str','eta','-or','str','D2','-or','str','b2','-or','str','beta2','-or','str','n'),'value'));

% T2
p2s1=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','Q','-or','str','H',...
    '-or','str','n'),'value'));

% T3
p3s1=cell2mat(get(findobj('str','c1','-or','str','c2','-or','str','alpha1','-or','str','alpha2','-or','str','D1','-or','str','D2',...
    '-or','str','n'),'value'));

% T4
p4s1=cell2mat(get(findobj('str','di','-or','str','da','-or','str','La','-or','str','Li','-or','str','zZ','-or','str','zA',...
    '-or','str','Q','-or','str','eta','-or','str','Eps','-or','str','Ka','-or','str','Ki'),'value'));
p4s2=cell2mat(get(findobj('str','di','-or','str','da','-or','str','La','-or','str','Li','-or','str','zZ','-or','str','zA',...
    '-or','str','Q','-or','str','eta','-or','str','Eps'),'value'));
p4s3=cell2mat(get(findobj('str','di','-or','str','da','-or','str','La','-or','str','Li','-or','str','zZ','-or','str','zA',...
    '-or','str','Q','-or','str','eta_h','-or','str','Eps','-or','str','Ka','-or','str','Ki','-or','str','eta_v','-or',...
    'str','eta_m'),'value'));

% T5
p5s1=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
    '-or','str','n'),'value'));
p5s2=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
    '-or','str','n','-or','str','ME'),'value'));
p5s3=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
    '-or','str','n','-or','str','eta'),'value'));  
p5s4=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
    '-or','str','Q','-or','str','eta'),'value'));
p5s5=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','A1','-or','str','A2','-or','str','beta1','-or','str','beta2',...
    '-or','str','n','-or','str','eta'),'value'));

% T6
p6s1=cell2mat(get(findobj('str','D1','-or','str','D2','-or','str','b1','-or','str','b2','-or','str','beta1','-or','str','beta2',...
    '-or','str','n','-or','str','zS','-or','str','zE','-or','str','zA','-or','str','da','-or','str','di'),'value'));

% T7
p7s1=cell2mat(get(findobj('str','Q','-or','str','PS','-or','str','PE','-or','str','zS','-or','str','zE','-or','str','eta'),'value'));
p7s2=cell2mat(get(findobj('str','Q','-or','str','MS','-or','str','ME','-or','str','zS','-or','str','zE','-or','str','da',...
    '-or','str','di'),'value'));
p7s3=cell2mat(get(findobj('str','Q','-or','str','PS','-or','str','PE','-or','str','zS','-or','str','zE','-or','str','eta',...
    '-or','str','da','-or','str','di'),'value'));
p7s4=cell2mat(get(findobj('str','Q','-or','str','PS','-or','str','PE','-or','str','eta'),'value'));
p7s5=cell2mat(get(findobj('str','Q','-or','str','da','-or','str','zA','-or','str','zE','-or','str','zS','-or','str','Pa',...
    '-or','str','eta'),'value'));
% T8
p8s1=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','c1m','-or','str','c2m','-or','str','beta2','-or','str','vi',...
    '-or','str','eta'),'value'));

% T9
p9s1=cell2mat(get(findobj('str','D2','-or','str','n','-or','str','beta2','-or','str','c2m'),'value'));
p9s2=cell2mat(get(findobj('str','D2','-or','str','n','-or','str','beta2','-or','str','c2m','-or','str','eta_h'),'value'));
p9s3=cell2mat(get(findobj('str','D2','-or','str','u2','-or','str','beta2','-or','str','c2m'),'value'));
p9s4=cell2mat(get(findobj('str','D2','-or','str','u2','-or','str','beta2','-or','str','c2m','-or','str','eta_h'),'value'));


% T10
p10s1=cell2mat(get(findobj('str','Hra','-or','str','Hri','-or','str','zA','-or','str','zZ','-or','str','D2','-or','str','b2',...
    '-or','str','beta2','-or','str','n','-or','str','zE','-or','str','zS','-or','str','da','-or','str','di'),'value'));
p10s2=cell2mat(get(findobj('str','Hra','-or','str','Hri','-or','str','zA','-or','str','zZ','-or','str','D2','-or','str','b2',...
    '-or','str','beta2','-or','str','n'),'value'));

% T11
p11s1=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Q','-or','str','Hrext','-or','str','eta'),'value'));
p11s2=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Q','-or','str','Hrext','-or','str','Pa'),'value'));
p11s3=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Q','-or','str','Hra','-or','str','Hri','-or','str','eta'),'value'));
p11s4=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Q','-or','str','Hra','-or','str','Hri','-or','str','Pa'),'value'));

% T12
p12s1=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Kta','-or','str','Kti','-or','str','da','-or','str','di',...
    '-or','str','Q','-or','str','eta'),'value'));
p12s2=cell2mat(get(findobj('str','zZ','-or','str','zA','-or','str','Kta','-or','str','Kti','-or','str','da','-or','str','di',...
    '-or','str','Q','-or','str','Pa'),'value'));

% T13
p13s1=cell2mat(get(findobj('str','n','-or','str','D1','-or','str','beta1','-or','str','c1m'),'value'));
p13s2=cell2mat(get(findobj('str','u1','-or','str','D1','-or','str','beta1','-or','str','c1m'),'value'));

% T14
p14s1=cell2mat(get(findobj('str','PA','-or','str','PSV','-or','str','Hra','-or','str','Q','-or','str','H','-or','str','n',...
    '-or','str','NPSH'),'value'));
p14s2=cell2mat(get(findobj('str','PA','-or','str','PSV','-or','str','Hra','-or','str','zE','-or','str','zA'),'value'));
p14s3=cell2mat(get(findobj('str','PA','-or','str','PSV','-or','str','Hra','-or','str','Q','-or','str','H','-or','str','n',...
    '-or','str','zA','-or','str','zE'),'value'));
p14s4=cell2mat(get(findobj('str','PA','-or','str','PSV','-or','str','zE','-or','str','zA','-or','str','Ka','-or','str','La',...
    '-or','str','da','-or','str','Eps','-or','str','Q'),'value'));

% T15
p15s1=cell2mat(get(findobj('str','ns','-or','str','Q','-or','str','H'),'value'));
p15s2=cell2mat(get(findobj('str','ns','-or','str','Q','-or','str','n'),'value'));
p15s3=cell2mat(get(findobj('str','ns','-or','str','H','-or','str','n'),'value'));
p15s4=cell2mat(get(findobj('str','ns','-or','str','P','-or','str','n'),'value'));
p15s5=cell2mat(get(findobj('str','ns','-or','str','P','-or','str','H'),'value'));
p15s6=cell2mat(get(findobj('str','n','-or','str','Q','-or','str','H'),'value'));
p15s7=cell2mat(get(findobj('str','n','-or','str','P','-or','str','H'),'value'));


% Selector --------------------------------------------------------------
if all(p1s1==1) & ndd==nnz(p1s1)
    close(gcf);
    run('b_1(1).m');
elseif all(p1s2==1) & ndd==nnz(p1s2)
    close(gcf);
    run('b_1(2).m');
elseif all(p2s1==1) & ndd==nnz(p2s1)
    close(gcf);
    run('b_2.m');
elseif all(p3s1==1) & ndd==nnz(p3s1)
    close(gcf);
    run('b_3.m');
elseif all(p4s1==1) & ndd==nnz(p4s1)
    close(gcf);
    run('b_4(1).m');
elseif all(p4s2==1) & ndd==nnz(p4s2)
    close(gcf);
    run('b_4(2).m');
elseif all(p4s3==1) & ndd==nnz(p4s3)
    close(gcf);
    run('b_4(3).m');
elseif all(p5s1==1) & ndd==nnz(p5s1)
    close(gcf);
    run('b_5(1).m');
elseif all(p5s2==1) | and(all(p5s2==1),any(efi==1)) % PR
    close(gcf);
    run('b_5(2).m');
elseif all(p5s3==1) | and(all(p5s3==1),any(efi==1)) % PR
    close(gcf);
    run('b_5(3).m');
elseif all(p5s4==1) & ndd==nnz(p5s4)
    close(gcf);
    run('b_5(4).m');
elseif all(p5s5==1) & ndd==nnz(p5s5)
    close(gcf);
    run('b_5(5).m');
elseif all(p6s1==1) | and(all(p6s1==1),any(efi==1)) % PR
    close(gcf);
    run('b_6.m');
elseif all(p7s1==1) & ndd==nnz(p7s1) 
    close(gcf);
    run('b_7(1).m');
elseif all(p7s2==1) & ndd==nnz(p7s2)
    close(gcf);
    run('b_7(2).m');
elseif all(p7s3==1) & ndd==nnz(p7s3)
    close(gcf);
    run('b_7(3).m');
elseif all(p7s4==1) & ndd==nnz(p7s4)
    close(gcf);
    run('b_7(4).m');
elseif all(p7s5==1) & ndd==nnz(p7s5)
    close(gcf);
    run('b_7(5).m');
elseif all(p8s1==1) & ndd==nnz(p8s1)
    close(gcf);
    run('b_8.m');
elseif all(p9s1==1) & ndd==nnz(p9s1)
    close(gcf);
    run('b_9(1).m');
elseif all(p9s2==1) & ndd==nnz(p9s2)
    close(gcf);
    run('b_9(2).m');
elseif all(p9s3==1) & ndd==nnz(p9s3)
    close(gcf);
    run('b_9(3).m');
elseif all(p9s4==1) & ndd==nnz(p9s4)
    close(gcf);
    run('b_9(4).m');
elseif all(p10s1==1) & ndd==nnz(p10s1)
    close(gcf);
    run('b_10(1).m');
elseif all(p10s2==1) | and(all(p10s2==1),any(efi==1)) % efi
    close(gcf);
    run('b_10(2).m');
elseif all(p11s1==1) & ndd==nnz(p11s1)
    close(gcf);
    run('b_11(1).m');
elseif all(p11s2==1) & ndd==nnz(p11s2)
    close(gcf);
    run('b_11(2).m');
elseif all(p11s3==1) & ndd==nnz(p11s3)
    close(gcf);
    run('b_11(3).m');
elseif all(p11s4==1) & ndd==nnz(p11s4)
    close(gcf);
    run('b_11(4).m');
elseif all(p12s1==1) & ndd==nnz(p12s1)
    close(gcf);
    run('b_12(1).m');
elseif all(p12s2==1) & ndd==nnz(p12s2)
    close(gcf);
    run('b_12(2).m');
elseif all(p13s1==1) & ndd==nnz(p13s1)
    close(gcf);
    run('b_13(1).m');
elseif all(p13s2==1) & ndd==nnz(p13s2)
    close(gcf);
    run('b_13(2).m');
elseif all(p14s1==1) & ndd==nnz(p14s1)
    close(gcf);
    run('b_14(1).m');
elseif all(p14s2==1) & ndd==nnz(p14s2)
    close(gcf);
    run('b_14(2).m');
elseif all(p14s3==1) & ndd==nnz(p14s3)
    close(gcf);
    run('b_14(3).m');
elseif all(p14s4==1) & ndd==nnz(p14s4)
    close(gcf);
    run('b_14(4).m');
elseif all(p15s1==1) & ndd==nnz(p15s1)
    close(gcf);
    run('b_15(1).m');
elseif all(p15s2==1) & ndd==nnz(p15s2)
    close(gcf);
    run('b_15(2).m');
elseif all(p15s3==1) & ndd==nnz(p15s3)
    close(gcf);
    run('b_15(3).m');
elseif all(p15s4==1) & ndd==nnz(p15s4)
    close(gcf);
    run('b_15(4).m');
elseif all(p15s5==1) & ndd==nnz(p15s5)
    close(gcf);
    run('b_15(5).m');
elseif all(p15s6==1) & ndd==nnz(p15s6)
    close(gcf);
    run('b_15(6).m');
elseif all(p15s7==1) & ndd==nnz(p15s7)
    close(gcf);
    run('b_15(7).m');
else
    warndlg('Datos no suficientes, verifique nuevamente...','MFITEC');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
winopen('data/docs/Notacion_b.html');


% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_ayuda_Callback(hObject, eventdata, handles)
winopen('data/docs/Ayuda.pdf');


% --------------------------------------------------------------------
function acerca_Callback(hObject, eventdata, handles)
run('data/mfun/acerca.m');


% --------------------------------------------------------------------
function menu_conversor_Callback(hObject, eventdata, handles)
winopen('data/mfun/convert.exe');


% --------------------------------------------------------------------
function lab_tablas_Callback(hObject, eventdata, handles)
winopen('data/docs/Tablas.pdf');


% --------------------------------------------------------------------
function menu_moody_Callback(hObject, eventdata, handles)
winopen('data/docs/moody.pdf');


% --- Executes on button press in gn.
function gn_Callback(hObject, eventdata, handles)
% hObject    handle to gn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gn


% --- Executes on button press in goinicio.
function goinicio_Callback(hObject, eventdata, handles)
close(gcf);
run('Inicio.m');



% --- Executes on button press in bayuda.
function bayuda_Callback(hObject, eventdata, handles)
winopen('data/docs/Ayuda.pdf');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
winopen('data/mfun/convert.exe');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
run('menu_estudio_b.m');


% --- Executes on button press in checkbox35.
function checkbox35_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox35


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


% --- Executes on button press in gPS.
function gPS_Callback(hObject, eventdata, handles)
% hObject    handle to gPS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gPS


% --- Executes on button press in gPE.
function gPE_Callback(hObject, eventdata, handles)
% hObject    handle to gPE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gPE


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
function config_densidad_Callback(hObject, eventdata, handles)
opconf.Interpreter='tex';
nrho=inputdlg({'Inserte un nuevo valor en kg/m^3'},'Densidad',1,{'1000'},opconf);
rho=str2double(nrho);
save('data/mfun/rho.mat','rho');
clearvars('rho');


% --- Executes on button press in gME.
function gME_Callback(hObject, eventdata, handles)
% hObject    handle to gME (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gME


% --- Executes on button press in gMS.
function gMS_Callback(hObject, eventdata, handles)
% hObject    handle to gMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gMS


% --- Executes on button press in gKa.
function gKa_Callback(hObject, eventdata, handles)
% hObject    handle to gKa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gKa


% --- Executes on button press in gKi.
function gKi_Callback(hObject, eventdata, handles)
% hObject    handle to gKi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gKi


% --- Executes on button press in gEps.
function gEps_Callback(hObject, eventdata, handles)
% hObject    handle to gEps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gEps


% --- Executes on button press in gLi.
function gLi_Callback(hObject, eventdata, handles)
% hObject    handle to gLi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gLi


% --- Executes on button press in gLa.
function gLa_Callback(hObject, eventdata, handles)
% hObject    handle to gLa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gLa


% --- Executes on button press in checkbox51.
function checkbox51_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox51


% --- Executes on button press in checkbox52.
function checkbox52_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox52


% --- Executes on button press in checkbox53.
function checkbox53_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox53


% --- Executes on button press in checkbox54.
function checkbox54_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox54


% --- Executes on button press in checkbox55.
function checkbox55_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox55


% --- Executes on button press in checkbox56.
function checkbox56_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox56


% --- Executes on button press in checkbox57.
function checkbox57_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox57


% --- Executes on button press in checkbox58.
function checkbox58_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox58


% --- Executes on button press in checkbox59.
function checkbox59_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox59


% --- Executes on button press in checkbox60.
function checkbox60_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox60


% --- Executes on button press in checkbox61.
function checkbox61_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox61
