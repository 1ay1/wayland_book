#!/bin/bash

echo "================================================"
echo "  Wayland Book - Push to GitHub"
echo "================================================"
echo ""

# Check if on main branch
current_branch=$(git branch --show-current)
if [ "$current_branch" != "main" ]; then
    echo "⚠️  Warning: Not on main branch (currently on $current_branch)"
    exit 1
fi

# Check if working tree is clean
if ! git diff --quiet || ! git diff --staged --quiet; then
    echo "⚠️  Warning: You have uncommitted changes"
    git status --short
    echo ""
    read -p "Do you want to commit these changes first? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add .
        read -p "Enter commit message: " commit_msg
        git commit -m "$commit_msg"
    else
        exit 1
    fi
fi

echo "Current repository status:"
git log --oneline -3
echo ""

# Push to main
echo "================================================"
echo "Step 1: Pushing to GitHub..."
echo "================================================"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to main branch!"
else
    echo "❌ Failed to push. Please check your GitHub authentication."
    exit 1
fi

echo ""
echo "================================================"
echo "Step 2: Create Release Tag"
echo "================================================"
echo ""

read -p "Do you want to create a release tag? (y/N) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Enter version tag (e.g., v0.1.0): " version
    
    echo "Creating tag: $version"
    git tag -a "$version" -m "Initial release: Foundation chapters

- Part 1 & Part 2 complete (7 chapters)
- 8,500+ lines of quality content
- Build system for PDF, EPUB, Kindle
- Comprehensive documentation
- GitHub Actions CI/CD

Visit https://github.com/1ay1/wayland_book/releases for downloads."
    
    echo "Pushing tag to GitHub..."
    git push origin "$version"
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ Release tag created successfully!"
        echo ""
        echo "🎉 GitHub Actions will now build the book!"
        echo ""
        echo "In a few minutes, you can download:"
        echo "  - wayland-book.pdf"
        echo "  - wayland-book-kindle.pdf"
        echo "  - wayland-book.epub"
        echo ""
        echo "From: https://github.com/1ay1/wayland_book/releases"
    else
        echo "❌ Failed to push tag"
        exit 1
    fi
fi

echo ""
echo "================================================"
echo "  ✨ Repository Successfully Pushed! ✨"
echo "================================================"
echo ""
echo "Your repository is now live at:"
echo "  https://github.com/1ay1/wayland_book"
echo ""
echo "Next steps:"
echo "  1. Check GitHub Actions: https://github.com/1ay1/wayland_book/actions"
echo "  2. View releases: https://github.com/1ay1/wayland_book/releases"
echo "  3. Add topics to repository (wayland, linux-graphics, book, etc.)"
echo "  4. Share with the community!"
echo ""
echo "================================================"

