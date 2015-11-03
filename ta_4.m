function ta_4
% REF 221
% @ DLS
% Mod 11/11/13

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));
%% Características generales
cfondo=[0.5 0.8 0.7];
etsize=8;
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-TA','position',[500,300,500,300],'color',cfondo);

%% Menú
barraMenuTA(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra col  --------------------------------------------------------

eKc=uicontrol(pp,'style','text','String','Kc','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKc=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uKc=uicontrol(pp,'style','text','String','','position',[150 220 30 20],'backgroundcolor',cfondo);

eKu=uicontrol(pp,'style','text','String','Ku','position',[10 185 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKu=uicontrol(pp,'style','edit','String','','position',[50 185 100 20]);
uKu=uicontrol(pp,'style','text','String','','position',[150 185 30 20],'backgroundcolor',cfondo);

eKw=uicontrol(pp,'style','text','String','Kw','position',[10 150 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKw=uicontrol(pp,'style','edit','String','','position',[50 150 100 20]);
uKw=uicontrol(pp,'style','text','String','','position',[150 150 30 20],'backgroundcolor',cfondo);

ed=uicontrol(pp,'style','text','String','d','position',[10 115 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dd=uicontrol(pp,'style','edit','String','','position',[50 115 100 20]);
ud=uicontrol(pp,'style','text','String','m','position',[150 115 30 20],'backgroundcolor',cfondo);

ebeta2=uicontrol(pp,'style','text','String','beta2','position',[10 80 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[50 80 100 20]);
ubeta2=uicontrol(pp,'style','text','String','°','position',[150 80 30 20],'backgroundcolor',cfondo);


% 2da Col

eeta_m=uicontrol(pp,'style','text','String','eta_m','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
deta_m=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
ueta_m=uicontrol(pp,'style','text','String','','position',[350 220 30 20],'backgroundcolor',cfondo);

eHb=uicontrol(pp,'style','text','String','Hb','position',[210 185 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dHb=uicontrol(pp,'style','edit','String','','position',[250 185 100 20]);
uHb=uicontrol(pp,'style','text','String','m','position',[350 185 30 20],'backgroundcolor',cfondo);

eL=uicontrol(pp,'style','text','String','L','position',[210 150 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dL=uicontrol(pp,'style','edit','String','','position',[250 150 100 20]);
uL=uicontrol(pp,'style','text','String','m','position',[350 150 30 20],'backgroundcolor',cfondo);

edt=uicontrol(pp,'style','text','String','dt','position',[210 115 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
ddt=uicontrol(pp,'style','edit','String','','position',[250 115 100 20]);
udt=uicontrol(pp,'style','text','String','m','position',[350 115 30 20],'backgroundcolor',cfondo);

efr=uicontrol(pp,'style','text','String','fr','position',[210 80 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dfr=uicontrol(pp,'style','edit','String','','position',[250 80 100 20]);
ufr=uicontrol(pp,'style','text','String','','position',[350 80 30 20],'backgroundcolor',cfondo);


% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
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
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            Kc=str2double(get(dKc,'String'));
            Ku=str2double(get(dKu,'String'));
            Kw=str2double(get(dKw,'String'));
            d=str2double(get(dd,'String'));
            beta2=str2double(get(dbeta2,'String'))*pi/180;
            eta_m=str2double(get(deta_m,'String'));
            Hb=str2double(get(dHb,'String'));
            L=str2double(get(dL,'String'));
            dt=str2double(get(ddt,'String'));
            fr=str2double(get(dfr,'String'));
            
            syms c1
            c1=solve(Hb-(((fr*L*d^4)/(2*dt^5*g))*c1^2)-(c1^2/(2*Kc^2*g))==0,c1);
            c1=double(c1(1));
            H=c1^2/(2*Kc^2*g);
            c1u=c1;
            u=Ku*sqrt(2*g*H);
            w1=c1-u;
            w2=Kw*w1;
            c2u=u-w2*cos(beta2);
            Hu=(u/g)*(c1u-c2u);
            Q=(pi*d^2*c1)/4;
            eta_h=Hu/H;
            Pi=Q*rho*g*Hu;
            Pa=eta_m*Pi;
            eta=eta_h*eta_m;
            
            res1=horzcat('c1= ',num2str(c1),' m/s');
            res2=horzcat('H= ',num2str(H),' m');
            res3=horzcat('Q= ',num2str(Q*10^3),' m^3/s');
            res4=horzcat('Pa= ',num2str(Pa/10^3),' kW');
            res5=horzcat('u= ',num2str(u),' m/s');
            
            figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
        end
        
    end

    function gohome(~,~)
        close(gcf);
        run('App_Turbinas_A.m');
    end

    function gotrian(~,~)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function gographics(~,~)
        Kc=str2double(get(dKc,'String'));
        Ku=str2double(get(dKu,'String'));
        Kw=str2double(get(dKw,'String'));
        d=str2double(get(dd,'String'));
        beta2=[pi/45:pi/90:pi/2];
        eta_m=str2double(get(deta_m,'String'));
        Hb=str2double(get(dHb,'String'));
        L=str2double(get(dL,'String'));
        dt=str2double(get(ddt,'String'));
        fr=str2double(get(dfr,'String'));
        
        syms c1
        c1=solve(Hb-(((fr*L*d^4)/(2*dt^5*g))*c1^2)-(c1^2/(2*Kc^2*g))==0,c1);
        c1=double(c1(1));
        H=c1^2/(2*Kc^2*g);
        c1u=c1;
        u=Ku*sqrt(2*g*H);
        w1=c1-u;
        w2=Kw*w1;
        c2u=u-w2*cos(beta2);
        Hu=(u/g)*(c1u-c2u);
        Q=(pi*d^2*c1)/4;
        eta_h=Hu/H;
        Pi=Q*rho*g*Hu;
        Pa=eta_m*Pi;
        eta=eta_h*eta_m;
        grafica(beta2*180/pi,eta*100,'\beta_2 ( ° )','\eta ( % )','\beta_2 vs \eta')
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