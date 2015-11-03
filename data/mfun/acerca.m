function acerca
cfondo=[0 0.2 0];
fa=figure('MenuBar','None','NumberTitle','off',...
    'Name','Acerca de...','position',[100 100 200 100],...
    'color',cfondo,'resize','off');
centerfig(fa);

txt={'MFITEC','Por: Jorge De Los Santos','E-mail: delossantosmfq@gmail.com'};
tipotxt='Arial';
dimtxt=8;
colortxt='k';
estitxt='normal';

uicontrol('style','text','String',txt,'position',[5 5 190 90],...
    'fontsize',dimtxt,'fontname',tipotxt,'foregroundcolor',...
    colortxt,'fontweight',estitxt,'backgroundcolor',[0.91 0.95 0.91]);
end