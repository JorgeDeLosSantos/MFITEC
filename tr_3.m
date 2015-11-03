function tr_3(subtipo)
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

eD1=uicontrol(pp,'style','text','String','D1','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD1=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uD1=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

eD2=uicontrol(pp,'style','text','String','D2','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);

eb1=uicontrol(pp,'style','text','String','b1','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
ub1=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);

eb2=uicontrol(pp,'style','text','String','b2','position',[10 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
ub2=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);



% 2da Col
if subtipo==1 | subtipo==2
    eH=uicontrol(pp,'style','text','String','H','position',[210 220 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dH=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
    uH=uicontrol(pp,'style','text','String','m','position',[350 220 30 20],'backgroundcolor',cfondo);
    
    ec1m=uicontrol(pp,'style','text','String','c1m','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dc1m=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    uc1m=uicontrol(pp,'style','text','String','m/s','position',[350 180 30 20],'backgroundcolor',cfondo);
    
    ealpha1=uicontrol(pp,'style','text','String','alpha1','position',[210 140 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dalpha1=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    ualpha1=uicontrol(pp,'style','text','String','°','position',[350 140 30 20],'backgroundcolor',cfondo);
elseif subtipo==3 | subtipo==4
    eH=uicontrol(pp,'style','text','String','H','position',[210 220 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dH=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
    uH=uicontrol(pp,'style','text','String','m','position',[350 220 30 20],'backgroundcolor',cfondo);
    
    eQ=uicontrol(pp,'style','text','String','Q','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dQ=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    uQ=uicontrol(pp,'style','text','String','m^3/s','position',[350 180 30 20],'backgroundcolor',cfondo);
    
    ealpha1=uicontrol(pp,'style','text','String','alpha1','position',[210 140 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dalpha1=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    ualpha1=uicontrol(pp,'style','text','String','°','position',[350 140 30 20],'backgroundcolor',cfondo);
elseif subtipo==5
    ec1=uicontrol(pp,'style','text','String','c1','position',[210 220 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dc1=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
    uc1=uicontrol(pp,'style','text','String','m/s','position',[350 220 30 20],'backgroundcolor',cfondo);
    
    en=uicontrol(pp,'style','text','String','n','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[350 180 30 20],'backgroundcolor',cfondo);
    
    ealpha1=uicontrol(pp,'style','text','String','alpha1','position',[210 140 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dalpha1=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    ualpha1=uicontrol(pp,'style','text','String','°','position',[350 140 30 20],'backgroundcolor',cfondo);
end

if subtipo==2 | subtipo==4
    eeta_h=uicontrol(pp,'style','text','String','eta_h','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta_h=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    ueta_h=uicontrol(pp,'style','text','String','','position',[350 100 30 20],'backgroundcolor',cfondo);
elseif subtipo==5
    eM=uicontrol(pp,'style','text','String','M','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dM=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    uM=uicontrol(pp,'style','text','String','N*m','position',[350 100 30 20],'backgroundcolor',cfondo);
    
    eeta_m=uicontrol(pp,'style','text','String','eta_m','position',[210 60 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta_m=uicontrol(pp,'style','edit','String','','position',[250 60 100 20]);
    ueta_m=uicontrol(pp,'style','text','String','','position',[350 60 30 20],'backgroundcolor',cfondo);
end


% Calcular PB
if subtipo~=5
    boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 80 25],...
        'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');
else
    boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[60 20 80 25],...
        'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');
end


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
            D1=str2double(get(dD1,'String'));
            D2=str2double(get(dD2,'String'));
            b1=str2double(get(db1,'String'));
            b2=str2double(get(db2,'String'));
            
            if subtipo==1
                H=str2double(get(dH,'String'));
                c1m=str2double(get(dc1m,'String'));
                alpha1=str2double(get(dalpha1,'String'))*pi/180;
                
                Q=pi*b1*D1*c1m;
                Pa=Q*rho*g*H;
                c2m=Q/(pi*b2*D2);
                c2=c2m;
                c1=c1m/(sin(alpha1));
                c1u=c1*cos(alpha1);
                Hu=H;
                u1=(Hu*g)/c1u;
                n=(60*u1)/(pi*D1);
                u2=(pi*D2*n)/60;
                beta2=atan(c2/u2);
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res3=horzcat('u1= ',num2str(u1),' m/s');
                res4=horzcat('u2= ',num2str(u2),' m/s');
                res5=horzcat('n= ',num2str(n),' rpm');
                res6=horzcat('beta2= ',num2str(beta2*(180/pi)),' °');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},6);
            elseif subtipo==2
                H=str2double(get(dH,'String'));
                c1m=str2double(get(dc1m,'String'));
                alpha1=str2double(get(dalpha1,'String'))*pi/180;
                eta_h=str2double(get(deta_h,'String'));
                
                Q=pi*b1*D1*c1m;
                eta=eta_h;
                Pa=Q*rho*g*H*eta;
                c2m=Q/(pi*b2*D2);
                c2=c2m;
                c1=c1m/(sin(alpha1));
                c1u=c1*cos(alpha1);
                Hu=eta_h*H;
                u1=(Hu*g)/c1u;
                n=(60*u1)/(pi*D1);
                u2=(pi*D2*n)/60;
                beta2=atan(c2/u2);
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res3=horzcat('u1= ',num2str(u1),' m/s');
                res4=horzcat('u2= ',num2str(u2),' m/s');
                res5=horzcat('n= ',num2str(n),' rpm');
                res6=horzcat('beta2= ',num2str(beta2*(pi/180)),' °');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},6);
            elseif subtipo==3
                H=str2double(get(dH,'String'));
                Q=str2double(get(dQ,'String'));
                alpha1=str2double(get(dalpha1,'String'))*pi/180;
                
                c1m=Q/(pi*b1*D1);
                Pa=Q*rho*g*H;
                c2m=Q/(pi*b2*D2);
                c2=c2m;
                c1=c1m/(sin(alpha1));
                c1u=c1*cos(alpha1);
                Hu=H;
                u1=(Hu*g)/c1u;
                n=(60*u1)/(pi*D1);
                u2=(pi*D2*n)/60;
                beta2=atan(c2/u2);
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res3=horzcat('u1= ',num2str(u1),' m/s');
                res4=horzcat('u2= ',num2str(u2),' m/s');
                res5=horzcat('n= ',num2str(n),' rpm');
                res6=horzcat('beta2= ',num2str(beta2*(180/pi)),' °');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},6);
            elseif subtipo==4
                H=str2double(get(dH,'String'));
                Q=str2double(get(dQ,'String'));
                alpha1=str2double(get(dalpha1,'String'))*pi/180;
                eta_h=str2double(get(deta_h,'String'));
                
                c1m=Q/(pi*b1*D1);
                eta=eta_h;
                Pa=Q*rho*g*H*eta;
                c2m=Q/(pi*b2*D2);
                c2=c2m;
                c1=c1m/(sin(alpha1));
                c1u=c1*cos(alpha1);
                Hu=eta_h*H;
                u1=(Hu*g)/c1u;
                n=(60*u1)/(pi*D1);
                u2=(pi*D2*n)/60;
                beta2=atan(c2/u2);
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res3=horzcat('u1= ',num2str(u1),' m/s');
                res4=horzcat('u2= ',num2str(u2),' m/s');
                res5=horzcat('n= ',num2str(n),' rpm');
                res6=horzcat('beta2= ',num2str(beta2*(180/pi)),' °');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},6);
            elseif subtipo==5
                c1=str2double(get(dc1,'String'));
                n=str2double(get(dn,'String'));
                alpha1=str2double(get(dalpha1,'String'))*pi/180;
                M=str2double(get(dM,'String'));
                eta_m=str2double(get(deta_m,'String'));
                
                u1=(pi*D1*n)/60;
                u2=(pi*D2*n)/60;
                c1m=c1*sin(alpha1);
                c1u=c1*cos(alpha1);
                w1u=u1-c1u;
                w1=sqrt(w1u^2+c1m^2);
                Q=(pi*b1*D1*c1m);
                c2m=(b1*D1*c1m)/(b2*D2);
                Pa=0.1047*n*M;
                Hu=Pa/(Q*rho*g*eta_m);
                c2u=(1/u2)*(u1*c1u-Hu*g);
                c2=sqrt(c2u^2+c2m^2);
                alpha2=atan(c2m/c2u);
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res3=horzcat('u1= ',num2str(u1),' m/s');
                res4=horzcat('u2= ',num2str(u2),' m/s');
                res5=horzcat('Hu= ',num2str(Hu),' m');
                res6=horzcat('alpha2= ',num2str(alpha2*(180/pi)),' °');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},6);
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