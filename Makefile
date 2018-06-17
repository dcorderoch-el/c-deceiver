all: cpp_main c_main c_main_slib c_main_dlib c_main_lib_onlib c_main_lib_onlib_clang
	

cpp_main : obj/cpp_main.o
	g++ obj/cpp_main.o -o cpp_main

c_main : obj/c_main.o obj/wrapper.o obj/lib.o
	g++ -o c_main obj/c_main.o obj/wrapper.o obj/lib.o

c_main_slib : obj/c_main.o obj/wrapper.o libslib.a
	g++ -o c_main_slib obj/c_main.o obj/wrapper.o -L. -lslib

c_main_dlib : obj/c_main.o obj/wrapper.o libdlib.so
	g++ -o c_main_dlib obj/c_main.o obj/wrapper.o -L. -ldlib

c_main_lib_onlib : obj/c_main_lib_onlib.o obj/wrapper.o libslib.a libonlib.a
	g++ -o c_main_lib_onlib obj/wrapper.o obj/c_main_lib_onlib.o -L. -lslib -lonlib # the order is important

c_main_lib_onlib_clang : obj/wrapper.o obj/c_main_lib_onlib.o libonlib.a libslib.a
	clang++ -o c_main_lib_onlib_clang obj/wrapper.o obj/c_main_lib_onlib.o -L. -lslib -lonlib # the order is important

obj/c_main.o : c/c_main.c
	gcc -c c/c_main.c -o obj/c_main.o

obj/wrapper.o : cpp/wrapper.cpp
	g++ -c cpp/wrapper.cpp -o obj/wrapper.o

obj/cpp_main.o : cpp/cpp_main.cpp
	g++ -c cpp/cpp_main.cpp -o obj/cpp_main.o

obj/lib.o : cpp/lib.cpp
	g++ -c cpp/lib.cpp -o obj/lib.o

obj/c_main_lib_onlib.o : c/c_main_lib_onlib.c
	gcc -c c/c_main_lib_onlib.c -o obj/c_main_lib_onlib.o

obj/libonlib.o : c/libonlib.c
	gcc -c c/libonlib.c -o obj/libonlib.o

libslib.a : obj/lib.o
	ar rcs libslib.a obj/lib.o

libdlib.so : obj/lib.o
	g++ -shared -o libdlib.so obj/lib.o

libonlib.a : obj/libonlib.o
	ar rcs libonlib.a obj/libonlib.o

clean : 
	rm -f obj/*.o *.a *.so c_main cpp_main c_main_slib c_main_dlib c_main_lib_onlib c_main_lib_onlib_clang

.PHONY: clean
