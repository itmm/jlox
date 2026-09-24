.PHONY: all clean

sources := ${wildcard src/de/knp/jlox/*.java}
classes := ${sources:src/%.java=obj/%.class}

all: ${classes}
	java -cp obj de.knp.jlox.JLox

obj/%.class: src/%.java
	javac -d obj $^

clean:
	rm -Rf obj/*
