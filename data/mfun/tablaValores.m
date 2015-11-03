function tablaValores(A,B,labx,laby)
% Muestra una tabla de valores obtenida de los vectores A y B
% Los encabezados de la tabla son "labx" y "laby".
%
% $ Por: Jorge De Los Santos $
% $ Rev. 1.1 $ 15/12/13 $

cfondo=[0.92,0.93,0.92];
fig=figure('NumberTitle','off','Name','MFITEC-Datos',...
    'MenuBar','none','position',[100,100,200,400],...
    'color',cfondo,'resize','off');
centerfig(fig);

datos=[A',B'];
cNombres={labx,laby};
cAncho={80,80};
matcolor=[1 1 1;0.8 0.8 1];

uitable('Parent',fig,'Data',datos,'ColumnName',cNombres,...
    'Position',[10 50 180 310],'ColumnWidth',cAncho,...
    'RowName','','fontweight','bold','RowStriping','on',...
    'Backgroundcolor',matcolor);

uicontrol('style','text','String','Tabla de datos',...
    'position',[10 375 180 20],'fontsize',9,'fontweight','bold',...
    'foregroundcolor',[0 0.6 0],'backgroundcolor',cfondo);

uicontrol('style','pushbutton','string','Exportar datos',...
    'position',[40 10 120 25],'callback',{@exportdat,datos},...
    'FontWeight','bold','FontSize',9);

    function exportdat(~,~,datos)
        [filename, pathname] = uiputfile('*.txt','Exportar datos...');
        if isequal(filename,0) || isequal(pathname,0)
            return;
        else
            dlmwrite(fullfile(pathname,filename),datos,'delimiter','\t',...
                'newline','pc');
        end
    end
end