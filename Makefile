images = flash-ram-mm.png \
	 linker.png \
	 relocation.png \
	 sections.png \
	 stack.png \
	 csections.png

htmls = arm-iset.html \
	asm-directives.html \
	data-in-ram.html \
	index.html \
	using-ram.html \
	arm-lab.html \
	copyright.html \
	lds.html \
	arm-prog-model.html \
	hello-arm.html \
	linker.html \
	c-startup.html \
	exc-handle.html \
	contributing.html \
	credits.html \
	c-library.html \
	arm-stacks.html

all: $(htmls)

$(htmls): gnu-eprog.xml $(images)
	xsltproc docbook.xsl  $<
	-tidy --quiet -m $(htmls) 2> /dev/null

%.xml: %.txt
	asciidoc -b docbook  $<

%.png: %.dia
	dia --export=$@ --filter=png-libart $<

clean:
	rm -f *.html
	rm -f $(images)

distclean: clean
	find . -name "*~" -exec rm -f {} ";"
