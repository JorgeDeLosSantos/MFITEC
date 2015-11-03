function ta_1
% Turbinas de acción (Tipo 1)
% $ Ref. 221 $
% $ Por: Jorge De Los Santos $
% $ Rev. 1.0 $ 11/11/13 $

%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));
%% Características generales
cfondo=[0.5 0.8 0.7]; % color del fondo
etsize=8; % Tamaño de fuente de las etiquetas
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-TA','position',[500,300,500,300],'color',cfondo);
centerfig(f);
%% Menú principal 
barraMenuTA(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra columna  ------------------------------------------------------------

uicontrol(pp,'style','text','String','D','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

uicontrol(pp,'style','text','String','d','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dd=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);

uicontrol(pp,'style','text','String','H','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dH=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);

uicontrol(pp,'style','text','String','beta2','position',[10 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
uicontrol(pp,'style','text','String','°','position',[150 100 30 20],'backgroundcolor',cfondo);



% 2da Columna -------------------------------------------------------------

uicontrol(pp,'style','text','String','Kc','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKc=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
uicontrol(pp,'style','text','String','','position',[350 220 30 20],'backgroundcolor',cfondo);

uicontrol(pp,'style','text','String','Ku','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKu=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
uicontrol(pp,'style','text','String','','position',[350 180 30 20],'backgroundcolor',cfondo);

uicontrol(pp,'style','text','String','Kw','position',[210 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKw=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
uicontrol(pp,'style','text','String','','position',[350 140 30 20],'backgroundcolor',cfondo);

uicontrol(pp,'style','text','String','eta_m','position',[210 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
deta_m=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
uicontrol(pp,'style','text','String','','position',[350 100 30 20],'backgroundcolor',cfondo);

% Botón calcular
uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
    'callback',@calcular,'fontsize',10,'fontweight','bold');


%% Menú Botones
posb=250; % Posición de referencia del primer botón

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
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            D=str2double(get(dD,'String'));
            d=str2double(get(dd,'String'));
            H=str2double(get(dH,'String'));
            beta2=str2double(get(dbeta2,'String'))*pi/180;  % Radianes
            Kc=str2double(get(dKc,'String'));
            Ku=str2double(get(dKu,'String'));
            Kw=str2double(get(dKw,'String'));
            eta_m=str2double(get(deta_m,'String'));
            
            c1=Kc*sqrt(2*g*H);
            u=Ku*sqrt(2*g*H);
            w1=c1-u;
            w1u=w1;
            w2=Kw*w1;
            w2u=-w2*cos(beta2);
            Q=(pi*d^2*c1)/4;
            F=Q*rho*(w1u-w2u);
            Pi=F*u;
            Hu=Pi/(Q*rho*g);
            eta_h=Hu/H;
            eta=eta_m*eta_h;
            n=(60*u)/(pi*D);
            
            res1=horzcat('F= ',num2str(F),' N');
            res2=horzcat('Hu= ',num2str(Hu),' m');
            res3=horzcat('Pi= ',num2str(Pi/10^3),' kW');
            res4=horzcat('eta_h= ',num2str(eta_h*100),' %');
            res5=horzcat('n= ',num2str(n),' rpm');
            res6=horzcat('Q= ',num2str(Q*1000),' l/s');
            res7=horzcat('eta= ',num2str(eta*100),' %');
            
            figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6,'',res7},7);
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
        %Proc Gral
        D=str2double(get(dD,'String'));
        d=str2double(get(dd,'String'));
        H=str2double(get(dH,'String'));
        beta2=str2double(get(dbeta2,'String'))*pi/180;  % Radianes
        Kc=str2double(get(dKc,'String'));
        Ku=str2double(get(dKu,'String'));
        Kw=str2double(get(dKw,'String'));
        eta_m=str2double(get(deta_m,'String'));
        
        c1=Kc*sqrt(2*g*H);
        u=Ku*sqrt(2*g*H);
        w1=c1-u;
        w1u=w1;
        w2=Kw*w1;
        w2u=-w2*cos(beta2);
        Q=(pi*d^2*c1)/4;
        F=Q*rho*(w1u-w2u);
        Pi=F*u;
        Hu=Pi/(Q*rho*g);
        eta_h=Hu/H;
        eta=eta_m*eta_h;
        n=(60*u)/(pi*D);
        
        sgraph = questdlg('¿Qué desea graficar?', ...
            'Menú Gráficas Disponibles', ...
            'H - Q','H - n','H - Pi','H - Q');
        switch sgraph
            case 'H - Q'
                H=insertRango('H (m)','10:200');
                c1=Kc*sqrt(2*g*H);
                Q=(pi*d^2*c1)/4;
                grafica(H,Q*10^3,'H (m)','Q (l/s)','H vs Q');
            case 'H - n'
                H=insertRango('H (m)','10:200');
                u=Ku*sqrt(2*g*H);
                n=(60*u)/(pi*D);
                grafica(H,n,'H (m)','n (rpm)','H vs n');
            case 'H - Pi'
                H=insertRango('H (m)','10:200');
                c1=Kc*sqrt(2*g*H);
                u=Ku*sqrt(2*g*H);
                w1=c1-u;
                w1u=w1;
                w2=Kw*w1;
                w2u=-w2*cos(beta2);
                Q=(pi*d^2*c1)/4;
                F=Q*rho.*(w1u-w2u);
                Pi=F.*u;
                grafica(H,Pi/10^3,'H (m)','Pi (kW)','H vs Pi');
        end
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