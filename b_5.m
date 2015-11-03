function b_5(subtipo)
%% Descripción General
% REF sub1 192 || sub2 1924 ||
% MOD 08/11/2013

%% Constantes Persistentes -------------------------------------
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales --------------------------------
cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz ------------------------------------------------------
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,300],'color',cfondo);
centerfig(f);

%% Menú Superior   --------------------------------------------
barraMenuBC(f);

%% Datos de entrada y boton calcular  ----------------------------------

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 410 270],'backgroundcolor',cfondo);

% 1ra col
eD1=uicontrol(pp,'style','text','String','D1','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD1=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uD1=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

eD2=uicontrol(pp,'style','text','String','D2','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);

if subtipo~=5
    eb1=uicontrol(pp,'style','text','String','b1','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    db1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    ub1=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);
    
    eb2=uicontrol(pp,'style','text','String','b2','position',[10 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    db2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    ub2=uicontrol(pp,'style','text','String','m','position',[150 100 30 20],'backgroundcolor',cfondo);
elseif subtipo==5
    eA1=uicontrol(pp,'style','text','String','A1','position',[10 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dA1=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
    uA1=uicontrol(pp,'style','text','String','m^2','position',[150 140 30 20],'backgroundcolor',cfondo);
    
    eA2=uicontrol(pp,'style','text','String','A2','position',[10 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dA2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    uA2=uicontrol(pp,'style','text','String','m^2','position',[150 100 30 20],'backgroundcolor',cfondo);
end

if subtipo==2
    eME=uicontrol(pp,'style','text','String','ME','position',[10 60 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dME=uicontrol(pp,'style','edit','String','','position',[50 60 100 20]);
    uME=uicontrol(pp,'style','text','String','mca','position',[150 60 30 20],'backgroundcolor',cfondo);
end

% Botón de rendimientos
if subtipo==2 | subtipo==3
    brendimientos=uicontrol(pp,'style','pushbutton','String','Rendimientos','position',[250 100 100 20],...
        'callback',@rendimientos);
end

% 2da Col

ebeta1=uicontrol(pp,'style','text','String','beta1','position',[210 220 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta1=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
ubeta1=uicontrol(pp,'style','text','String','°','position',[350 220 30 20],'backgroundcolor',cfondo);

ebeta2=uicontrol(pp,'style','text','String','beta2','position',[210 180 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
ubeta2=uicontrol(pp,'style','text','String','°','position',[350 180 30 20],'backgroundcolor',cfondo);

if subtipo==4
    eQ=uicontrol(pp,'style','text','String','Q','position',[210 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dQ=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    uQ=uicontrol(pp,'style','text','String','m^3/s','position',[350 140 30 20],'backgroundcolor',cfondo);
else
    en=uicontrol(pp,'style','text','String','n','position',[210 140 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[250 140 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[350 140 30 20],'backgroundcolor',cfondo);
end


if subtipo==4 |subtipo==5
    eeta=uicontrol(pp,'style','text','String','eta','position',[210 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta=uicontrol(pp,'style','edit','String','','position',[250 100 100 20]);
    ueta=uicontrol(pp,'style','text','String','','position',[350 100 30 20],'backgroundcolor',cfondo);
end

% Calcular PB -----------------------------
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 10 80 25],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');


%% Menú Botones ----------------------------------------------------
posb=250;

uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',{@gotrian,subtipo},'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/triangulo.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',{@gographics,subtipo},'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-6*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


%% Funciones ----------------------------------------------------------
    function calcular(~,~,subtipo)
        global eta_v eta_h eta_m alpha1 alpha2 u1 u2 c1 c2
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            D1=str2double(get(dD1,'String'));
            D2=str2double(get(dD2,'String'));
            if subtipo~=5
                b1=str2double(get(db1,'String'));
                b2=str2double(get(db2,'String'));
            elseif subtipo==5
                A1=str2double(get(dA1,'String'));
                A2=str2double(get(dA2,'String'));
            end
            beta1=str2double(get(dbeta1,'String'))*pi/180; % Conversión a Radianes
            beta2=str2double(get(dbeta2,'String'))*pi/180; % Conversión a Radianes
            if subtipo~=4
                n=str2double(get(dn,'String'));
            end
            
            if subtipo==1
                u1=(pi*D1*n)/60;
                u2=(pi*D2*n)/60;
                
                c1m=u1*tan(beta1);
                alpha1=90*pi/180;
                c1=c1m;
                c1u=0;
                Q=pi*b1*D1*c1m;
                c2m=(b1*D1*c1m)/(b2*D2);
                c2u=u2-(c2m/tan(beta2));
                alpha2=atan(c2m/c2u);
                c2=sqrt(c2u^2+c2m^2);
                Hu=(u2*c2u-u1*c1u)/g;
                eta_h=1;
                eta=eta_h;
                H=eta_h*Hu;
                P=Q*rho*g*H;
                Pa=P/eta;
                
                res1=horzcat('Q= ',num2str(Q*1000),' l/s');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('P= ',num2str(P/10^3), ' kW');
                res4=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3,'',res4},4);
                
            elseif subtipo==2
                ME=str2double(get(dME,'String'));
                eta=eta_m*eta_h*eta_m;
                
                u1=(pi*D1*n)/60;
                u2=(pi*D2*n)/60;
                
                c1m=u1*tan(beta1);
                c1=c1m;
                c1u=0;
                alpha1=90*pi/180;
                Q=pi*b1*D1*c1m;
                c2m=(b1*D1*c1m)/(b2*D2);
                c2u=u2-(c2m/tan(beta2));
                c2=sqrt(c2u^2+c2m^2);
                alpha2=atan(c2m/c2u);
                Hu=(u2*c2u-u1*c1u)/g;
                H=eta_h*Hu;
                Pa=(Q*rho*g*H)/eta;
                PS=rho*g*(H+ME);
                
                res1=horzcat('Q= ',num2str(Q*1000),' l/s');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('Hu= ',num2str(Hu), ' m');
                res4=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res5=horzcat('PS= ',num2str(PS/10^3),' kPa');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
                
            elseif subtipo==3
                u1=(pi*D1*n)/60;
                u2=(pi*D2*n)/60;
                eta=eta_m*eta_h*eta_v;
                
                c1m=u1*tan(beta1);
                c1=c1m;
                c1u=0;
                alpha1=90*pi/180;
                Q=pi*b1*D1*c1m;
                c2m=(b1*D1*c1m)/(b2*D2);
                c2u=u2-(c2m/tan(beta2));
                c2=sqrt(c2u^2+c2m^2);
                alpha2=atan(c2m/c2u);
                Hu=(u2*c2u-u1*c1u)/g;
                
                H=eta_h*Hu;
                P=Q*rho*g*H;
                Pa=P/eta;
                
                res1=horzcat('Q= ',num2str(Q*1000),' l/s');
                res2=horzcat('H= ',num2str(H),' m');
                res3=horzcat('P= ',num2str(P/10^3), ' kW');
                res4=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2,'',res3,'',res4},4);
                
            elseif subtipo==4
                Q=str2double(get(dQ,'String'));
                eta=str2double(get(deta,'String'));
                
                c1m=Q/(pi*b1*D1);
                c1=c1m;
                alpha1=90*pi/180;
                u1=c1m/tan(beta1);
                u2=(D2/D1)*u1;
                c2m=(b1*D1*c1m)/(b2*D2);
                c2u=u2-(c2m/tan(beta2));
                c2=sqrt(c2u^2+c2m^2);
                alpha2=atan(c2m/c2u);
                w1=c1m/sin(beta1);
                w2=c2m/sin(beta2);
                n=(60*u1)/(pi*D1);
                Hu=(u2*c2u)/g;
                H=eta*Hu;
                Pa=(Q*rho*g*H)/eta;
                
                res1=horzcat('n= ',num2str(n),' rpm');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res3=horzcat('H= ',num2str(H),' m');
                res4=horzcat('u1= ',num2str(u1),' m/s');
                res5=horzcat('u2= ',num2str(u2),' m/s');
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
                
            elseif subtipo==5
                eta=str2double(get(deta,'String'));
                
                u1=(pi*D1*n)/60;
                u2=(pi*D2*n)/60;
                c1=u1*tan(beta1);
                alpha1=90*pi/180;
                c1m=c1;
                Q=A1*c1m;
                c2m=Q/A2;
                w1=sqrt(u1^2+c1^2);
                c2u=u2-(c2m/tan(beta2));
                w2=sqrt(c2m^2+(c2m/tan(beta2))^2);
                c2=sqrt(c2u^2+c2m^2);
                alpha2=atan(c2m/c2u);
                Hu=(u2*c2u)/g;
                H=eta*Hu;
                Pa=(Q*rho*g*H)/eta;
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res3=horzcat('H= ',num2str(H),' m');
                res4=horzcat('u1= ',num2str(u1),' m/s');
                res5=horzcat('u2= ',num2str(u2),' m/s');
                res6=horzcat('w1= ',num2str(w1),' m/s');
                res7=horzcat('w2= ',num2str(w2),' m/s');
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6,'',res7},8);
            end
        end
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

    function gotrian(~,~,subtipo)
        global alpha1 alpha2 u1 u2 c1 c2
        if subtipo==1 | subtipo==2 | subtipo==3 | subtipo==4 | subtipo==5
            triangulos(u1,c1,alpha1,u2,c2,alpha2);
        else
            msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
        end
    end

    function gographics(~,~,subtipo)
        global eta_h eta_m eta_v
        D1=str2double(get(dD1,'String'));
        D2=str2double(get(dD2,'String'));
        if subtipo~=5
            b1=str2double(get(db1,'String'));
            b2=str2double(get(db2,'String'));
        elseif subtipo==5
            A1=str2double(get(dA1,'String'));
            A2=str2double(get(dA2,'String'));
        end
        beta1=str2double(get(dbeta1,'String'))*pi/180; % Conversión a Radianes
        beta2=str2double(get(dbeta2,'String'))*pi/180; % Conversión a Radianes
        if subtipo~=4
            n=str2double(get(dn,'String'));
        end
        
        if subtipo==1
            n=insertRango('n (rpm)','100:2000');
            u1=(pi*D1*n)/60;
            u2=(pi*D2*n)/60;
            c1m=u1*tan(beta1);
            alpha1=90*pi/180;
            c1=c1m;
            c1u=0;
            Q=pi*b1*D1*c1m;
            c2m=(b1*D1*c1m)/(b2*D2);
            c2u=u2-(c2m/tan(beta2));
            alpha2=atan(c2m/c2u);
            c2=sqrt(c2u.^2+c2m.^2);
            Hu=(u2.*c2u-u1.*c1u)/g;
            eta_h=1;
            eta=eta_h;
            H=eta_h*Hu;
            P=Q.*rho*g.*H;
            Pa=P/eta;
            grafica(n,Pa/10^3,'n (rpm)','Pa ( kW )','');
            
        elseif subtipo==2
            ME=str2double(get(dME,'String'));
            eta=eta_m*eta_h*eta_v;
            
            u1=(pi*D1*n)/60;
            u2=(pi*D2*n)/60;
            
            c1m=u1*tan(beta1);
            c1=c1m;
            c1u=0;
            alpha1=90*pi/180;
            Q=pi*b1*D1*c1m;
            c2m=(b1*D1*c1m)/(b2*D2);
            c2u=u2-(c2m/tan(beta2));
            c2=sqrt(c2u^2+c2m^2);
            alpha2=atan(c2m/c2u);
            Hu=(u2*c2u-u1*c1u)/g;
            H=eta_h*Hu;
            Pa=(Q*rho*g*H)/eta;
            PS=rho*g*(H+ME);
            
        elseif subtipo==3
            u1=(pi*D1*n)/60;
            u2=(pi*D2*n)/60;
            eta=eta_m*eta_h*eta_m;
            
            c1m=u1*tan(beta1);
            c1=c1m;
            c1u=0;
            alpha1=90*pi/180;
            Q=pi*b1*D1*c1m;
            c2m=(b1*D1*c1m)/(b2*D2);
            c2u=u2-(c2m/tan(beta2));
            c2=sqrt(c2u^2+c2m^2);
            alpha2=atan(c2m/c2u);
            Hu=(u2*c2u-u1*c1u)/g;
            
            H=eta_h*Hu;
            P=Q*rho*g*H;
            Pa=P/eta;
            
        elseif subtipo==4
            Q=str2double(get(dQ,'String'));
            eta=str2double(get(deta,'String'));
            
            c1m=Q/(pi*b1*D1);
            c1=c1m;
            alpha1=90*pi/180;
            u1=c1m/tan(beta1);
            u2=(D2/D1)*u1;
            c2m=(b1*D1*c1m)/(b2*D2);
            c2u=u2-(c2m/tan(beta2));
            c2=sqrt(c2u^2+c2m^2);
            alpha2=atan(c2m/c2u);
            w1=c1m/sin(beta1);
            w2=c2m/sin(beta2);
            n=(60*u1)/(pi*D1);
            Hu=(u2*c2u)/g;
            H=eta*Hu;
            Pa=(Q*rho*g*H)/eta;
            
        elseif subtipo==5
            eta=str2double(get(deta,'String'));
            
            u1=(pi*D1*n)/60;
            u2=(pi*D2*n)/60;
            c1=u1*tan(beta1);
            alpha1=90*pi/180;
            c1m=c1;
            Q=A1*c1m;
            c2m=Q/A2;
            w1=sqrt(u1^2+c1^2);
            c2u=u2-(c2m/tan(beta2));
            w2=sqrt(c2m^2+(c2m/tan(beta2))^2);
            c2=sqrt(c2u^2+c2m^2);
            alpha2=atan(c2m/c2u);
            Hu=(u2*c2u)/g;
            H=eta*Hu;
            Pa=(Q*rho*g*H)/eta;
            
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