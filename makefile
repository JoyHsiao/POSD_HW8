all: hw8 shell

hw8: mainException.o atom.o list.o struct.o scanner.h parser.h                                 
ifeq (${OS}, Windows_NT)                                                                   
	g++ -g3 -o hw8 mainException.o atom.o struct.o list.o -lgtest           
else                                                                                       
	g++ -g3 -o hw8 mainException.o atom.o struct.o list.o -lgtest -lpthread 
endif                                                                                      

shell: shell.o shell.h atom.o list.o struct.o scanner.h parser.h                                 
ifeq (${OS}, Windows_NT)                                                                   
	g++ -g3 -o shell shell.o atom.o list.o struct.o -lgtest -lpthread           
else                                                                                       
	g++ -g3 -o shell shell.o atom.o list.o struct.o -lgtest -lpthread -lpthread 
endif                                                                                      

atom.o: atom.cpp atom.h variable.h
	g++ -std=gnu++0x -c atom.cpp


list.o:list.cpp list.h
		g++ -std=gnu++0x -c list.cpp
struct.o:struct.cpp struct.h
		g++ -std=gnu++0x -c struct.cpp

mainException.o: mainException.cpp scanner.h atom.h struct.h variable.h parser.h exception.h expression.h
	g++ -std=gnu++0x -c mainException.cpp

shell.o: scanner.h atom.h struct.h variable.h parser.h exception.h expression.h
	g++ -std=gnu++0x -c shell.cpp

clean:
	rm -f *.o madRace utAtom utVariable utScanner utIterator hw8 shell
stat:
	wc *.h *.cpp
