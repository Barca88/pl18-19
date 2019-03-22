program1: proverbios.fl
		 flex proverbios.fl
		 cc -o program lex.yy.c

program2: autores.fl
		 flex autores.fl
		 cc -o program lex.yy.c

clean:
	rm program
	rm index.html
	rm lex.yy.c
	rm data/*.html
	rm data/autores/*.html
	rm data/proverbios/*.html

run: 
	./program ptwikiquote-20190301-pages-articles.xml index.html 