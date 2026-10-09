.PHONY: all clean

sources := ${wildcard src/de/knp/jlox/*.java}
classes := ${sources:src/%.java=obj/%.class}

all: ${classes}
	echo "var language = \"lox\";" | java -cp obj de.knp.jlox.JLox

obj/%.class: src/%.java
	javac -d obj -cp obj $<

clean:
	rm -Rf obj/*

obj/de/knp/jlox/Token.class: obj/de/knp/jlox/TokenType.class
obj/de/knp/jlox/Scanner.class: obj/de/knp/jlox/TokenType.class \
	obj/de/knp/jlox/Token.class \
	obj/de/knp/jlox/Error.class
obj/de/knp/jlox/JLox.class: obj/de/knp/jlox/Scanner.class \
	obj/de/knp/jlox/Token.class \
	obj/de/knp/jlox/Error.class

