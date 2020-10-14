all: clean
	$(MAKE) spanish
	$(MAKE) english
	pdftoppm cv-en.pdf cv -png -rx 300 -ry 300
	
spanish: clean
	pdflatex cv.tex
	pdflatex cv.tex
	mv cv.pdf cv-light.pdf
	pdflatex cv.tex
	mv cv.pdf cv-full-es.pdf
	mv cv-light.pdf cv-es.pdf
	$(MAKE) clean

english: clean
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	mv cv.pdf cv-light.pdf
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	mv cv.pdf cv-full-en.pdf
	mv cv-light.pdf cv-en.pdf
	$(MAKE) clean

clean:
	rm -rf *.aux *.log *.out *.fls *.fdb_latexmk

cleanclean: clean
	rm -rf *.pdf
