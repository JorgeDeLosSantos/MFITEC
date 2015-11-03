function b_12(subtipo)
% Bombas centrífugas (Tipo 12)
% $ Ref. 0 $
% $ Rev 1.0 $ 22/11/13 $

%% Constantes persistentes --------------------------------------------
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales ------------------------------------------
cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz -----------------------------------------------------------
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,300],'color',cfondo);
centerfig(f);

%% Menú Superior
barraMenuBC(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra Columna --------------------------------------------------------

ezZ=uicontrol(pp,'style','text','String','zZ','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzZ=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uzZ=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

ezA=uicontrol(pp,'style','text','String','zA','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzA=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uzA=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);

eKta=uicontrol(pp,'style','text','String','Kta','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKta=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uKta=uicontrol(pp,'style','text','String','','position',[150 140 30 20],'backgroundcolor',cfondo);

eKti=uicontrol(pp,'style','text','String','Kti','position',[10 100 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKti=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
uKti=uicontrol(pp,'style','text','String','','position',[150 100 30 20],'backgroundcolor',cfondo);

% 2da Columna  -----------------------------------------------------

eda=uicontrol(pp,'style','text','String','da','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dda=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
uda=uicontrol(pp,'style','text','String','m','position',[350 220 30 20],'backgroundcolor',cfondo);

edi=uicontrol(pp,'style','text','String','di','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
ddi=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
udi=uicontrol(pp,'style','text','String','m','position',[350 180 30 20],'backgroundcolor',cfondo);

eQ=uicontrol(pp,'style','text','String','Q','position',[210 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dQ=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
uQ=uicontrol(pp,'style','text','String','m^3/s','position',[350 140 30 20],'backgroundcolor',cfondo);

if subtipo==1
    eeta=uicontrol(pp,'style','text','String','eta','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    ueta=uicontrol(pp,'style','text','String','','position',[350 100 30 20],'backgroundcolor',cfondo);
elseif subtipo==2
    ePa=uicontrol(pp,'style','text','String','Pa','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dPa=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    uPa=uicontrol(pp,'style','text','String','kW','position',[350 100 30 20],'backgroundcolor',cfondo);
end

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 10 80 25],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');


%% Menú Botones
posb=250;

regresar=uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

tvel=uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',@gotrian,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/triangulo.png'));

graphs=uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',@gographics,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

convuni=uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

tablasb=uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

calcu=uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

helping=uicontrol('style','pushbutton','String','','position',[0 posb-6*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


%% Funciones  --------------------------------------------------------
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            zZ=str2double(get(dzZ,'String'));
            zA=str2double(get(dzA,'String'));
            Kta=str2double(get(dKta,'String'));
            Kti=str2double(get(dKti,'String'));
            da=str2double(get(dda,'String'));
            di=str2double(get(ddi,'String'));
            Q=str2double(get(dQ,'String'));
            
            if subtipo==1
                eta=str2double(get(deta,'String'));
                
                va=(4*Q)/(pi*da^2);
                vi=(4*Q)/(pi*di^2);
                Hra=Kta*(va^2/(2*g));
                Hri=Kti*(vi^2/(2*g));
                H=(zZ-zA)+Hra+Hri+(vi^2/(2*g));
                Pa=(Q*rho*g*H)/eta;
                
                res1=horzcat('H= ',num2str(H),' m');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                figresultados({res1,'',res2},2);
                
            elseif subtipo==2
                Pa=str2double(get(dPa,'String'))*10^3; % To Watts
                
                va=(4*Q)/(pi*da^2);
                vi=(4*Q)/(pi*di^2);
                Hra=Kta*(va^2/(2*g));
                Hri=Kti*(vi^2/(2*g));
                H=(zZ-zA)+Hra+Hri+(vi^2/(2*g));
                eta=(Q*rho*g*H)/Pa;
                
                res1=horzcat('H= ',num2str(H),' m');
                res2=horzcat('eta= ',num2str(eta*100),' %');
                figresultados({res1,'',res2},2);
            end
        end
    end

    function gohome(~,~)
        close(gcf);
        run('App_Bombas.m');
    end

    function gotrian(~,~)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function gographics(~,~)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
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