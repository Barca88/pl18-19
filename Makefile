proverbios: proverbios.fl
	flex proverbios.fl
	cc -o proverbios lex.yy.c

clean:
	rm proverbios
	rm index.html
	rm lex.yy.c
