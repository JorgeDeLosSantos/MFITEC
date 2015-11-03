# -*- coding: cp1252 -*-

def remplazar(archivo,lista,remplazo):
	fid=open(archivo,'r+')
	txt=fid.readlines()
	fid.seek(0)
	for line in txt:
		for r in lista:
			line=line.replace(r, remplazo)
		fid.write(line)
	fid.close()

if __name__=='__main__':
	archivo='b_4.m'
	lista="boton= regresar= graphs= convuni= tablasb= calcu= helping=".split()
	remplazar(archivo,lista,"")
	
