COQMAKEFILE := coq_makefile
COQEXTRAFLAGS := COQEXTRAFLAGS = '-w all,-extraction,-disj-pattern-notation'

LF= Basics.v Induction.v Lists.v Poly.v

SFDIR = $(addprefix lf/, $(LF))
   
all:
	@echo $@
	$(COQMAKEFILE) -f _CoqProject $(SFDIR) $(COQEXTRAFLAGS)  -o CoqMakefile
	make -f CoqMakefile
	
clean :
	@echo $@
	make -f CoqMakefile clean
	find . -name "*\.vo" -exec rm {} \;
	find . -name "*\.vok" -exec rm {} \;
	find . -name "*\.vos" -exec rm {} \;
	find . -name "*\.glob" -exec rm {} \;
	find . -name "*\.aux" -exec rm {} \;
	find . -name "*\.cmi" -exec rm {} \;
	find . -name "*\.cmx" -exec rm {} \;
	find . -name "*\.crashcoqide" -exec rm {} \;

.PHONY: all clean
