function tr_1

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));
%% Características generales
cfondo=[0.85 0.82 0.75];
etsize=8;
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-T-Reacción','position',[500,300,500,300],'color',cfondo);

%% Menú
barramenuTR(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra col  --------------------------------------------------------

en=uicontrol(pp,'style','text','String','n','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dn=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
un=uicontrol(pp,'style','text','String','rpm','position',[150 220 30 20],'backgroundcolor',cfondo);

eeta=uicontrol(pp,'style','text','String','eta','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
deta=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
ueta=uicontrol(pp,'style','text','String','','position',[150 180 30 20],'backgroundcolor',cfondo);

eD2=uicontrol(pp,'style','text','String','D2','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);

eb1=uicontrol(pp,'style','text','String','b1','position',[10 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db1=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
ub1=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);

ec1m=uicontrol(pp,'style','text','String','c1m','position',[10 60 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc1m=uicontrol(pp,'style','edit','String','','position',[50 60 100 20]);
uc1m=uicontrol(pp,'style','text','String','m/s','position',[150 60 30 20],'backgroundcolor',cfondo);

% 2da Col --------------------------------------------------------------

ec2m=uicontrol(pp,'style','text','String','c2m','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc2m=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
uc2m=uicontrol(pp,'style','text','String','m/s','position',[350 220 30 20],'backgroundcolor',cfondo);

ealpha1=uicontrol(pp,'style','text','String','alpha1','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dalpha1=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
ualpha1=uicontrol(pp,'style','text','String','°','position',[350 180 30 20],'backgroundcolor',cfondo);

ealpha2=uicontrol(pp,'style','text','String','alpha2','position',[210 140 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dalpha2=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
ualpha2=uicontrol(pp,'style','text','String','°','position',[350 140 30 20],'backgroundcolor',cfondo);

ebeta1=uicontrol(pp,'style','text','String','beta1','position',[210 100 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta1=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
ubeta1=uicontrol(pp,'style','text','String','°','position',[350 100 30 20],'backgroundcolor',cfondo);

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[220 10 80 25],...
    'callback',@calcular,'fontsize',10,'fontweight','bold');


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


%% Funciones
    function calcular(~,~)
       n=str2double(get(dn,'String'));
       D2=str2double(get(dD2,'String'));
       eta=str2double(get(deta,'String'));
       b1=str2double(get(db1,'String'));
       c1m=str2double(get(dc1m,'String'));
       c2m=str2double(get(dc2m,'String'));
       alpha1=str2double(get(dalpha1,'String'))*pi/180;
       alpha2=str2double(get(dalpha2,'String'))*pi/180;
       beta1=str2double(get(dbeta1,'String'))*pi/180;
       
       c1u=c1m/tan(alpha1);
       u2=(pi*D2*n)/60;
       
       if str2double(get(dbeta1,'String'))==90
           u1=c1u;
       else
           u1=c1u+(c1m/tan(beta1));
       end
       
       if str2double(get(dalpha2,'String'))==90
           c2u=0;
           beta2=atan(c2m/u2);
       else
           c2u=c2m/tan(alpha2);
           beta2=atan((c2m)/(u2-c2u));
       end
       
       Hu=(u1*c1u-u2*c2u)/g;
       
       if str2double(get(deta,'String'))==1
           H=Hu;
       else
           conf.Interpreter='tex';
           eta_h=inputdlg({'\eta_h'},'Dato adicional',1,{'1'},conf);
           eta_h=str2double(eta_h);
           H=Hu/eta_h;
       end
       
       D1=(60*u1)/(pi*n);
       Q=pi*D1*b1*c1m;
       Pa=Q*rho*g*H*eta;
       
       % Resultados a mostrar
       res1=horzcat('Hu= ',num2str(Hu),' m');
       res2=horzcat('Q= ',num2str(Q*1000),' l/s');
       res3=horzcat('Pa= ',num2str(Pa/10^3),' kW');
       res4=horzcat('beta2= ',num2str(beta2*180/pi),' °');
       
       figresultados({res1,'',res2,'',res3,'',res4},4);
    end

    function gohome(~,~)
        close(gcf);
        run('App_Turbinas_R.m');
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