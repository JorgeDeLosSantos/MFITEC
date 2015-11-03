function barraMenuTA(f)
menu1 = uimenu(f,'Label','Herramientas');
uimenu(menu1,'Label','Conversor de unidades','callback','winopen(''data/mfun/convert.exe'')');
uimenu(menu1,'Label','Tablas','callback','winopen(''data/docs/Tablas.pdf'')');
uimenu(menu1,'Label','Diagrama de Moody','callback','winopen(''data/docs/Moody.pdf'')');
sub11=uimenu(menu1,'Label','Ecuaciones de turbomáquinas');
uimenu(sub11,'Label','Ecuaciones Bombas Centrífugas','callback','winopen(''data/docs/EC_BC.pdf'')');
uimenu(sub11,'Label','Ecuaciones Turbinas de reacción','callback','winopen(''data/docs/EC_TR.pdf'')');
uimenu(sub11,'Label','Ecuaciones Turbinas de acción','callback','winopen(''data/docs/EC_TA.pdf'')');
menu2=uimenu(f,'Label','Ayuda');
uimenu(menu2,'Label','Ayuda en PDF','callback','winopen(''data/docs/Ayuda.pdf'')');
uimenu(f,'Label','Acerca de...','callback','run(''data/mfun/acerca.m'')');
end