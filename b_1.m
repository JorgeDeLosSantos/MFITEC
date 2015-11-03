function b_1(subtipo)
% Bombas centrífugas (Tipo 1)

% Ref: $ sub1 1935 / sub2 1932 $ 
% $ Por: Jorge De Los Santos $
% $ Rev 1.0 $ 12/11/13 $

%% Constantes persistentes
persistent g rho 
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales
cfondo=[0.5 0.8 0.9]; % color de fondo
etsize=8; % tamaño de fuente de las etiquetas

%% Interfaz
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,500,300],'color',cfondo);
centerfig(f);

%% Menú principal
barraMenuBC(f);

%% Datos de entrada -------------------------------------------

pp=uipanel(f,'title','DATOS','units','pixels','position',[80 20 400 270],'backgroundcolor',cfondo);

en=uicontrol(pp,'style','text','String','n','position',[10 210 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dn=uicontrol(pp,'style','edit','String','','position',[50 210 100 20]);
un=uicontrol(pp,'style','text','String','rpm','position',[150 210 30 20],'backgroundcolor',cfondo);

eD2=uicontrol(pp,'style','text','String','D2','position',[10 170 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 170 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 170 30 20],'backgroundcolor',cfondo);

eb2=uicontrol(pp,'style','text','String','b2','position',[10 130 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
db2=uicontrol(pp,'style','edit','String','','position',[50 130 100 20]);
ub2=uicontrol(pp,'style','text','String','m','position',[150 130 30 20],'backgroundcolor',cfondo);

ebeta2=uicontrol(pp,'style','text','String','beta2','position',[10 90 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[50 90 100 20]);
ubeta2=uicontrol(pp,'style','text','String','°','position',[150 90 30 20],'backgroundcolor',cfondo);

if subtipo==1
    eH=uicontrol(pp,'style','text','String','H','position',[210 210 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dH=uicontrol(pp,'style','edit','String','','position',[250 210 100 20]);
    uH=uicontrol(pp,'style','text','String','m','position',[350 210 30 20],'backgroundcolor',cfondo);
    
    eeta_h=uicontrol(pp,'style','text','String','eta_h','position',[210 170 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta_h=uicontrol(pp,'style','edit','String','','position',[250 170 100 20]);
    ueta_h=uicontrol(pp,'style','text','String','','position',[350 170 30 20],'backgroundcolor',cfondo);
    
    eHrext=uicontrol(pp,'style','text','String','Hrext','position',[210 130 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dHrext=uicontrol(pp,'style','edit','String','','position',[250 130 100 20]);
    uHrext=uicontrol(pp,'style','text','String','m','position',[350 130 30 20],'backgroundcolor',cfondo);
else
    ePa=uicontrol(pp,'style','text','String','Pa','position',[210 210 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dPa=uicontrol(pp,'style','edit','String','','position',[250 210 100 20]);
    uPa=uicontrol(pp,'style','text','String','kW','position',[350 210 30 20],'backgroundcolor',cfondo);
    
    eeta=uicontrol(pp,'style','text','String','eta','position',[210 170 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta=uicontrol(pp,'style','edit','String','','position',[250 170 100 20]);
    ueta=uicontrol(pp,'style','text','String','','position',[350 170 30 20],'backgroundcolor',cfondo);
end

% Botón calcular
uicontrol(pp,'style','pushbutton','String','Calcular','position',[150 20 100 30],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');

%% Menú de botones

posb=250; % Posición de referencia 

uicontrol('style','pushbutton','String','','position',[0 posb 35 35],...
    'callback',@gohome,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/inicio.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-35 35 35],...
    'callback',{@gographics,subtipo},'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/grafica.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-2*35 35 35],...
    'callback',@goconv,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/unidades.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-3*35 35 35],...
    'callback',@gotablas,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/tabla.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-4*35 35 35],...
    'callback',@gocalc,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/calculadora.png'));

uicontrol('style','pushbutton','String','','position',[0 posb-5*35 35 35],...
    'callback',@goayuda,'fontsize',10,'fontweight','bold','backgroundcolor',[0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'));


    function calcular(~,~,subtipo)
        D2=str2double(get(dD2,'String'));
        b2=str2double(get(db2,'String'));
        beta2=str2double(get(dbeta2,'String'))*pi/180; %En radianes
        n=str2double(get(dn,'String'));
        if subtipo==1
            H=str2double(get(dH,'String'));
            eta_h=str2double(get(deta_h,'String'));
            Hrext=str2double(get(dHrext,'String'));
            
            u2=(pi*D2*n)/60;
            Hu=H/eta_h;
            c2u=(Hu*g)/u2;
            c2m=(u2-c2u)*tan(beta2);
            Q=pi*b2*D2*c2m;
            
            res1=horzcat('Q= ',num2str(Q*1000), '  l/s');
            res2=horzcat('(zZ - zA)= ',num2str(H-Hrext),' m');
            figresultados({res1,'',res2},2);
        elseif subtipo==2
            Pa=str2double(get(dPa,'String'))*10^3;   % En kW
            eta=str2double(get(deta,'String'));
            
            u2=(pi*D2*n)/60;
            a=-(pi*eta*b2*D2*tan(beta2)*rho*u2)/Pa;
            b=(pi*eta*b2*D2*tan(beta2)*rho*u2^2)/Pa;
            c=-1;
            c2u=sym('c2u');
            sol=solve(a*c2u^2+b*c2u+c,c2u);
            c2u=double(sol(1));
            c2m=(u2-c2u)*tan(beta2);
            Q=pi*b2*D2*c2m;
            
            if isreal([u2,c2u,c2m,Q])==0
                msgbox('Algunos resultados pueden contener partes complejas');
            end
            
            res1=horzcat('Q= ',num2str(Q*1000), '  l/s');
            res2=horzcat('P= ',num2str(Pa*eta/1000),' kW');
            res3=horzcat('c2m= ',num2str(c2m),' m/s');
            res4=horzcat('u2= ',num2str(u2),' m/s');
            res5=horzcat('c2u= ',num2str(c2u),' m/s');
            figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
        end
        
    end

    function gohome(~,~)
        close(gcf);
        run('App_Bombas.m');
    end

    function gographics(~,~,subtipo)
        if subtipo==1
            H=str2double(get(dH,'String'));
            eta_h=str2double(get(deta_h,'String'));
            D2=str2double(get(dD2,'String'));
            b2=str2double(get(db2,'String'));
            beta2=str2double(get(dbeta2,'String'))*pi/180;
            n=str2double(get(dn,'String'));
            Hrext=str2double(get(dHrext,'String'));
            
            %Procedimiento General ---------------------
            u2=(pi*D2*n)/60;
            Hu=H/eta_h;
            c2u=(Hu*g)/u2;
            c2m=(u2-c2u)*tan(beta2);
            Q=pi*b2*D2*c2m;
            
            % Selector gráficas ------------------------
            sgraph = questdlg('¿Qué desea graficar?', ...
                'Menú Gráficas Disponibles', ...
                'eta_h - Q','beta2 - Q','eta_h - Q');
            
            switch sgraph
                case 'eta_h - Q'
                    eta_h=insertRango('eta_h','0.5:0.1:1');
                    Hu=H./eta_h;
                    c2u=(Hu*g)/u2;
                    c2m=(u2-c2u)*tan(beta2);
                    Q=(pi*b2*D2*c2m);
                    grafica(eta_h*100,Q*1000,'\eta_h ( % )','Q ( l/s )','\eta_h vs Q');
                    
                case 'beta2 - Q'
                    beta2=insertRango('beta2 ( ° )','10:85');
                    beta2=beta2*pi/180;
                    c2m=(u2-c2u)*tan(beta2);
                    Q=(pi*b2*D2*c2m); % l/s
                    grafica(beta2*180/pi,Q*1000,'\beta_2 ( ° )','Q ( l/s )','\beta_2 vs Q');
            end
            
        elseif subtipo==2
            D2=str2double(get(dD2,'String'));
            b2=str2double(get(db2,'String'));
            beta2=str2double(get(dbeta2,'String'))*pi/180; %En radianes
            n=str2double(get(dn,'String'));
            Pa=str2double(get(dPa,'String'))*10^3;   % En kW
            eta=str2double(get(deta,'String'));
            
%             u2=(pi*D2*n)/60;
%             a=-(pi*eta*b2*D2*tan(beta2)*rho*u2)/Pa;
%             b=(pi*eta*b2*D2*tan(beta2)*rho*u2^2)/Pa;
%             c=-1;
%             c2u=sym('c2u');
%             sol=solve(a*c2u^2+b*c2u+c,c2u);
%             c2u=double(eval(sol(1)));
%             c2m=(u2-c2u)*tan(beta2);
%             Q=pi*b2*D2*c2m;
            
            sgraph = questdlg('¿Qué desea graficar?', ...
                'Menú Gráficas Disponibles', ...
                'eta - Q','beta2 - Q','eta - Q');
            
            switch sgraph
                case 'eta - Q'
                    eta=insertRango('eta','0.5:0.1:1');
                    u2=(pi*D2*n)/60;
                    a=-(pi*eta*b2*D2*tan(beta2)*rho*u2)/Pa;
                    b=(pi*eta*b2*D2*tan(beta2)*rho*u2^2)/Pa;
                    c=-1;
                    c2u=sym('c2u');
                    for i=1:length(eta)
                        sol=solve(a(i)*c2u^2+b(i)*c2u+c,c2u);
                        solm(i)=double(sol(1));
                    end
                    c2u=solm;
                    c2m=(u2-c2u)*tan(beta2);
                    Q=pi*b2*D2*c2m;
                    grafica(eta*100,Q*1000,'\eta ( % )','Q ( l/s )','\eta vs Q');
                    
                case 'beta2 - Q'
                    beta2=insertRango('beta2 ( ° )','1:85')*pi/180;
                    u2=(pi*D2*n)/60;
                    a=-(pi*eta*b2*D2*tan(beta2)*rho*u2)/Pa;
                    b=(pi*eta*b2*D2*tan(beta2)*rho*u2^2)/Pa;
                    c=-1;
                    c2u=sym('c2u');
                    for i=1:length(beta2)
                        sol=solve(a(i)*c2u^2+b(i)*c2u+c,c2u);
                        solm(i)=double(sol(1));
                    end
                    c2u=solm;
                    c2m=(u2-c2u).*tan(beta2);
                    Q=pi*b2*D2*c2m;
                    grafica(beta2*180/pi,Q*1000,'\beta_2 ( ° )','Q ( l/s )','\beta_2 vs Q');
            end
            
        else
            msgbox('Herramienta no disponible','MFITEC','custom',imread('data/imag/herramienta.png'));
        end
        
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
