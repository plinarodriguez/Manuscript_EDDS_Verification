#!/usr/bin/env bash
# Build the arXiv upload bundle from preprint.tex (arxiv-preprint branch only).
# Requires: latexmk, pdflatex, bibtex, and arxiv_latex_cleaner
#   (pip install arxiv-latex-cleaner).
# Output: edds_verification_arxiv.zip with preprint.tex, preprint.bbl, the
# section files and only the figures actually used, with LaTeX comments removed.
set -euo pipefail
cd "$(dirname "$0")"

latexmk -pdf -recorder -interaction=nonstopmode preprint.tex >/dev/null

tmp=$(mktemp -d)
src="$tmp/arxiv"
mkdir -p "$src"
# Every file pdflatex read from this directory, except auxiliary files
grep -E '^INPUT (\./)?(figures|sections)/' preprint.fls \
  | sed -E 's/^INPUT (\.\/)?//' | sort -u \
  | xargs -I{} cp --parents {} "$src/"
cp preprint.tex preprint.bbl preprint-unsrtnat.bst "$src/"   # .bst only so arXiv's scan finds it; the .bbl is what compiles

arxiv_latex_cleaner "$src" >/dev/null   # writes "$src"_arXiv
rm -f edds_verification_arxiv.zip
(cd "${src}_arXiv" && zip -qr -X "$OLDPWD/edds_verification_arxiv.zip" .)
rm -rf "$tmp"
echo "Wrote edds_verification_arxiv.zip"
