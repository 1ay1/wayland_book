# Wayland Book - Quick Start Guide

**Get started in 5 minutes!**

## For Readers

### Download Pre-built Book

Visit [Releases](https://github.com/1ay1/wayland_book/releases) and download:

- **wayland-book.pdf** - Full PDF version
- **wayland-book-kindle.pdf** - Optimized for e-readers
- **wayland-book.epub** - EPUB format

### Build from Source

```bash
# 1. Clone repository
git clone https://github.com/1ay1/wayland_book.git
cd wayland_book/wayland-book

# 2. Install dependencies (Ubuntu/Debian)
make install-deps

# 3. Build PDF
make pdf

# 4. Open the book
xdg-open main.pdf
```

That's it! The PDF is ready to read.

## For Contributors

### Quick Contribution Workflow

```bash
# 1. Fork on GitHub, then clone your fork
git clone https://github.com/YOUR_USERNAME/wayland_book.git
cd wayland_book

# 2. Create a branch
git checkout -b feature/my-contribution

# 3. Make your changes
cd wayland-book
# Edit .tex files in frontmatter/, chapters/, or backmatter/

# 4. Test locally
make pdf

# 5. Commit and push
git add .
git commit -m "Description of changes"
git push origin feature/my-contribution

# 6. Create Pull Request on GitHub
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## Common Tasks

### Build Different Formats

```bash
cd wayland-book

make pdf          # Standard PDF
make quick        # Fast build (no bibliography)
make epub         # EPUB format
make pdf-kindle   # Kindle-optimized PDF
make release      # All formats
```

### Continuous Build

```bash
make watch        # Auto-rebuilds on file changes
```

### Clean Build

```bash
make clean        # Remove build artifacts
make distclean    # Remove all generated files
```

### Check Statistics

```bash
make stats        # Show book statistics
```

## Directory Structure

```
wayland-book/
├── main.tex              # Main document
├── Makefile              # Build system
├── frontmatter/          # Title, preface, etc.
├── chapters/
│   ├── part1/            # Understanding the Problem
│   ├── part2/            # Wayland Philosophy
│   ├── part3/            # Protocol Deep Dive
│   └── ...               # More parts
├── backmatter/           # Appendices, bibliography
├── code-examples/        # Code listings
└── figures/              # Diagrams and images
```

## Editing Content

### Add a New Chapter

1. Create file: `chapters/partX/chapterYY-topic.tex`
2. Add to `main.tex`:
   ```latex
   \include{chapters/partX/chapterYY-topic}
   ```
3. Build: `make pdf`

### Add Code Example

```latex
\begin{lstlisting}[style=cstyle, caption=Example Description]
// Your C code here
void example(void) {
    // ...
}
\end{lstlisting}
```

### Add Bibliography Entry

Edit `backmatter/references.bib`:

```bibtex
@misc{example2024,
    author = {Author Name},
    title = {Title},
    year = {2024},
    howpublished = {\url{https://example.com}}
}
```

## Troubleshooting

### Build Fails

```bash
# Check dependencies
make check-deps

# See detailed errors
pdflatex main.tex

# Clean and rebuild
make distclean
make pdf
```

### Missing Packages

```bash
# Ubuntu/Debian
sudo apt-get install texlive-full biber

# Arch Linux
sudo pacman -S texlive-most biber

# Fedora
sudo dnf install texlive-scheme-full biber
```

### References Don't Appear

```bash
# Full build with bibliography
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex

# Or use Makefile
make pdf
```

## Platform-Specific Notes

### Linux
Works out of the box. Use your distribution's package manager.

### macOS
```bash
# Install MacTeX
brew install --cask mactex

# Then build normally
make pdf
```

### Windows
1. Install [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
2. Use WSL (recommended) or native Windows tools
3. Build with: `pdflatex main.tex`

## Getting Help

- **Issues**: [GitHub Issues](https://github.com/1ay1/wayland_book/issues)
- **Discussions**: [GitHub Discussions](https://github.com/1ay1/wayland_book/discussions)
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md)
- **Full README**: See [README.md](README.md)

## Creating a Release

For maintainers:

```bash
# 1. Update version in relevant files
# 2. Commit changes
git commit -am "Prepare v0.1.0 release"

# 3. Create and push tag
git tag -a v0.1.0 -m "Initial release"
git push origin main
git push origin v0.1.0

# 4. GitHub Actions automatically builds and creates release
```

## Tips for Writers

### Speed Up Builds
- Use `make quick` during writing (skips bibliography)
- Use `make watch` for continuous rebuilds
- Comment out unused `\include{}` lines in `main.tex`

### Check Your Work
```bash
make pdf && xdg-open main.pdf
```

### Before Submitting PR
```bash
# 1. Build succeeds
make pdf

# 2. No warnings (check output)

# 3. Spell check (use your editor)

# 4. Code examples compile (if applicable)

# 5. References work
# Check all \ref{} are resolved
```

## Quick Reference

### File Types
- `.tex` - LaTeX source files
- `.bib` - Bibliography database
- `.pdf` - Generated book
- `.aux`, `.log`, etc. - Build artifacts (auto-generated)

### Common Commands
```bash
make pdf          # Build the book
make clean        # Clean artifacts
make watch        # Auto-build
make stats        # Show statistics
make check-deps   # Check dependencies
```

### Special Boxes in LaTeX
```latex
\begin{notebox}...\end{notebox}           # Notes
\begin{warningbox}...\end{warningbox}     # Warnings
\begin{importantbox}...\end{importantbox} # Critical info
\begin{examplebox}...\end{examplebox}     # Examples
\begin{designbox}...\end{designbox}       # Design rationale
```

## What's Completed

✅ **Part 1**: Understanding the Display Server Problem (3 chapters)  
✅ **Part 2**: The Wayland Vision (4 chapters)  
✅ **Frontmatter**: Title, copyright, preface, acknowledgments, introduction  
✅ **Backmatter**: Bibliography (60+ entries), Resources appendix  
✅ **Infrastructure**: Build system, CI/CD, documentation

🚧 **Parts 3-9**: Protocol, Compositor, Graphics, Input, Implementation, Advanced Topics, Case Studies

## License

CC BY-SA 4.0 - Free to share and adapt with attribution.

## Links

- **Repository**: https://github.com/1ay1/wayland_book
- **Releases**: https://github.com/1ay1/wayland_book/releases
- **Issues**: https://github.com/1ay1/wayland_book/issues

---

**Ready to start? Just run `make pdf` and dive in!** 📚