OBJECT_DIRS = exit io mem std-io
OBJECTS = exit/exit.o io/io.o mem/mem.o std-io/std-io.o

all: libasm.o libasm.so

libasm.o: objects
	ld -r $(OBJECTS) -o libasm.o

libasm.so: objects
	ld -shared $(OBJECTS) -o libasm.so

objects:: $(OBJECT_DIRS)

$(OBJECT_DIRS):: clean
	as $@/$@.s -o $@/$@.o

clean:
	rm -f *.o *.so
	rm -f exit/*.o
	rm -f io/*.o
	rm -f mem/*.o
	rm -f std-io/*.o
