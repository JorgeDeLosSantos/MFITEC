function App_TA
% App_TA
% 
% 
% Versión: 0.1.1   (03/01/2014)
% Copyright (c) 2014   Jorge De Los Santos <delossantosmfq@gmail.com>
% Licencia: BSD License

App = figure('MenuBar','None','NumberTitle','off',...
    'Name','Turbinas de reacción','Resize','off',...
    'Position',[0 0 650 280],'Color','w');
centerfig();

label=load('VARS_TA.mat');
label.VARS_TA=flipud(label.VARS_TA);

p=uipanel(App,'units','pixels',...
    'Position',[70 10 570 260],...
    'BackgroundColor','w',...
    'Title','Datos disponibles');

k=1;
for i=1:8
    for j=1:5
        uicontrol(p,'style','checkbox','String',label.VARS_TA{k},...
            'pos',[i*70-60 (6-j)*40 65 40],'Background','w');
        k=k+1;
    end
end

INIT_POS=230;
uicontrol(App,'style','push',...
    'String','',...
    'Position',[0 INIT_POS 35 35],...
    'CData',imread('inicio.png'),...
    'BackgroundColor','k',...
    'Callback',@regresar);

uicontrol(App,'style','push',...
    'String','',...
    'Position',[0 INIT_POS-35 35 35],...
    'CData',imread('ayuda.png'),...
    'BackgroundColor','k',...
    'Callback',@ayuda);

uicontrol(App,'style','push',...
    'String','',...
    'Position',[0 INIT_POS-2*35 35 35],...
    'CData',imread('listo.png'),...
    'BackgroundColor',ones(1,3)*0.8,...
    'Callback',@verificar);

crearMenu();

    function crearMenu
        menu_herramientas=uimenu(App,'Label','Herramientas');
        uimenu(menu_herramientas,'Label','Conversor de unidades');
        uimenu(menu_herramientas,'Label','Tablas');
        uimenu(menu_herramientas,'Label','Diagrama de Moody');
        uimenu(menu_herramientas,'Label','Configurar densidad');
        
        menu_ayuda=uimenu(App,'Label','Ayuda');
        uimenu(menu_ayuda,'Label','Ayuda');
        uimenu(menu_ayuda,'Label','Acerca de...');
        
    end

    function verificar(~,~)
        
    end

    function ayuda(~,~)
        
    end

    function regresar(~,~)
        close(gcf);
    end
end