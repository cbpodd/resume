OUT_DIR=build
IN_DIR=src
STYLES_DIR=styles
STYLE=styles
FILE=resume
AUTHOR="Cameron Podd"

all: html pdf remove_extra_files

pdf: dir $(IN_DIR)/$(FILE).md $(STYLES_DIR)/$(STYLE).tex
	pandoc --standalone $(IN_DIR)/$(FILE).md \
		--template $(STYLES_DIR)/$(STYLE).tex \
		-f markdown -t context \
		--variable papersize=A4 \
		-o $(OUT_DIR)/$(AUTHOR).tex
	mtxrun --path=$(OUT_DIR) --result=$(AUTHOR).pdf --script context $(AUTHOR).tex > $(OUT_DIR)/context_resume.log 2>&1
			
html: dir $(IN_DIR)/$(FILE).md $(STYLES_DIR)/$(STYLE).css
	pandoc --standalone $(IN_DIR)/$(FILE).md \
		--metadata pagetitle=$(AUTHOR) \
		--include-in-header $(STYLES_DIR)/$(STYLE).css \
		-o $(OUT_DIR)/$(AUTHOR).html

dir:
	mkdir -p $(OUT_DIR)

remove_extra_files:
	rm -f $(OUT_DIR)/*.log $(OUT_DIR)/*.tuc

clean:
	rm -f $(OUT_DIR)/*

.PHONY: html pdf dir clean
