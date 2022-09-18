OBJECTS = exit io mem std-io

all:: $(OBJECTS)

$(OBJECTS):: clean
	as $@/$@.s -o $@/$@.o

clean:
	rm -f exit/*.o
	rm -f io/*.o
	rm -f mem/*.o
	rm -f std-io/*.o
