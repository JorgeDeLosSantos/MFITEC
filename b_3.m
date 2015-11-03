function b_3
% Bombas centrífugas (Tipo 3)
% $ Ref. 1939 $
% $ Rev 1.0 $ 12/11/13 $

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales
BG_COLOR=[0.5 0.8 0.9];
etsize=8;

%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,300],'color',BG_COLOR);
centerfig(f);

%% Menú
barraMenuBC(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',BG_COLOR);

% 1ra col

uicontrol(pp,'style','text','String','c1','position',[10 220 30 20]);
dc1=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uicontrol(pp,'style','text','String','m/s','position',[150 220 30 20]);

uicontrol(pp,'style','text','String','c2','position',[10 180 30 20]);
dc2=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uicontrol(pp,'style','text','String','m/s','position',[150 180 30 20]);

uicontrol(pp,'style','text','String','D1','position',[10 140 30 20]);
dD1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uicontrol(pp,'style','text','String','m','position',[150 140 30 20]);

uicontrol(pp,'style','text','String','D2','position',[10 100 30 20]);
dD2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
uicontrol(pp,'style','text','String','m','position',[150 100 30 20]);

% 2da Col

uicontrol(pp,'style','text','String','alpha1','position',[210 220 35 20]);
dalpha1=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
uicontrol(pp,'style','text','String','°','position',[350 220 30 20]);

uicontrol(pp,'style','text','String','alpha2','position',[210 180 35 20]);
dalpha2=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
uicontrol(pp,'style','text','String','°','position',[350 180 30 20]);

uicontrol(pp,'style','text','String','n','position',[210 140 30 20]);
dn=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
uicontrol(pp,'style','text','String','rpm','position',[350 140 30 20]);

% Configurar etiquetas
set(findobj('style','text'),'BackgroundColor',BG_COLOR);

% Calcular PB
uicontrol(pp,'style','pushbutton','String','Calcular','position',[160 20 80 25],...
    'callback',@calcular,'fontsize',10,'fontweight','bold');



%% Menú Botones
posb=250;

uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',@gotrian,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/triangulo.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',@gographics,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-6*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


%% Funciones
    function calcular(~,~)
        global u1 u2 c1 c2 alpha1 alpha2
        c1=str2double(get(dc1,'String'));
        c2=str2double(get(dc2,'String'));
        D1=str2double(get(dD1,'String'));
        D2=str2double(get(dD2,'String'));
        alpha1=str2double(get(dalpha1,'String'))*pi/180;
        alpha2=str2double(get(dalpha2,'String'))*pi/180;
        n=str2double(get(dn,'String'));
        
        % Procedimiento ---
        u1=(pi*D1*n)/60;
        u2=(pi*D2*n)/60;
        c1u=c1*cos(alpha1);
        c2u=c2*cos(alpha2);
        Hu=(u2*c2u-u1*c1u)/g;
        
        res1=horzcat('u1= ',num2str(u1),' m/s');
        res2=horzcat('u2= ',num2str(u2),' m/s');
        res3=horzcat('c1u= ',num2str(c1u),' m/s');
        res4=horzcat('c2u= ',num2str(c2u),' m/s');
        res5=horzcat('Hu= ',num2str(Hu),' m');
        
        figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
    end

    function gohome(~,~)
        close(gcf);
        run('App_Bombas.m');
    end

    function gotrian(~,~)
        global u1 u2 c1 c2 alpha1 alpha2
        if isempty(u1)
            warndlg('Datos no proporcionados, verifique.','MFITEC - Error');
        else
            triangulos(u1,c1,alpha1,u2,c2,alpha2);
        end
    end

    function gographics(~,~)
        c1=str2double(get(dc1,'String'));
        c2=str2double(get(dc2,'String'));
        D1=str2double(get(dD1,'String'));
        D2=str2double(get(dD2,'String'));
        alpha1=str2double(get(dalpha1,'String'))*pi/180;
        alpha2=str2double(get(dalpha2,'String'))*pi/180;
        n=insertRango('n (rpm)','100:1000');
        
        u1=(pi*D1*n)/60;
        u2=(pi*D2*n)/60;
        c1u=c1*cos(alpha1);
        c2u=c2*cos(alpha2);
        Hu=(u2*c2u-u1*c1u)/g;
        grafica(n,Hu,'n ( rpm )','Hu ( m )','n vs Hu');
        
%         msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function goconv(~,~)
        winopen('data/mfun/convert.exe');
    end

    function gotablas(~,~)
        winopen('data/docs/Tablas.pdf');
    end

    function gocalc(~,~)
        winopen('data/mfun/calc.exe');
    end

    function goayuda(~,~)
        winopen('data/docs/Ayuda.pdf');
    end

end
