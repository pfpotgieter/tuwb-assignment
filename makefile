# Makefile to create a README markdown file by Ferdie Potgieter (2018-05-03)

TITLESTR=Guessing Game Script - Assignment
DATESTR=$(shell date +"%Y-%m-%d at %H:%M:%S")
OUTFILE=README.md

# Default target
all: guessinggame.sh
	echo "# $(TITLESTR)\n" > $(OUTFILE)
	echo "1. **make** was run on $(DATESTR).\n" >> $(OUTFILE)
	echo "2. The script *$^* contains **$(shell eval "cat $^ | wc -l")** lines of code.\n" >> $(OUTFILE)

# Cleanup 
clean: 
	rm --force $(OUTFILE)

# end of makefile
