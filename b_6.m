function b_6
% Bombas centrífugas
%
% $ Ref. 1929 $
% $ Rev. 1.0 $ 11/11/13 $

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales
cfondo=[0.5 0.8 0.9];
etsize=8;
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,350],'color',cfondo);
centerfig(f);

%% Menú
barraMenuBC(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 320],'backgroundcolor',cfondo);

% 1ra col

en=uicontrol(pp,'style','text','String','n','position',[10 270 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dn=uicontrol(pp,'style','edit','String','','position',[50 270 100 20]);
un=uicontrol(pp,'style','text','String','rpm','position',[150 270 30 20],'backgroundcolor',cfondo);

eD1=uicontrol(pp,'style','text','String','D1','position',[10 240 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD1=uicontrol(pp,'style','edit','String','','position',[50 240 100 20]);
uD1=uicontrol(pp,'style','text','String','m','position',[150 240 30 20],'backgroundcolor',cfondo);

eD2=uicontrol(pp,'style','text','String','D2','position',[10 210 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 210 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 210 30 20],'backgroundcolor',cfondo);

eb1=uicontrol(pp,'style','text','String','b1','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db1=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
ub1=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);

eb2=uicontrol(pp,'style','text','String','b2','position',[10 150 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db2=uicontrol(pp,'style','edit','String','','position',[50 150 100 20]);
ub2=uicontrol(pp,'style','text','String','m','position',[150 150 30 20],'backgroundcolor',cfondo);

ebeta1=uicontrol(pp,'style','text','String','beta1','position',[10 120 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta1=uicontrol(pp,'style','edit','String','','position',[50 120 100 20]);
ubeta1=uicontrol(pp,'style','text','String','°','position',[150 120 30 20],'backgroundcolor',cfondo);


% 2da Col ---------------------------------------------------------

ebeta2=uicontrol(pp,'style','text','String','beta2','position',[210 270 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[250 270 100 20]);
ubeta2=uicontrol(pp,'style','text','String','°','position',[350 270 30 20],'backgroundcolor',cfondo);

ezS=uicontrol(pp,'style','text','String','zS','position',[210 240 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzS=uicontrol(pp,'style','edit','String','','position',[250 240 100 20]);
uzS=uicontrol(pp,'style','text','String','m','position',[350 240 30 20],'backgroundcolor',cfondo);

ezE=uicontrol(pp,'style','text','String','zE','position',[210 210 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzE=uicontrol(pp,'style','edit','String','','position',[250 210 100 20]);
uzE=uicontrol(pp,'style','text','String','m','position',[350 210 30 20],'backgroundcolor',cfondo);

ezA=uicontrol(pp,'style','text','String','zA','position',[210 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dzA=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
uzA=uicontrol(pp,'style','text','String','m','position',[350 180 30 20],'backgroundcolor',cfondo);

eda=uicontrol(pp,'style','text','String','da','position',[210 150 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dda=uicontrol(pp,'style','edit','String','','position',[250 150 100 20]);
uda=uicontrol(pp,'style','text','String','m','position',[350 150 30 20],'backgroundcolor',cfondo);

edi=uicontrol(pp,'style','text','String','di','position',[210 120 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
ddi=uicontrol(pp,'style','edit','String','','position',[250 120 100 20]);
udi=uicontrol(pp,'style','text','String','m','position',[350 120 30 20],'backgroundcolor',cfondo);

brendimientos=uicontrol(pp,'style','pushbutton','String','Rendimientos','position',[250 80 100 25],'backgroundcolor',[0.8 0.9 0.9],...
    'fontsize',8,'callback',@rendimientos);

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 10 80 25],...
    'callback',@calcular,'fontsize',10,'fontweight','bold');


%% Menú Botones
posb=280;

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


%% Funciones
    function calcular(~,~)
        global eta_h eta_v eta_m
        n=str2double(get(dn,'String'));
        D1=str2double(get(dD1,'String'));
        D2=str2double(get(dD2,'String'));
        b1=str2double(get(db1,'String'));
        b2=str2double(get(db2,'String'));
        beta1=str2double(get(dbeta1,'String'))*pi/180;
        beta2=str2double(get(dbeta2,'String'))*pi/180;
        zS=str2double(get(dzS,'String'));
        zE=str2double(get(dzE,'String'));
        zA=str2double(get(dzA,'String'));
        da=str2double(get(dda,'String'));
        di=str2double(get(ddi,'String'));
        
        % Procedimiento -----------------------------
        
        u1=(pi*D1*n)/60;
        u2=(pi*D2*n)/60;
        
        c1=u1*tan(beta1);
        c1u=0;
        c1m=c1;
        
        c2m=(b1*D1*c1m)/(b2*D2);
        c2u=u2-(c2m/tan(beta2));
        c2=sqrt(c2u^2+c2m^2);
        alpha2=atan(c2m/c2u);
        w1=c1m/sin(beta1);
        w2=c2m/sin(beta2);
        Q=pi*b1*D1*c1m;
        Hu=(u2*c2u-u1*c1u)/g;
        H=eta_h*Hu;
        P=Q*rho*g*H;
        Pa=P/(eta_v*eta_h*eta_m);
        
        res1=horzcat('Q= ',num2str(Q*1000),' l/s');
        res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
        res3=horzcat('Hu= ',num2str(Hu),' m');
        res4=horzcat('H= ',num2str(H),' m');
        figresultados({res1,'',res2,'',res3,'',res4},4);
    end

    function rendimientos(~,~)
        global eta_h eta_v eta_m
        conf.Interpreter='tex';
        Eta=inputdlg({'\eta_h','\eta_v','\eta_m'},'Rendimientos',1,{'1','1','1'},conf);
        eta_h=str2double(Eta(1));
        eta_v=str2double(Eta(2));
        eta_m=str2double(Eta(3));
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