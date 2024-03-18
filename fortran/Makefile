GF = gfortran
SRCS = $(shell ls *.f90)
TARGETS = $(SRCS:.f90=.o)

all: $(TARGETS)

clean:
	@rm -fv *.o

# this is just a placeholder to allow for autocompletion
$(TARGETS):

%.o: %.f90
	$(GF) $< -o $@
