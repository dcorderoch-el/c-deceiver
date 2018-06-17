all: cpp_main c_main c_main_slib c_main_dlib
	
obj/c_main.o : c/c_main.c
	gcc -c c/c_main.c -o obj/c_main.o

obj/wrapper.o : cpp/wrapper.cpp
	g++ -c cpp/wrapper.cpp -o obj/wrapper.o

obj/cpp_main.o : cpp/cpp_main.cpp
	g++ -c cpp/cpp_main.cpp -o obj/cpp_main.o

obj/lib.o : cpp/lib.cpp
	g++ -c cpp/lib.cpp -o obj/lib.o

cpp_main : obj/cpp_main.o
	g++ obj/cpp_main.o -o cpp_main

c_main : obj/c_main.o obj/wrapper.o obj/lib.o
	g++ -o c_main obj/c_main.o obj/wrapper.o obj/lib.o

libslib.a : obj/lib.o
	ar rcs libslib.a obj/lib.o

libdlib.so : obj/lib.o
	g++ -shared -o libdlib.so obj/lib.o

c_main_slib : libslib.a
	g++ -o c_main_slib obj/c_main.o obj/wrapper.o -L. -lslib

c_main_dlib : libdlib.so
	g++ -o c_main_dlib obj/c_main.o obj/wrapper.o -L. -ldlib

clean : 
	rm -f obj/c_main.o obj/cpp_main.o obj/lib.o obj/wrapper.o c_main cpp_main c_main_slib c_main_dlib libslib.a libdlib.so

.PHONY: clean
