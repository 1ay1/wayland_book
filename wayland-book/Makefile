# Makefile for Wayland Book
# Builds PDF, EPUB, and Kindle-compatible PDF formats

.PHONY: all pdf epub mobi clean distclean help

# Main target
all: pdf

# Individual targets
pdf: main.pdf

epub: wayland-book.epub

mobi: wayland-book.mobi

# PDF generation with full bibliography
main.pdf: main.tex frontmatter/*.tex chapters/*/*.tex backmatter/*.tex backmatter/references.bib
	@echo "Building PDF with bibliography..."
	pdflatex -interaction=nonstopmode main.tex
	biber main
	pdflatex -interaction=nonstopmode main.tex
	pdflatex -interaction=nonstopmode main.tex
	makeindex main.idx
	pdflatex -interaction=nonstopmode main.tex
	@echo "PDF build complete: main.pdf"

# Quick PDF without bibliography (faster for testing)
quick: main.tex
	@echo "Building quick PDF (no bibliography)..."
	pdflatex -interaction=nonstopmode main.tex
	@echo "Quick PDF complete: main.pdf"

# EPUB generation using pandoc
wayland-book.epub: main.tex
	@echo "Building EPUB..."
	@echo "Note: EPUB generation requires pandoc and is experimental"
	@if command -v pandoc > /dev/null; then \
		pandoc main.tex \
			--from=latex \
			--to=epub \
			--output=wayland-book.epub \
			--toc \
			--toc-depth=3 \
			--epub-cover-image=figures/cover.png \
			--metadata title="Wayland: A Complete Guide" \
			--metadata author="1ay1" \
			--metadata lang="en-US" \
			--standalone \
			2>/dev/null || echo "EPUB generation failed. This is experimental."; \
	else \
		echo "Error: pandoc not found. Install with: apt install pandoc"; \
		exit 1; \
	fi
	@echo "EPUB build complete: wayland-book.epub"

# MOBI generation (Kindle) using ebook-convert
wayland-book.mobi: wayland-book.epub
	@echo "Building MOBI for Kindle..."
	@echo "Note: MOBI generation requires calibre (ebook-convert)"
	@if command -v ebook-convert > /dev/null; then \
		ebook-convert wayland-book.epub wayland-book.mobi \
			--language en \
			--authors "1ay1" \
			--title "Wayland: A Complete Guide" \
			--publisher "github.com/1ay1/wayland_book" \
			--book-producer "1ay1" \
			--enable-heuristics \
			2>/dev/null || echo "MOBI generation failed."; \
	else \
		echo "Error: ebook-convert not found. Install calibre package."; \
		exit 1; \
	fi
	@echo "MOBI build complete: wayland-book.mobi"

# Alternative: PDF optimized for e-readers (smaller, reflowable text)
pdf-kindle: main.pdf
	@echo "Creating Kindle-optimized PDF..."
	@if command -v gs > /dev/null; then \
		gs -sDEVICE=pdfwrite \
		   -dCompatibilityLevel=1.4 \
		   -dPDFSETTINGS=/ebook \
		   -dNOPAUSE \
		   -dQUIET \
		   -dBATCH \
		   -sOutputFile=wayland-book-kindle.pdf \
		   main.pdf; \
		echo "Kindle PDF created: wayland-book-kindle.pdf"; \
	else \
		echo "Error: ghostscript not found. Install with: apt install ghostscript"; \
		exit 1; \
	fi

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.bcf *.blg *.run.xml
	rm -f *.idx *.ilg *.ind *.synctex.gz *.fdb_latexmk *.fls
	rm -f *.acn *.glo *.ist
	rm -f frontmatter/*.aux chapters/*/*.aux backmatter/*.aux
	@echo "Clean complete"

# Complete clean including output files
distclean: clean
	@echo "Removing all generated files..."
	rm -f main.pdf wayland-book.epub wayland-book.mobi wayland-book-kindle.pdf
	@echo "Distclean complete"

# Install dependencies (Debian/Ubuntu)
install-deps:
	@echo "Installing build dependencies (requires sudo)..."
	sudo apt-get update
	sudo apt-get install -y \
		texlive-full \
		biber \
		pandoc \
		calibre \
		ghostscript \
		texlive-latex-extra \
		texlive-fonts-extra \
		texlive-science
	@echo "Dependencies installed"

# Install dependencies (Arch Linux)
install-deps-arch:
	@echo "Installing build dependencies for Arch Linux (requires sudo)..."
	sudo pacman -S --needed \
		texlive-most \
		biber \
		pandoc \
		calibre \
		ghostscript
	@echo "Dependencies installed"

# Install dependencies (Fedora)
install-deps-fedora:
	@echo "Installing build dependencies for Fedora (requires sudo)..."
	sudo dnf install -y \
		texlive-scheme-full \
		biber \
		pandoc \
		calibre \
		ghostscript
	@echo "Dependencies installed"

# Continuous build (watches for changes)
watch:
	@echo "Starting continuous build (requires latexmk)..."
	@if command -v latexmk > /dev/null; then \
		latexmk -pdf -pvc -interaction=nonstopmode main.tex; \
	else \
		echo "Error: latexmk not found. Install texlive-full"; \
		exit 1; \
	fi

# Check dependencies
check-deps:
	@echo "Checking dependencies..."
	@echo -n "LaTeX: "
	@command -v pdflatex > /dev/null && echo "✓" || echo "✗ (install texlive)"
	@echo -n "Biber: "
	@command -v biber > /dev/null && echo "✓" || echo "✗ (install biber)"
	@echo -n "Pandoc: "
	@command -v pandoc > /dev/null && echo "✓" || echo "✗ (install pandoc, optional for EPUB)"
	@echo -n "Calibre: "
	@command -v ebook-convert > /dev/null && echo "✓" || echo "✗ (install calibre, optional for MOBI)"
	@echo -n "Ghostscript: "
	@command -v gs > /dev/null && echo "✓" || echo "✗ (install ghostscript, optional for Kindle PDF)"
	@echo -n "Latexmk: "
	@command -v latexmk > /dev/null && echo "✓" || echo "✗ (install texlive-full, optional for watch)"

# Count statistics
stats:
	@echo "Book Statistics:"
	@echo "================"
	@echo -n "Total .tex files: "
	@find . -name "*.tex" | wc -l
	@echo -n "Total lines of LaTeX: "
	@find . -name "*.tex" -exec cat {} \; | wc -l
	@echo -n "Total chapters: "
	@find chapters -name "*.tex" | wc -l
	@echo -n "Bibliography entries: "
	@grep -c "^@" backmatter/references.bib || echo "0"
	@if [ -f main.pdf ]; then \
		echo -n "PDF size: "; \
		du -h main.pdf | cut -f1; \
		echo -n "PDF pages: "; \
		pdfinfo main.pdf 2>/dev/null | grep Pages | awk '{print $$2}' || echo "unknown"; \
	fi

# Validate LaTeX syntax
validate:
	@echo "Validating LaTeX files..."
	@find . -name "*.tex" -exec chktex -q {} \; || true
	@echo "Validation complete (warnings may be present)"

# Release build (all formats)
release: distclean pdf epub pdf-kindle
	@echo "Release build complete!"
	@echo "Files created:"
	@ls -lh main.pdf wayland-book.epub wayland-book-kindle.pdf 2>/dev/null || true

# Help target
help:
	@echo "Wayland Book Build System"
	@echo "========================="
	@echo ""
	@echo "Main targets:"
	@echo "  make pdf          - Build PDF (default)"
	@echo "  make quick        - Quick PDF build (no bibliography)"
	@echo "  make epub         - Build EPUB format"
	@echo "  make mobi         - Build MOBI format (Kindle)"
	@echo "  make pdf-kindle   - Build Kindle-optimized PDF"
	@echo "  make all          - Build PDF (same as 'make pdf')"
	@echo "  make release      - Build all formats (PDF, EPUB, Kindle PDF)"
	@echo ""
	@echo "Utility targets:"
	@echo "  make clean        - Remove build artifacts"
	@echo "  make distclean    - Remove all generated files"
	@echo "  make watch        - Continuous build on file changes"
	@echo "  make stats        - Show book statistics"
	@echo "  make validate     - Check LaTeX syntax"
	@echo "  make check-deps   - Check for required dependencies"
	@echo ""
	@echo "Installation targets:"
	@echo "  make install-deps        - Install dependencies (Debian/Ubuntu)"
	@echo "  make install-deps-arch   - Install dependencies (Arch Linux)"
	@echo "  make install-deps-fedora - Install dependencies (Fedora)"
	@echo ""
	@echo "For more information, see README.md"
