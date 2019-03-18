proverbios: proverbios.fl
	flex proverbios.fl
	cc -o proverbios lex.yy.c

clean:
	rm proverbios
	rm -f data/*.html
	rm lex.yy.c

run: 
	./proverbios ptwikiquote-20190301-pages-articles.xml index.html

power:
	make clean && make proverbios && make run