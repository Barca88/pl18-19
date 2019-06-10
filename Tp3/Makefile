YACC := RMvA.y
FLEX := RMvA.l
CONV := RMvA
GCC := y.tab.c



all:
	yacc -v -d $(YACC)
	flex $(FLEX)
	gcc -o $(CONV) $(GCC)

clean:
	