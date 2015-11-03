function ta_3(subtipo)
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
    ,'Name','MFITEC-TA','position',[500,300,300,300],'color',cfondo);
centerfig(f);

%% Menú
barraMenuTA(f);

%% Datos de entrada y boton calcular

pp=uipanel(f,'title','DATOS','units','pixels','position',[70 20 200 270],'backgroundcolor',cfondo);

% 1ra col  --------------------------------------------------------

ec1=uicontrol(pp,'style','text','String','c1','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dc1=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uc1=uicontrol(pp,'style','text','String','m/s','position',[150 220 30 20],'backgroundcolor',cfondo);

eKu=uicontrol(pp,'style','text','String','Ku','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dKu=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uKu=uicontrol(pp,'style','text','String','','position',[150 180 30 20],'backgroundcolor',cfondo);

eQ=uicontrol(pp,'style','text','String','Q','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dQ=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
uQ=uicontrol(pp,'style','text','String','m^3/s','position',[150 140 30 20],'backgroundcolor',cfondo);

if subtipo==1
    ebeta2=uicontrol(pp,'style','text','String','beta2','position',[10 100 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dbeta2=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
    ubeta2=uicontrol(pp,'style','text','String','°','position',[150 100 30 20],'backgroundcolor',cfondo);
end

% Calcular PB
boton=uicontrol(pp,'style','pushbutton','String','Calcular','position',[60 20 80 25],...
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
            c1=str2double(get(dc1,'String'));
            Ku=str2double(get(dKu,'String'));
            Q=str2double(get(dQ,'String'));
            
            if subtipo==1
                beta2=str2double(get(dbeta2,'String'))*pi/180;
                
                H=c1^2/(2*g);
                u=Ku*sqrt(2*g*H);
                Pa=Q*rho*g*H;
                d=sqrt((4*Q)/(pi*c1));
                w1=c1-u;
                w2=w1;
                w1u=w1;
                w2u=-w2*cos(beta2);
                c1u=c1;
                c2u=u-w2*cos(beta2);
                F=Q*rho*(w1u-w2u);
                
                res1=horzcat('H= ',num2str(H),' m');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res3=horzcat('d= ',num2str(d),' m');
                res4=horzcat('u= ',num2str(u),' m/s');
                res5=horzcat('F= ',num2str(F),' N');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
                
            elseif subtipo==2
                H=c1^2/(2*g);
                u=Ku*sqrt(2*g*H);
                Pa=Q*rho*g*H;
                d=sqrt((4*Q)/(pi*c1));
                w1=c1-u;
                w2=w1;
                
                res1=horzcat('H= ',num2str(H),' m');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                res3=horzcat('d= ',num2str(d),' m');
                res4=horzcat('u= ',num2str(u),' m/s');
                res5=horzcat('w1= ',num2str(w1),' m/s');
                
                figresultados({res1,'',res2,'',res3,'',res4,'',res5},5);
                
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
        c1=insertRango('c1 (m/s)','1:100');
        Ku=str2double(get(dKu,'String'));
        Q=str2double(get(dQ,'String'));
        
        if subtipo==1
            beta2=str2double(get(dbeta2,'String'))*pi/180;
            
            H=c1.^2/(2*g);
            u=Ku*sqrt(2*g*H);
            Pa=Q*rho*g*H;
            grafica(c1,Pa/10^3,'c_1 ( m/s )','Pa ( kW )','c_1 vs P_a');
            
        elseif subtipo==2
            H=c1.^2/(2*g);
            u=Ku*sqrt(2*g*H);
            Pa=Q*rho*g*H;
            grafica(c1,Pa/10^3,'c_1 ( m/s )','Pa ( kW )','c_1 vs P_a');
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