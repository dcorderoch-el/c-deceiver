all: c_main cpp_main
	
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

clean : 
	rm -f obj/c_main.o obj/cpp_main.o obj/lib.o obj/wrapper.o c_main cpp_main

.PHONY: clean
