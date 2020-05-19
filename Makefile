CC=pdflatex
RESUME=resume.tex
STYLE=resume.cls
OUTPUT=resume.pdf

all: open

$(OUTPUT): $(RESUME) $(STYLE)
	$(CC) $(RESUME) -o $(OUTPUT)
	
open: $(OUTPUT)
	open $(OUTPUT)

clean:
	rm *.pdf *.aux *.log *.out

.PHONY: all open clean
