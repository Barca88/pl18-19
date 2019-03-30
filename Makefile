lol: 
	mkdir data
	mkdir data/estatisticas
	mkdir data/proverbios
	mkdir data/autores
	make program1
	make program2

program1: 
	flex proverbios.fl
	gcc -o program1 -g lex.yy.c

program2: 
	flex autores.fl
	gcc -o program2 -g lex.yy.c

clean:
	rm -f program1
	rm -f program2
	rm -f index.html
	rm -f lex.yy.c
	rm -rf data/

run: 
	./program1 ptwikiquote-20190301-pages-articles.xml index.html | ./program2 ptwikiquote-20190301-pages-articles.xml  
	
