JAVAC=/usr/bin/javac
.SUFFIXES: .java .class


SRCDIR=src/molecule
BINDIR=bin
DOCDIR=doc
JVM=java

SOURCES=$(shell find $(SRCDIR) -name '*.java' -type f)
CLASSES=$(SOURCES:$(SRCDIR)/%.java=$(BINDIR)/%.class) 

$(BINDIR)/%.class:$(SRCDIR)/%.java
	$(JAVAC) -d $(BINDIR)/ -cp $(SRCDIR) $<


Default: $(CLASSES)

clean:
	rm $(BINDIR)/*.class

temp:
	echo $(CLASSES)

runSmall:	
	$(JVM) -cp $(BINDIR) RunSimulation 12 3

runMedium:
	$(JVM) -cp $(BINDIR) RunSimulation 120 30

runLarge:
	$(JVM) -cp $(BINDIR) RunSimulation 1200 300

runOther:
	$(JVM) -cp $(BINDIR) RunSimulation 

docs:
	javadoc -d $(DOCDIR) $(SRCDIR)/*.java
