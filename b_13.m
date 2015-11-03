function b_13(subtipo)
% Bombas centrífugas (Tipo 13)
% $ Ref. 0 $
% $ Rev. 1.0 $ 23/11/13 $

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

eD1=uicontrol(pp,'style','text','String','D1','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dD1=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uD1=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

ebeta1=uicontrol(pp,'style','text','String','beta1','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dbeta1=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
ubeta1=uicontrol(pp,'style','text','String','°','position',[150 180 30 20],'backgroundcolor',cfondo);

ec1m=uicontrol(pp,'style','text','String','c1m','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc1m=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uc1m=uicontrol(pp,'style','text','String','m/s','position',[150 140 30 20],'backgroundcolor',cfondo);

if subtipo==1
    en=uicontrol(pp,'style','text','String','n','position',[10 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dn=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    un=uicontrol(pp,'style','text','String','rpm','position',[150 100 30 20],'backgroundcolor',cfondo);
elseif subtipo==2
    eu1=uicontrol(pp,'style','text','String','u1','position',[10 100 30 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    du1=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    uu1=uicontrol(pp,'style','text','String','m/s','position',[150 100 30 20],'backgroundcolor',cfondo);
end


% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[60 10 80 25],...
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


%% Funciones  --------------------------------------------------------
    function calcular(~,~,subtipo)
        MV=get(findobj('style','edit'),'String');
        if any(strcmp(MV,'')==1)
            warndlg({'Algunos datos no han sido proporcionados',...
                'Por favor verfique...'},'DATOS INCOMPLETOS');
        else
            D1=str2double(get(dD1,'String'));
            beta1=str2double(get(dbeta1,'String'))*pi/180;
            c1m=str2double(get(dc1m,'String'));
            
            if subtipo==1
                n=str2double(get(dn,'String'));
                
                u1=(pi*D1*n)/60;
                c1u=u1-(c1m/tan(beta1));
                alpha1=atan(c1m/c1u);
                w1=c1m/sin(beta1);
                c1=sqrt(c1u^2+c1m^2);
                
                res1=horzcat('u1= ',num2str(u1),' m/s');
                res2=horzcat('c1u= ',num2str(c1u),' m/s');
                res3=horzcat('alpha1= ',num2str(alpha1*180/pi),' °');
                res4=horzcat('w1= ',num2str(w1),' m/s');
                res5=horzcat('c1= ',num2str(c1),' m/s');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
                
            elseif subtipo==2
                u1=str2double(get(du1,'String'));
                
                n=(60*u1)/(pi*D1);
                c1u=u1-(c1m/tan(beta1));
                alpha1=atan(c1m/c1u);
                w1=c1m/sin(beta1);
                c1=sqrt(c1u^2+c1m^2);
                
                res1=horzcat('n= ',num2str(n),' rpm');
                res2=horzcat('c1u= ',num2str(c1u),' m/s');
                res3=horzcat('alpha1= ',num2str(alpha1*180/pi),' °');
                res4=horzcat('w1= ',num2str(w1),' m/s');
                res5=horzcat('c1= ',num2str(c1),' m/s');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
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

    function gographics(~,~,subtipo)
        if subtipo==1
            D1=str2double(get(dD1,'String'));
            beta1=[pi/12:pi/180:pi/2];
            c1m=str2double(get(dc1m,'String'));
            n=str2double(get(dn,'String'));
  
            u1=(pi*D1*n)/60;
            c1u=u1-(c1m./tan(beta1));
            alpha1=atan(c1m./c1u);
            w1=c1m./sin(beta1);
            c1=sqrt(c1u.^2+c1m^2);
            grafica(beta1*180/pi,alpha1*180/pi,'beta1','alpha1','beta1 vs alpha1');
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