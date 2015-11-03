function ta_6(subtipo)
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

ed=uicontrol(pp,'style','text','String','d','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dd=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
ud=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

eD=uicontrol(pp,'style','text','String','D','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uD=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);

if subtipo==1
    ec1=uicontrol(pp,'style','text','String','c1','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dc1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    uc1=uicontrol(pp,'style','text','String','m/s','position',[150 140 30 20],'backgroundcolor',cfondo);
    
    eKw=uicontrol(pp,'style','text','String','Kw','position',[10 100 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dKw=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    uKw=uicontrol(pp,'style','text','String','','position',[150 100 30 20],'backgroundcolor',cfondo);
else
    uicontrol(pp,'style','text','String','n','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    uicontrol(pp,'style','text','String','rpm','position',[150 140 30 20],'backgroundcolor',cfondo);
end


% 2da Col

ebeta2=uicontrol(pp,'style','text','String','beta2','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
ubeta2=uicontrol(pp,'style','text','String','°','position',[350 220 30 20],'backgroundcolor',cfondo);

ePa=uicontrol(pp,'style','text','String','Pa','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dPa=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
uPa=uicontrol(pp,'style','text','String','kW','position',[350 180 30 20],'backgroundcolor',cfondo);

if subtipo==1
    eeta_m=uicontrol(pp,'style','text','String','eta_m','position',[210 140 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta_m=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    ueta_m=uicontrol(pp,'style','text','String','','position',[350 140 30 20],'backgroundcolor',cfondo);
end

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');


%% Menú Botones
posb=250;

regresar=uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

tvel=uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',@gotrian,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/triangulo.png'));

graphs=uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',{@gographics,subtipo},'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

convuni=uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

tablasb=uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

calcu=uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

helping=uicontrol('style','pushbutton','String','','position',[0 posb-6*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


%% Funciones
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            if subtipo==1
                d=str2double(get(dd,'String'));
                D=str2double(get(dD,'String'));
                c1=str2double(get(dc1,'String'));
                Kw=str2double(get(dKw,'String'));
                beta2=str2double(get(dbeta2,'String'))*pi/180;
                Pa=str2double(get(dPa,'String'))*10^3;
                eta_m=str2double(get(deta_m,'String'));
                
                Q=(pi*d^2*c1)/4;
                syms u
                u=solve((Q*rho*eta_m*(1+cos(beta2))*(u^2-c1*u))+Pa==0,u);
                u=double(u(1));
                n=(60*u)/(pi*D);
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('u= ',num2str(u),' m/s');
                res3=horzcat('n= ',num2str(n),' rpm');
                
                figresultados({res1,'',res2,'',res3},3);
                
            elseif subtipo==2
                d=str2double(get(dd,'String'));
                D=str2double(get(dD,'String'));
                beta2=str2double(get(dbeta2,'String'))*pi/180;
                Pa=str2double(get(dPa,'String'))*10^3;
                n=str2double(get(dn,'String'));
                
                M=(60*Pa)/(2*pi*n);
                F=(2*M)/D;
                u=(pi*D*n)/60;
                syms c1
                a=(pi/4)*(d^2)*rho*(1+cos(beta2));
                b=-(pi/4)*(d^2)*rho*u*(1+cos(beta2));
                c=-F;
                sol=solve(a*c1^2+b*c1+c,c1);
                c1=double(sol(1));
                
                res1=horzcat('c1= ',num2str(c1),' m/s');
                res2=horzcat('M= ',num2str(M),' N*m');
                
                figresultados({res1,'',res2},1);
                
            end
            
        end
        
    end

    function gohome(~,~)
        close(gcf);
        run('App_Turbinas_A.m');
    end

    function gotrian(~,~)
        msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
    end

    function gographics(~,~,subtipo)
%         if subtipo==1
%                 d=str2double(get(dd,'String'));
%                 D=str2double(get(dD,'String'));
%                 c1=str2double(get(dc1,'String'));
%                 Kw=str2double(get(dKw,'String'));
%                 beta2=insertRango('\beta_2 (°)','1:85')*pi/180;
%                 Pa=str2double(get(dPa,'String'))*10^3;
%                 eta_m=str2double(get(deta_m,'String'));
%                 
%                 Q=(pi*d^2*c1)/4;
%                 syms u
%                 u=solve((Q*rho*eta_m*(1+cos(beta2))*(u^2-c1*u))+Pa==0,u);
%                 u=double(u(1));
%                 n=(60*u)/(pi*D);
%                 
% 
%                 
%             elseif subtipo==2
%                 d=str2double(get(dd,'String'));
%                 D=str2double(get(dD,'String'));
%                 beta2=str2double(get(dbeta2,'String'))*pi/180;
%                 Pa=str2double(get(dPa,'String'))*10^3;
%                 n=str2double(get(dn,'String'));
%                 
%                 M=(60*Pa)/(2*pi*n);
%                 F=(2*M)/D;
%                 u=(pi*D*n)/60;
%                 syms c1
%                 a=(pi/4)*(d^2)*rho*(1+cos(beta2));
%                 b=-(pi/4)*(d^2)*rho*u*(1+cos(beta2));
%                 c=-F;
%                 sol=solve(a*c1^2+b*c1+c,c1);
%                 c1=double(sol(1));
                
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