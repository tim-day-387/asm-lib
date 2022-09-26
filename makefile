OBJECT_DIRS = exit io mem std-io sys
OBJECTS = exit/exit.o io/io.o mem/mem.o std-io/std-io.o sys/sys.o

all: test libasm.o libasm.so

test: test.o libasm.o
	ld test.o libasm.o -o test

test.o: test.c
	cc -S test.c
	as test.s -o test.o

libasm.o: objects
	ld -r $(OBJECTS) -o libasm.o

libasm.so: objects
	ld -shared $(OBJECTS) -o libasm.so

objects:: $(OBJECT_DIRS)

$(OBJECT_DIRS)::
	as $@/$@.s -o $@/$@.o

clean:
	rm test test.o test.s
	rm *.o *.so
	rm exit/*.o
	rm io/*.o
	rm mem/*.o
	rm std-io/*.o
	rm sys/*.o
