function Inicio
% Interfaz de inicio de MFITEC
% - No se requieren argumentos de entrada
% - Valores de retorno nulos
%
% $ (c) Jorge De Los Santos $
% $ Rev. 0.1  $ $ 13/10/2014 $                                                

%% Condiciones de inicio del programa
rho=1000; % Establecer valor de la densidad en 1000 kg/m^3
save('data/mfun/rho.mat','rho');
clearvars('rho');

%% Desarrollo de la interfaz
f = figure('Visible','on','MenuBar','none',...
    'resize','off','NumberTitle','off',...
    'Name','MFITEC','position',[500,300,300,200],...
    'color',[0.8 0.8 0.9]);

% Icono de la aplicaci�n
warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
jframe=get(f,'javaframe');
jIcon=javax.swing.ImageIcon('data/imag/triangulo.png');
jframe.setFigureIcon(jIcon);

% Imagen de fondo
ax=axes('Parent',f,'units','normalized','position',[0 0 1 1]);
imshow(imread('data/imag/imagen.png'),'parent',ax);

% Etiqueta de texto (Para continuar seleccione una opci�n)
uicontrol('style','text','String','Para continuar seleccione una opci�n',...
    'position',[30 120 240 20],'fontsize',9,'fontweight','bold',...
    'backgroundcolor',[0.82 0.82 0.82]);

% Men� desplegable (Selecci�n de tipo de problema)
sel=uicontrol('style','popupmenu','String',{'Bombas Centr�fugas',...
    'Turbinas de Reacci�n','Turbinas de Acci�n'},...
    'position',[70 70 160 30]);

% Bot�n "Continuar" (Verifica la opci�n seleccionada y abre la interfaz
% correspondiente )
uicontrol('style','pushbutton','String','Continuar >>','position',...
    [100 30 100 30],'fontsize',10,...
    'callback',@opcion,'fontweight','bold',...
    'tooltipstring','Continuar a la interfaz de c�lculos',...
    'FontName','Arial');

% Bot�n de ayuda (Abre la ayuda en formato PDF adjunta al programa)
dimBot=35;
posx=(300/2)-dimBot/2;
posy=200-dimBot;
uicontrol('style','pushbutton','String','','position',[posx posy dimBot dimBot],...
    'callback','','fontsize',10,'fontweight','bold','backgroundcolor',...
    [0.7 0.8 0.8],'cdata',imread('data/imag/ayuda.png'),...
    'tooltipstring','Ayuda','callback',@goayuda);

% Agrega al path de MATLAB las funciones del directorio data/mfun.
% El directorio data/mfun contiene todas las funciones auxiliares
% requeridas para el funcionamiento del programa.
path(path,'data/mfun'); 

%% Funciones
    function opcion(~,~)
        % Abre la interfaz correspondiente al valor obtenido del
        % men� desplegable, cuando se pulsa el bot�n "Continuar".
        n=get(sel,'Value');
        switch n
            case 1
                close(gcf);
                run('App_Bombas.m'); % Bombas centr�fugas
            case 2
                close(gcf);
                run('App_Turbinas_R.m'); % Turbinas de reacci�n
            case 3
                close(gcf);
                run('App_Turbinas_A.m'); % Turbinas de acci�n
        end
    end

    function goayuda(~,~)
        % Abre la ayuda guardada en el directorio indicado
        try
            winopen('data/docs/Ayuda.pdf');
        catch err
            warndlg('Archivo no encontrado','MFITEC');
            disp(err);
        end
    end
end
