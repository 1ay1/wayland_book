#!/bin/bash

# Part 3: Protocol Deep Dive
cat > wayland-book/chapters/part3/chapter08-protocol-basics.tex << 'EOC'
\chapter{Protocol Basics}
\label{ch:protocol-basics}

\section{Introduction}
This chapter covers the fundamental mechanics of the Wayland protocol, including message formats, object creation, and communication patterns.

\section{Wire Protocol Format}
Details of binary message encoding...

\section{Object Lifecycle}
How objects are created, used, and destroyed...

\section{Interfaces and Requests}
Understanding the object-oriented protocol design...

\clearpage
EOC

# Continue for other chapters...
echo "Chapter templates created. Run 'bash create_remaining_chapters.sh' to generate"
