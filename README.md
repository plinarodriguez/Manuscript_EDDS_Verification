 
  #asmejour: A template for ASME journal papers#
 
  Version 1.18 dated 2022/01/10.

  ####Overview####
  This class provides a template to format preprints in the style of journal papers published by the American Society of Mechanical Engineers. 
  The layout and reference formats follow the style of published papers in 2021.
  
  This work is not a publication of ASME.

 Files in this distribution are:

  ```   README.md              --  this file
      asmejour.cls           --  the class file
      asmejour.bst           --  bibtex style for ASME journal references
      asmejour-template.tex  --  a latex template/example for this class
      asmejour-template.pdf  --  documentation/sample paper
      asmejour-sample.bib    --  a sample bibliography file
      *
      sample-figure-1.pdf, 
      sample-figure-2a.pdf, 
      sample-figure-2b.pdf   -- figures for the example template
      /asmewide_example     -- directory includes asmewide.sty and examples of wide equations```
		

  The .tex and .cls files are commented and should be self-explanatory.

  
  This template was designed to approach the following aims:

 - closely approximate ASME's fonts and layout, including author/title/abstract design

 - match ASME's current reference formats, including hyperlinked DOI and URL (replaces asmems4.bst)

 - support hyperlinks to figures, tables, equations, references, and external URLs

 - support pdf bookmarks and metadata

 - provide line numbers for editing and review

 - support balancing of columns on last page

 - support PDF/A (archival) standards if desired

 - support copyright notices for federal employees and contractors

 - support bold-face math and citations in section headings and captions

 - enable various math and text features with newtxmath, newtxtext, and inconsolata packages

 - enable passages in other languages, e.g., for a translation of the abstract or a quotation


  ####Author####
  
  John H. Lienhard V
  
  Department of Mechanical Engineering
          
  Massachusetts Institute of Technology
          
  Cambridge, MA 02139-4307 USA


 ---
 
 ####Change log####
v1.18 (2022/01/10)
 - Introduce asmewide.sty, an experimental package for setting page-width equations in a two column format. A document with examples of use is included.
 
v1.17 (2021/12/26):
 - Add code to warn about obsolete LaTeX installations. TeX Live 2020 or later is recommended for the asmejour package.

v1.16 (2021/12/23):
 - suppress warnings about unused options when calling mathalfa and/or barcolor
 - eliminate use of \\entry{} with a single argument to produce subheadings in nomenclature; use \\EntryHeading{} instead. (**not backward compatible**)
 - incorporate pending changes to LaTeX pdf management in relation to pdf-a color profile loading and recently deprecated \\pdfcatalog command
 - load xparse only for older kernels
 - edit documentation; mention \\mathversion sans and sansbold
 - add upright, sans serif Greek letters for math
 - minor edits to class file code; correct calls for pdfminorversion; edit warnings
 - minor edits to asmejour.bst in relation to hyperlinks, \\href, \\hrefurl; update jht macro to latest style

v1.15 (2021/02/01): 
 - fix issue with math accents in mathversion sansbold (for captions)
 - add optional copyright notices for government employees and contractors
 - add \\EntryHeading command for nomenclature
 - provide additional options for typewriter font
 - simplify language options for babel
 - make subfigure example consistent with ASME's labeling
 - make abstract environment tolerant of blank lines
 - edit sample bib file; include example of @manual
 - update some usage of xparse; internal changes to \\PaperYear, \\CorrespondingAuthor and \\keywords commands.
 - edit code for keys and options; correct largesc option; slightly increase interword shrink; remove legacy code; 
 - substantially edit documentation
 
v1.14 (2020/08/12): Set pdf page layout to a single page, rather than a two-page spread.

v1.13 (2020/08/10): Add support for PDF/A archival standards (1b, 2b, 2u, 3b, 3u), as the newtx fonts have recently gained complete unicode maps; also, restore varl and varqu as default options of the inconsolata font.
 
v1.12 (2020/04/12): Change subfigure \\ref labels to have parentheses around italic letters; remove space between consecutive numerical citations; add macro to adjust vertical space below abstract; edit documentation; remove varl and varqu options of inconsolata font; extensively edit/document asmejour-sample.bib file. 

Many changes to asmejour.bst (v1.03) to improve consistency with ASME reference formats for collections, technical reports, and conference papers, to better manage hyperlinks, and to warn for missing fields. These includes: move venue, eventdate, and paper number to end of @inproceedings; move paper number after address of @techreport; hyperlink technical report numbers and conference numbers, and provide fallback for missing numbers; separate serial collection parenthetical layout from @incollection into new @inserialcollection; add default name for @inproceedings paper number, "Paper No.", changed by type ={} (this alternation is not backward compatible!); add oclc macro for archive field; complete the set of macros for ASME journal names.

v1.11: ensure T1 font encoding, utf-8 input, and LuaLaTeX compatibility; edit documentation.

v1.10: update asmejour.bst to most recent Crossref standard prefix for doi (https://doi.org/); remove xpatch package from class file; disable \\( and \\) in pdf bookmarks to avoid warnings; adjust \\eqref in bookmarks; edit documentation.

v1.09: adjust nomenclature list; edit language support

v1.08: adjust penalties in nomenclature list; fix minor typos in template

v1.07: add commands for \\toprule, \\midrule, and \\bottomrule in ASME style; add advice on landscape material; minor edits to \\entry and for language support.

v1.06:  allow standard \\date, \\maketitle,  and \\title commands and abstract environment; make final column balancing a package option; remove \\normalfont from AMS equation tags to allow tags to match caption font; incorporate \\subfigure in example template; allow line numbers in AMS display math; provide comma between sequential footnote marks; adjust babel options; other minor edits; revise template text.

v1.05:  automate list of figures/tables with option to omit; replace balance package with flushend package and automate; revise skips in nomenclature; address conflicts of lineno package with other elements; option to hyphenate typewriter font; new options for footer text; adjust \\emergencystretch and \\tolerance; additional documentation and references

v1.04:  edit documentation; add language support via babel
 
v1.03:  expand documentation; fix conflict between lineno and balance packages; more footer options; edit \\entry
 
v1.02:  adjust formats of 2nd and 3rd level headings; add option for line numbers; eqn tags in blue
 
v1.01:  edit documentation, remove development code
 
v1.00:  initial release
 
 ---
 
 ####License####

 Copyright (c) 2021 John H. Lienhard

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
 associated documentation files (the "Software"), to deal in the Software without restriction, 
 including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
 subject to the following two conditions:

 The above copyright notice and this permission notice shall be included in all copies or 
 substantial portions of the Software.

 The software is provided "as is", without warranty of any kind, express or implied, including but 
 not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. 
 In no event shall the authors or copyright holders be liable for any claim, damages or other liability, 
 whether in an action of contract, tort or otherwise, arising from, out of or in connection with the 
 software or the use or other dealings in the software.
