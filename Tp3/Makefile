YACC := RMvA.y
FLEX := RMvA.l
CONV := RMvA
GCC := y.tab.c


all:
	mkdir HTML
	yacc -v -d $(YACC)
	flex $(FLEX)
	gcc -o $(CONV) $(GCC)

run:
	./RMvA < rede_museu_virtual_do_artista.txt > file.dot
	dot -Tsvg file.dot -o index.svg

clean:
	rm -f file.dot
	rm -f index.svg
	rm -rf HTML/
	rm -f $(CONV)
	rm -f $(GCC)
	rm -f lex.yy.c
	rm -f y.output
	rm -f y.tab.h
	
power: 
	make clean
	make all
	make run