#!/bin/bash

# Setup script for Wayland Book Git repository
# This script initializes the git repository and prepares it for GitHub

set -e

echo "======================================="
echo "Wayland Book - Git Repository Setup"
echo "======================================="
echo ""

# Check if we're in the right directory
if [ ! -f "wayland-book/main.tex" ]; then
    echo "Error: Please run this script from the wayland/ directory"
    echo "Current directory: $(pwd)"
    exit 1
fi

# Initialize git if not already done
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
    echo "Git repository initialized."
else
    echo "Git repository already exists."
fi

# Create .gitignore if it doesn't exist
if [ ! -f ".gitignore" ]; then
    echo "Error: .gitignore not found. It should have been created already."
    exit 1
fi

# Add all files
echo ""
echo "Adding files to git..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "No changes to commit."
else
    # Initial commit
    echo ""
    echo "Creating initial commit..."
    git commit -m "Initial commit: Wayland Book comprehensive guide

- Complete frontmatter (title, copyright, preface, acknowledgments, introduction)
- Part 1: Understanding the Display Server Problem (3 chapters)
- Part 2: The Wayland Vision (4 chapters)
- Comprehensive bibliography (60+ references)
- Appendix D: Resources
- Build system (Makefile for PDF, EPUB, Kindle)
- GitHub Actions for automated releases
- Contributing guidelines
- README documentation

Book includes ~4,500 lines of quality content with code examples.
Licensed under CC BY-SA 4.0."

    echo "Initial commit created."
fi

# Check if remote exists
if git remote | grep -q "origin"; then
    echo ""
    echo "Remote 'origin' already exists:"
    git remote -v
    echo ""
    read -p "Do you want to update the origin URL to https://github.com/1ay1/wayland_book.git? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git remote set-url origin https://github.com/1ay1/wayland_book.git
        echo "Remote origin URL updated."
    fi
else
    echo ""
    echo "Adding remote origin..."
    git remote add origin https://github.com/1ay1/wayland_book.git
    echo "Remote origin added: https://github.com/1ay1/wayland_book.git"
fi

# Set main as default branch
current_branch=$(git branch --show-current)
if [ "$current_branch" != "main" ]; then
    echo ""
    echo "Renaming current branch to 'main'..."
    git branch -M main
fi

echo ""
echo "======================================="
echo "Git repository is ready!"
echo "======================================="
echo ""
echo "Repository status:"
git status
echo ""
echo "Remote repository:"
git remote -v
echo ""
echo "======================================="
echo "Next steps:"
echo "======================================="
echo ""
echo "1. Make sure you have created the repository on GitHub:"
echo "   https://github.com/1ay1/wayland_book"
echo ""
echo "2. Push to GitHub:"
echo "   git push -u origin main"
echo ""
echo "3. To create a release:"
echo "   git tag -a v0.1.0 -m 'Initial release'"
echo "   git push origin v0.1.0"
echo ""
echo "4. GitHub Actions will automatically build the book"
echo "   and create release artifacts (PDF, EPUB, Kindle PDF)"
echo ""
echo "======================================="
echo "Build the book locally:"
echo "======================================="
echo ""
echo "  cd wayland-book"
echo "  make pdf          # Build PDF"
echo "  make epub         # Build EPUB"
echo "  make pdf-kindle   # Build Kindle PDF"
echo "  make release      # Build all formats"
echo ""
echo "======================================="
echo "Repository: https://github.com/1ay1/wayland_book"
echo "License: CC BY-SA 4.0"
echo "======================================="
