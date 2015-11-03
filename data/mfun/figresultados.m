function figresultados(resultados,nl)
% Muestra los resultados, que han de ser pasados como argumentos de entrada
% en un cell array con sus unidades y magnitudes correspondientes.
% Argumentos de entrada:
%           resultados  -   Cell array de resultados.
%           nl          -   Número de líneas, cuasi equivalente al número
%                           de resultados. Establece la dimensión de la
%                           interfaz acorde a la cantidad de datos de
%                           salida.
% Ejemplo:
%          >> r1=horzcat('Q = ','10',' l/s');
%          >> r2=horzcat('P = ','2.5',' kW');
%          >> figresultados({r1,'',r2},2);
%
% $ Por: Jorge De Los Santos $
% $ Rev. 1.0 $ 11/10/13 $

cfondo=[1 1 1]; % Color de fondo de la interfaz
f = figure('Visible','on','MenuBar','none',...
    'resize','off','NumberTitle','off'...
    ,'Name','MFITEC - Resultados',...
    'position',[100,100,200,75+nl*25],'color',cfondo);
centerfig(f);

uicontrol('style','text','String','DATOS DE SALIDA',...
    'position',[10 75+(nl*25)-25 180 20],...
    'fontweight','bold','fontsize',9,...
    'foregroundcolor',[0 0.5 0],'backgroundcolor',cfondo);

uicontrol('style','text','String',resultados,...
    'position',[10 10 180 25+nl*25],...
    'fontsize',10,'fontweight','normal',...
    'HorizontalAlignment','left','fontname','Cambria',...
    'backgroundcolor',cfondo);

end