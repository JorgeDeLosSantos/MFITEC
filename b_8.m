function b_8(subtipo)
% Bombas centrífugas
% $ Ref. 1916 $
% $ Rev. 1.1 $ 14/12/13 $

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

evi=uicontrol(pp,'style','text','String','vi','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dvi=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uvi=uicontrol(pp,'style','text','String','m/s','position',[150 140 30 20],'backgroundcolor',cfondo);

ec1m=uicontrol(pp,'style','text','String','c1m','position',[10 100 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc1m=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
uc1m=uicontrol(pp,'style','text','String','m/s','position',[150 100 30 20],'backgroundcolor',cfondo);

% 2da Columna  -----------------------------------------------------

ec2m=uicontrol(pp,'style','text','String','c2m','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc2m=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
uc2m=uicontrol(pp,'style','text','String','m/s','position',[350 220 30 20],'backgroundcolor',cfondo);

ebeta2=uicontrol(pp,'style','text','String','beta2','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
ubeta2=uicontrol(pp,'style','text','String','°','position',[350 180 30 20],'backgroundcolor',cfondo);

eeta=uicontrol(pp,'style','text','String','eta','position',[210 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
deta=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
ueta=uicontrol(pp,'style','text','String','','position',[350 140 30 20],'backgroundcolor',cfondo);

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
            vi=str2double(get(dvi,'String'));
            c1m=str2double(get(dc1m,'String'));
            c2m=str2double(get(dc2m,'String'));
            beta2=str2double(get(dbeta2,'String'))*pi/180;
            eta=str2double(get(deta,'String'));
            
            H=zZ-zA;
            syms u2
            u2=solve(u2^2-(c2m/tan(beta2))*u2-(H*g)==0,u2);
            u2=double(u2(1));
            c2u=u2-(c2m/tan(beta2));
            c2=sqrt(c2u^2+c2m^2);
            w2=sqrt(c2m^2+(c2m/tan(beta2))^2);
            c1=c1m;
            Hd=(c2^2-c1^2)/(2*g);
            Hp=H-Hd;
            
            res1=horzcat('H= ',num2str(H),' m');
            res2=horzcat('u2= ',num2str(u2),' m/s');
            res3=horzcat('c2= ',num2str(c2),' m/s');
            res4=horzcat('w2= ',num2str(w2),' m/s');
            res5=horzcat('Hd= ',num2str(Hd),' m');
            res6=horzcat('Hp= ',num2str(Hp),' m');
            
            figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},6);
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