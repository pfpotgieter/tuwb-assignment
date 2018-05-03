# Makefile to create a README markdown file by Ferdie Potgieter (2018-05-03)

TITLESTR=Guessing Game Script - Assignment
DATESTR=$(shell date +"%Y-%m-%d at %H:%M:%S")
OUTFILE=README.md

# Default target
all: guessinggame.sh
	echo "# **$(TITLESTR)**\n" > $(OUTFILE)
	echo "**make** was run on $(DATESTR)." >> $(OUTFILE)
	echo "The script *$^* contains **$(shell eval "cat $^ | wc -l")** lines of code." >> $(OUTFILE)

# Cleanup 
clean: 
	rm --force $(OUTFILE)

# end of makefile
