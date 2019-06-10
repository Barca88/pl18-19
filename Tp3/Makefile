YACC := RMvA.y
FLEX := RMvA.l
CONV := RMvA
GCC := y.tab.c


all:
	yacc -v -d $(YACC)
	flex $(FLEX)
	gcc -o $(CONV) $(GCC)

run:
	./RMvA < rede_museu_virtual_do_artista.txt

clean:
	rm -f $(CONV)
	rm -f $(GCC)
	rm -f lex.yy.c
	rm -f y.output
	rm -f y.tab.h
	
