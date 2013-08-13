#include thread.mk
#include mutex.mk
#include alloc.mk
#include fork.mk
include file.mk

CC      = gcc
CFLAGS += -I.

# Lorsqu'on fait `make`, c'est la première règle qui est exécutée
# donc dans ce cas-ci, c'est sa dependance.
default: show

# $@ c'est la règle, ici le nom de l'objet comme `benchmark.o`
# $< c'est $< c'est le premier élément de la liste des dépendances, ici
#    c'est la source comme `benchmark.c`
%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(PROG): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

$(GRAPHS): $(PROG)
	./$(PROG)

show: $(GRAPHS)
	gnuplot -p $(PROG).gnuplot

.PHONY: run show clean default

clean:
	$(RM) $(PROG) $(GRAPHS) $(OBJ) $(TMP)
