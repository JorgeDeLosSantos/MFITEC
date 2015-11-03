function b_9(subtipo)
% Bombas centrífugas (Tipo 9)
% 
% $ Ref. 1936 $
% $ Rev. 1.0 $ 14/11/13 $

%% Constantes persistentes --------------------------------------------
persistent g rho
g=9.81;
rho=struct2array(load('data/mfun/rho.mat'));

%% Características generales ------------------------------------------
cfondo=[0.5 0.8 0.9];
etsize=8;

%% Interfaz -----------------------------------------------------------
f = figure('Visible','on','MenuBar','none','resize','off','NumberTitle','off'...
    ,'Name','MFITEC-B','position',[500,300,300,300],'color',cfondo);
centerfig(f);

%% Menú Superior

barraMenuBC(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 200 270],'backgroundcolor',cfondo);

% 1ra Columna --------------------------------------------------------

eD2=uicontrol(pp,'style','text','String','D2','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD2=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uD2=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

ebeta2=uicontrol(pp,'style','text','String','beta2','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta2=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
ubeta2=uicontrol(pp,'style','text','String','°','position',[150 180 30 20],'backgroundcolor',cfondo);

ec2m=uicontrol(pp,'style','text','String','c2m','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc2m=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uc2m=uicontrol(pp,'style','text','String','m/s','position',[150 140 30 20],'backgroundcolor',cfondo);

if subtipo==1 | subtipo==2
    en=uicontrol(pp,'style','text','String','n','position',[10 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[150 100 30 20],'backgroundcolor',cfondo);
elseif subtipo==3 | subtipo==4
    eu2=uicontrol(pp,'style','text','String','u2','position',[10 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    du2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    uu2=uicontrol(pp,'style','text','String','m/s','position',[150 100 30 20],'backgroundcolor',cfondo);
end

if subtipo==2 | subtipo==4
    eeta_h=uicontrol(pp,'style','text','String','eta_h','position',[10 60 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta_h=uicontrol(pp,'style','edit','String','','position',[50 60 100 20]);
    ueta_h=uicontrol(pp,'style','text','String','','position',[150 60 30 20],'backgroundcolor',cfondo);
end
% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[60 10 80 25],...
    'callback',{@calcular,subtipo},'fontsize',10,'fontweight','bold');


%% Menú Botones
posb=250;

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


%% Funciones  --------------------------------------------------------
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            D2=str2double(get(dD2,'String'));
            beta2=str2double(get(dbeta2,'String'))*pi/180;
            c2m=str2double(get(dc2m,'String'));
            
            if subtipo==1
                n=str2double(get(dn,'String'));
                
                u2=(pi*D2*n)/60;
                c2u=u2-c2m/tan(beta2);
                alpha2=atan(c2m/c2u);
                w2=c2m/sin(beta2);
                Hu=(u2*c2u)/g;
                c2=sqrt(c2u^2+c2m^2);
                
                res1=horzcat('Hu= ',num2str(Hu),' m');
                res2=horzcat('u2= ',num2str(u2),' m/s');
                res3=horzcat('c2= ',num2str(c2),' m/s');
                res4=horzcat('c2u= ',num2str(c2u),' m/s');
                res5=horzcat('alpha2= ',num2str(alpha2*180/pi),' °');
                res6=horzcat('w2= ',num2str(w2),' m/s');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},6);
                
            elseif subtipo==2
                n=str2double(get(dn,'String'));
                eta_h=str2double(get(deta_h,'String'));
                
                u2=(pi*D2*n)/60;
                c2u=u2-c2m/tan(beta2);
                alpha2=atan(c2m/c2u);
                w2=c2m/sin(beta2);
                Hu=(u2*c2u)/g;
                H=eta_h*Hu;
                c2=sqrt(c2u^2+c2m^2);
                
                res1=horzcat('Hu= ',num2str(Hu),' m');
                res2=horzcat('u2= ',num2str(u2),' m/s');
                res3=horzcat('c2= ',num2str(c2),' m/s');
                res4=horzcat('c2u= ',num2str(c2u),' m/s');
                res5=horzcat('alpha2= ',num2str(alpha2*180/pi),' °');
                res6=horzcat('w2= ',num2str(w2),' m/s');
                res7=horzcat('H= ',num2str(H),' m');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6,'',res7},7);
                
            elseif subtipo==3
                u2=str2double(get(du2,'String'));
                
                n=(60*u2)/(pi*D2);
                c2u=u2-c2m/tan(beta2);
                alpha2=atan(c2m/c2u);
                w2=c2m/sin(beta2);
                Hu=(u2*c2u)/g;
                c2=sqrt(c2u^2+c2m^2);
                
                res1=horzcat('Hu= ',num2str(Hu),' m');
                res2=horzcat('n= ',num2str(n),' rpm');
                res3=horzcat('c2= ',num2str(c2),' m/s');
                res4=horzcat('c2u= ',num2str(c2u),' m/s');
                res5=horzcat('alpha2= ',num2str(alpha2*180/pi),' °');
                res6=horzcat('w2= ',num2str(w2),' m/s');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6},6);
                
            elseif subtipo==4
                u2=str2double(get(du2,'String'));
                eta_h=str2double(get(deta_h,'String'));
                
                n=(60*u2)/(pi*D2);
                c2u=u2-c2m/tan(beta2);
                alpha2=atan(c2m/c2u);
                w2=c2m/sin(beta2);
                Hu=(u2*c2u)/g;
                H=eta_h*Hu;
                c2=sqrt(c2u^2+c2m^2);
                
                res1=horzcat('Hu= ',num2str(Hu),' m');
                res2=horzcat('n= ',num2str(n),' rpm');
                res3=horzcat('c2= ',num2str(c2),' m/s');
                res4=horzcat('c2u= ',num2str(c2u),' m/s');
                res5=horzcat('alpha2= ',num2str(alpha2*180/pi),' °');
                res6=horzcat('w2= ',num2str(w2),' m/s');
                res7=horzcat('H= ',num2str(H),' m');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5,'',res6,'',res7},8);
            end
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