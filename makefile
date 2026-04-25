TEX := $(wildcard */unidade-*/relatorio.tex)
PDF := $(TEX:.tex=.pdf)

.PHONY: all clean

all: $(PDF)

$(PDF): %.pdf: %.tex template.tex
	latexmk -pdf -cd $<
	cp $(dir $<)build/$(notdir $@) $(dir $<)

clean:
	for f in $(TEX); do \
		latexmk -C -cd $$f; \
	done
