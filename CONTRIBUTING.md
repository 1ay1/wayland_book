# Contributing to Wayland Book

Thank you for your interest in contributing to the Wayland Book! This project aims to be the most comprehensive guide to Wayland display server architecture, and community contributions are essential to achieving that goal.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Contribution Workflow](#contribution-workflow)
- [Style Guidelines](#style-guidelines)
- [Commit Messages](#commit-messages)
- [Pull Request Process](#pull-request-process)
- [Content Guidelines](#content-guidelines)
- [Building the Book](#building-the-book)
- [Testing Your Changes](#testing-your-changes)

## Code of Conduct

This project follows the principles of respect, inclusivity, and collaboration. We expect all contributors to:

- Be respectful and considerate in communication
- Welcome newcomers and help them get started
- Accept constructive criticism gracefully
- Focus on what's best for the community and the book
- Show empathy towards other community members

## How Can I Contribute?

There are many ways to contribute:

### 📝 Content Contributions

- **Write new chapters**: Help complete the unfinished sections
- **Improve existing content**: Clarify explanations, add examples
- **Add code examples**: Provide working, well-commented code
- **Create diagrams**: Visual aids help understanding
- **Technical review**: Verify accuracy of technical content

### 🐛 Bug Reports

- **Typos and errors**: Even small fixes are valuable
- **Technical inaccuracies**: Help us get the details right
- **Broken links**: Report outdated or incorrect URLs
- **Build issues**: Report problems compiling the book

### 💡 Suggestions

- **New topics**: Suggest areas that should be covered
- **Better explanations**: Point out confusing sections
- **Additional examples**: Suggest useful code examples
- **Improved structure**: Recommend better organization

### 🌍 Translations

- **Translate to other languages**: Help make this book accessible globally

## Getting Started

1. **Fork the repository**
   ```bash
   # Click "Fork" on GitHub, then:
   git clone https://github.com/YOUR_USERNAME/wayland_book.git
   cd wayland_book
   ```

2. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/1ay1/wayland_book.git
   ```

3. **Install dependencies**
   ```bash
   cd wayland-book
   make install-deps  # For Debian/Ubuntu
   # Or: make install-deps-arch (Arch Linux)
   # Or: make install-deps-fedora (Fedora)
   ```

4. **Build the book**
   ```bash
   make pdf
   ```

## Development Setup

### Required Tools

- **TeX Live**: Full LaTeX distribution
- **Biber**: Bibliography processor
- **Git**: Version control

### Optional Tools

- **Pandoc**: For EPUB generation
- **Calibre**: For MOBI generation
- **Latexmk**: For continuous builds
- **ChkTeX**: LaTeX linter

### Editor Setup

Any text editor works, but these are recommended:

- **VS Code** with LaTeX Workshop extension
- **TeXstudio**: Dedicated LaTeX editor
- **Emacs/Vim** with LaTeX plugins

## Contribution Workflow

### 1. Create a Branch

```bash
git checkout -b feature/your-feature-name
# Or: git checkout -b fix/issue-number
```

Branch naming conventions:
- `feature/chapter-XX-topic` - New content
- `fix/issue-123` - Bug fixes
- `docs/improve-readme` - Documentation
- `refactor/chapter-reorganization` - Restructuring

### 2. Make Your Changes

- Edit the relevant `.tex` files
- Add code examples to `code-examples/`
- Add figures to `figures/`
- Update bibliography in `backmatter/references.bib` if needed

### 3. Test Locally

```bash
make pdf         # Build and check for errors
make validate    # Check LaTeX syntax (if chktex installed)
```

### 4. Commit Changes

```bash
git add <files>
git commit -m "Brief description of changes"
```

See [Commit Messages](#commit-messages) section for guidelines.

### 5. Push and Create Pull Request

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub.

## Style Guidelines

### LaTeX Style

1. **Line length**: Keep lines under 100 characters when possible
2. **One sentence per line**: Makes diffs cleaner
3. **Consistent indentation**: Use spaces, not tabs
4. **Section structure**: Follow existing chapter structure

### Writing Style

1. **Clear and concise**: Avoid unnecessary jargon
2. **Define terms**: Explain technical terms when first used
3. **Active voice**: Prefer active over passive voice
4. **Examples**: Include concrete examples
5. **Progressive difficulty**: Start simple, build complexity

### Code Style

1. **Complete examples**: Code should compile/run
2. **Well-commented**: Explain what and why, not just what
3. **Consistent formatting**: Follow existing code style
4. **Error handling**: Show proper error handling
5. **C language**: Primary language is C for Wayland examples

Example code style:

```c
// Good: Well-commented, clear
static void surface_enter(void *data,
                         struct wl_surface *surface,
                         struct wl_output *output) {
    // Surface entered a new output
    struct app_state *app = data;
    app->current_output = output;
    
    // Update scale factor based on output
    update_scale_factor(app);
}

// Avoid: No comments, unclear
static void surface_enter(void *d, struct wl_surface *s, struct wl_output *o) {
    ((struct app_state *)d)->current_output = o;
    update_scale_factor(d);
}
```

## Commit Messages

### Format

```
Short summary (50 chars or less)

More detailed explanation if needed. Wrap at 72 characters.
Explain what and why, not how (the code shows how).

- Bullet points are fine
- Use present tense ("Add feature" not "Added feature")
- Reference issues: Fixes #123
```

### Examples

Good commit messages:
```
Add chapter on DRM/KMS integration

Explains Direct Rendering Manager and Kernel Mode Setting,
including practical examples of mode-setting and page flipping.

Fixes #45
```

```
Fix typo in security model chapter

Changed "compsoitor" to "compositor" in section 7.2.
```

```
Improve buffer management code example

Previous example didn't show proper release handling.
Added listener for buffer release events.
```

## Pull Request Process

### Before Submitting

- [ ] Book builds successfully (`make pdf`)
- [ ] No LaTeX errors or warnings (check build output)
- [ ] Spell-check your changes
- [ ] Bibliography entries added if needed
- [ ] Code examples tested (if applicable)
- [ ] Related documentation updated

### PR Description

Include:

1. **What**: Brief description of changes
2. **Why**: Reason for the changes
3. **How**: Any implementation details worth noting
4. **Testing**: How you tested the changes
5. **Related Issues**: Link to related issues

Example:

```markdown
## Add Chapter 8: Protocol Basics

### What
Adds comprehensive chapter covering Wayland wire protocol fundamentals.

### Why
This chapter was listed as "In Progress" and is essential for understanding
how clients and compositors communicate.

### Content Includes
- Wire protocol format explanation
- Object lifecycle details
- Message encoding/decoding
- 5 working code examples

### Testing
- Built PDF successfully
- All code examples compile
- Verified against Wayland protocol spec
- Technical review by @reviewer

Closes #78
```

### Review Process

1. **Automated checks**: GitHub Actions will build the book
2. **Maintainer review**: Content and technical accuracy
3. **Community feedback**: Other contributors may comment
4. **Revisions**: Address feedback and push updates
5. **Merge**: Once approved, changes are merged

### After Merge

- Your contribution will be in the next release
- You'll be added to contributors list (if first contribution)
- Thank you! 🎉

## Content Guidelines

### Technical Accuracy

- **Verify against source**: Check official Wayland documentation
- **Test code**: All code examples should work
- **Cite sources**: Add bibliography entries for references
- **Current information**: Ensure information is up-to-date

### Chapter Structure

Each chapter should have:

```latex
\chapter{Title}
\label{ch:chapter-id}

\epigraph{Quote}{--- Author}

\section{Introduction}
Brief overview of what this chapter covers...

\section{Main Content Sections}
...

\section{Summary}
Recap key points...

\section{Further Reading}
Additional resources...

\clearpage
```

### Special Boxes

Use appropriate boxes for emphasis:

```latex
% For general notes
\begin{notebox}
Additional context or historical information.
\end{notebox}

% For warnings
\begin{warningbox}
Common pitfalls or things to avoid.
\end{warningbox}

% For critical information
\begin{importantbox}
Essential concepts that must be understood.
\end{importantbox}

% For concrete examples
\begin{examplebox}
Real-world scenarios and analogies.
\end{examplebox}

% For design rationale
\begin{designbox}
Explanation of why Wayland is designed this way.
\end{designbox}
```

### Code Listings

```latex
\begin{lstlisting}[style=cstyle, caption=Descriptive Caption]
// Well-commented code example
struct wl_surface *surface = wl_compositor_create_surface(compositor);
\end{lstlisting}
```

### Cross-References

```latex
% Reference chapters
See Chapter~\ref{ch:security-model} for details.

% Reference sections
As discussed in Section~\ref{sec:buffer-management}...

% Reference figures
Figure~\ref{fig:architecture-diagram} shows...
```

## Building the Book

### Quick Build

```bash
make quick    # Fast build without bibliography
```

### Full Build

```bash
make pdf      # Complete build with bibliography
```

### All Formats

```bash
make release  # PDF, EPUB, Kindle PDF
```

### Continuous Build

```bash
make watch    # Rebuilds automatically on changes
```

### Clean Build

```bash
make clean      # Remove artifacts
make distclean  # Remove all generated files
```

## Testing Your Changes

### Checklist

- [ ] **Build succeeds**: No errors in `make pdf`
- [ ] **No warnings**: Check build output
- [ ] **Visual check**: Open PDF and review your section
- [ ] **Code compiles**: Test any code examples
- [ ] **Links work**: Verify all `\ref{}` resolve correctly
- [ ] **Bibliography**: Citations appear correctly
- [ ] **Spell check**: No typos

### Manual Testing

1. Build the PDF: `make pdf`
2. Open `main.pdf`
3. Navigate to your changes
4. Verify formatting, clarity, accuracy
5. Check code examples are properly formatted
6. Ensure figures appear correctly

### Automated Testing

GitHub Actions will:
- Build the PDF
- Generate EPUB and Kindle versions
- Report any build errors

## Questions?

- **General questions**: Open a [Discussion](https://github.com/1ay1/wayland_book/discussions)
- **Bug reports**: Open an [Issue](https://github.com/1ay1/wayland_book/issues)
- **Chat**: Join #wayland on OFTC IRC (if applicable)

## Recognition

All contributors are valued! Significant contributions will be:
- Acknowledged in the book's acknowledgments section
- Listed in GitHub contributors
- Credited in release notes

## License

By contributing, you agree that your contributions will be licensed under the same CC BY-SA 4.0 license as the project.

---

Thank you for contributing to making Wayland more accessible and understandable to everyone! 🙏