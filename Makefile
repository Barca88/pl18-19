proverbios: proverbios.fl
	flex proverbios.fl
	cc -o proverbios lex.yy.c

clean:
	rm proverbios
	rm -f data/*.html
	rm lex.yy.c
	rm data/*.html
	rm data/autores/*.html

run: 
	./proverbios ptwikiquote-20190301-pages-articles.xml

power:
	make clean; make proverbios; make run