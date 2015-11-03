function tr_6(subtipo)
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

eH=uicontrol(pp,'style','text','String','H','position',[10 220 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dH=uicontrol(pp,'style','edit','String','','position',[50 220 100 20]);
uH=uicontrol(pp,'style','text','String','m','position',[150 220 30 20],'backgroundcolor',cfondo);

eL=uicontrol(pp,'style','text','String','L','position',[10 180 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dL=uicontrol(pp,'style','edit','String','','position',[50 180 100 20]);
uL=uicontrol(pp,'style','text','String','m','position',[150 180 30 20],'backgroundcolor',cfondo);

edt=uicontrol(pp,'style','text','String','dt','position',[10 140 30 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
ddt=uicontrol(pp,'style','edit','String','','position',[50 140 100 20]);
udt=uicontrol(pp,'style','text','String','m','position',[150 140 30 20],'backgroundcolor',cfondo);

efr=uicontrol(pp,'style','text','String','fr','position',[10 100 35 20],'backgroundcolor',cfondo,...
    'fontsize',etsize,'fontweight','bold');
dfr=uicontrol(pp,'style','edit','String','','position',[50 100 100 20]);
ufr=uicontrol(pp,'style','text','String','','position',[150 100 30 20],'backgroundcolor',cfondo);



% 2da Col
if subtipo==2 | subtipo==3
    eHb=uicontrol(pp,'style','text','String','Hb','position',[210 220 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dHb=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
    uHb=uicontrol(pp,'style','text','String','m','position',[350 220 30 20],'backgroundcolor',cfondo);
elseif subtipo==1
    ezA=uicontrol(pp,'style','text','String','zA','position',[210 220 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzA=uicontrol(pp,'style','edit','String','','position',[250 220 100 20]);
    uzA=uicontrol(pp,'style','text','String','m','position',[350 220 30 20],'backgroundcolor',cfondo);
    
    ezZ=uicontrol(pp,'style','text','String','zZ','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    dzZ=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    uzZ=uicontrol(pp,'style','text','String','m','position',[350 180 30 20],'backgroundcolor',cfondo);
end

if subtipo==3
    eeta=uicontrol(pp,'style','text','String','eta','position',[210 180 35 20],'backgroundcolor',cfondo,...
        'fontsize',etsize,'fontweight','bold');
    deta=uicontrol(pp,'style','edit','String','','position',[250 180 100 20]);
    ueta=uicontrol(pp,'style','text','String','','position',[350 180 30 20],'backgroundcolor',cfondo);
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
            H=str2double(get(dH,'String'));
            L=str2double(get(dL,'String'));
            dt=str2double(get(ddt,'String'));
            fr=str2double(get(dfr,'String'));
            
            if subtipo==1
                zA=str2double(get(dzA,'String'));
                zZ=str2double(get(dzZ,'String'));
                
                Hb=zA-zZ;
                vt=sqrt(((2*g*dt)/(fr*L))*(Hb-H));
                Q=(pi*dt^2*vt)/4;
                P=Q*rho*g*H;
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2},2);
            elseif subtipo==2
                Hb=str2double(get(dHb,'String'));
               
                vt=sqrt(((2*g*dt)/(fr*L))*(Hb-H));
                Q=(pi*dt^2*vt)/4;
                P=Q*rho*g*H;
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('P= ',num2str(P/10^3),' kW');
                
                figresultados({res1,'',res2},2);
            elseif subtipo==3
                Hb=str2double(get(dHb,'String'));
                eta=str2double(get(deta,'String'));
                
                vt=sqrt(((2*g*dt)/(fr*L))*(Hb-H));
                Q=(pi*dt^2*vt)/4;
                Pa=Q*rho*g*H*eta;
                
                res1=horzcat('Q= ',num2str(Q*10^3),' l/s');
                res2=horzcat('Pa= ',num2str(Pa/10^3),' kW');
                
                figresultados({res1,'',res2},2);
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