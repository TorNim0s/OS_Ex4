CC=g++
AR=ar
FLAGS= -Wall -g

all: client server test

client:  client.o
	$(CC) $(FLAGS) -o client client.o

server:  server.o
	$(CC) $(FLAGS) -pthread -o server server.o

test: test.o
	$(CC) $(FLAGS) -o test test.o

server.o: server.cpp ourMemory.h StackOverLinkedList.h
	$(CC) $(FLAGS) -pthread -c server.cpp

client.o: client.cpp
	$(CC) $(FLAGS) -c client.cpp

test.o: test.cpp
	$(CC) $(FLAGS) -c test.cpp

.PHONY: clean all
clean:
	rm -f *.o client server test