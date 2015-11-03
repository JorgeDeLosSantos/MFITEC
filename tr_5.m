function tr_5(subtipo)
% MOD 09/12/13
%% Constantes persistentes
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));
%% Características generales
cfondo=[0.85 0.82 0.75];
etsize=8;
%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-TR','position',[500,300,500,300],'color',cfondo);

%% Menú
barramenuTR(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra col  --------------------------------------------------------

eQ=uicontrol(pp,'style','text','String','Q','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dQ=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uQ=uicontrol(pp,'style','text','String','m^3/s','position',[150 220 30 20],'backgroundcolor',cfondo);

if subtipo==1 | subtipo==2 | subtipo==3
    en=uicontrol(pp,'style','text','String','n','position',[10 180 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[150 180 30 20],'backgroundcolor',cfondo);
    
    eD1=uicontrol(pp,'style','text','String','D1','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dD1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    uD1=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);
    
    ealpha1=uicontrol(pp,'style','text','String','alpha1','position',[10 100 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dalpha1=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    ualpha1=uicontrol(pp,'style','text','String','°','position',[150 100 30 20],'backgroundcolor',cfondo);
elseif subtipo==4 | subtipo==5 | subtipo==6 | subtipo==7
    eu1=uicontrol(pp,'style','text','String','u1','position',[10 180 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    du1=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
    uu1=uicontrol(pp,'style','text','String','m/s','position',[150 180 30 20],'backgroundcolor',cfondo);
    
    ealpha1=uicontrol(pp,'style','text','String','alpha1','position',[10 140 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dalpha1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    ualpha1=uicontrol(pp,'style','text','String','°','position',[150 140 30 20],'backgroundcolor',cfondo);
end

if subtipo==4 | subtipo==6
    eD1=uicontrol(pp,'style','text','String','D1','position',[10 100 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dD1=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    uD1=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);
elseif subtipo==5 | subtipo==7
    en=uicontrol(pp,'style','text','String','n','position',[10 100 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[150 100 30 20],'backgroundcolor',cfondo);
end
% 2da Col ----------------------------------------------------------------

ec1=uicontrol(pp,'style','text','String','c1','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc1=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
uc1=uicontrol(pp,'style','text','String','m/s','position',[350 220 30 20],'backgroundcolor',cfondo);

if subtipo==1 | subtipo==2 | subtipo==6 | subtipo==7
    eeta_h=uicontrol(pp,'style','text','String','eta_h','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta_h=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    ueta_h=uicontrol(pp,'style','text','String','','position',[350 180 30 20],'backgroundcolor',cfondo);
end
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
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            Q=str2double(get(dQ,'String'));
            c1=str2double(get(dc1,'String'));
            alpha1=str2double(get(dalpha1,'String'))*pi/180;
            
            if subtipo==1
                n=str2double(get(dn,'String'));
                D1=str2double(get(dD1,'String'));
                eta_h=str2double(get(deta_h,'String'));
                eta_m=str2double(get(deta_m,'String'));
                
                u1=(pi*D1*n)/60;
                c1m=c1*sin(alpha1);
                c1u=c1m/tan(alpha1);
                Hu=(u1*c1u)/g;
                H=Hu/eta_h;
                Pi=Q*rho*g*Hu;
                Pa=Pi*eta_m;
                
                res1=horzcat('u1= ',num2str(u1),' m/s');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Pi= ',num2str(Pi/10^3),' kW');
                res4=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3,'',res4},4);
            elseif subtipo==2
                n=str2double(get(dn,'String'));
                D1=str2double(get(dD1,'String'));
                eta_h=str2double(get(deta_h,'String'));
                
                u1=(pi*D1*n)/60;
                c1m=c1*sin(alpha1);
                c1u=c1m/tan(alpha1);
                Hu=(u1*c1u)/g;
                H=Hu/eta_h;
                eta=eta_h;
                Pa=Q*rho*g*H*eta;
                
                res1=horzcat('u1= ',num2str(u1),' m/s');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3},3);
            elseif subtipo==3
                n=str2double(get(dn,'String'));
                D1=str2double(get(dD1,'String'));
                
                u1=(pi*D1*n)/60;
                c1m=c1*sin(alpha1);
                c1u=c1m/tan(alpha1);
                Hu=(u1*c1u)/g;
                H=Hu;
                Pa=Q*rho*g*H;
                
                res1=horzcat('u1= ',num2str(u1),' m/s');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3},3);
            elseif subtipo==4
                u1=str2double(get(du1,'String'));
                D1=str2double(get(dD1,'String'));
                
                n=(60*u1)/(pi*D1);
                c1m=c1*sin(alpha1);
                c1u=c1m/tan(alpha1);
                Hu=(u1*c1u)/g;
                H=Hu;
                Pa=Q*rho*g*H;
                
                res1=horzcat('n= ',num2str(n),' rpm');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3},3);
            elseif subtipo==5
                u1=str2double(get(du1,'String'));
                n=str2double(get(dn,'String'));
                
                D1=(60*u1)/(pi*n);
                c1m=c1*sin(alpha1);
                c1u=c1m/tan(alpha1);
                Hu=(u1*c1u)/g;
                H=Hu;
                Pa=Q*rho*g*H;
                
                res1=horzcat('D1= ',num2str(D1),' m');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3},3);
            elseif subtipo==6
                u1=str2double(get(du1,'String'));
                D1=str2double(get(dD1,'String'));
                eta_h=str2double(get(deta_h,'String'));
                
                n=(60*u1)/(pi*D1);
                c1m=c1*sin(alpha1);
                c1u=c1m/tan(alpha1);
                Hu=(u1*c1u)/g;
                H=Hu/eta_h;
                eta=eta_h;
                Pa=Q*rho*g*H*eta;
                P=Q*rho*g*H;
                
                res1=horzcat('n= ',num2str(n),' rpm');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res4=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3,'',res4},4);
            elseif subtipo==7
                u1=str2double(get(du1,'String'));
                n=str2double(get(dn,'String'));
                eta_h=str2double(get(deta_h,'String'));
                
                D1=(60*u1)/(pi*n);
                c1m=c1*sin(alpha1);
                c1u=c1m/tan(alpha1);
                Hu=(u1*c1u)/g;
                H=Hu/eta_h;
                eta=eta_h;
                Pa=Q*rho*g*H*eta;
                
                res1=horzcat('D1= ',num2str(D1),' m');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3},3);
            end
        end
        
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