function us_def_gui
vars = {'A','B','C','D','E'};
units = {'mm','km','kg','F','km/s'};
hF = figure('MenuBar','None',...
    'NumberTitle','off',...
    'Name','Hi!!!',...
    'Position',[0 0 400 300]);
centerfig();

main_panel = uipanel(hF,'Position',[0.1 0.1 0.87 0.87]);
NF = 2;
NC = 3;
hsubs = zeros(NF,NC);
for ii=1:NF
    for jj=1:NC
        hsubs(ii,jj) = uipanel(main_panel,'Units','Normalized',...
            'Position',[(ii-1)*1/NF (jj-1)*1/NC 1/NF 1/NC],...
            'Title',[num2str(ii),num2str(jj)]);
        uicontrol(hsubs(ii,jj),'String','JL1',...
            'Units','Normalized',...
            'Position',[0 0 1 1]);
    end
end
end