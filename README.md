# Verification of a Conjugate Heat Transfer Model in OpenFOAM for a Simplified Medical Device Geometry

LaTeX source of the manuscript by Paulina Rodriguez, Lorena A. Barba, Brian Carnes, and Matthew Myers, accepted by the *ASME Journal of Verification, Validation and Uncertainty Quantification*. The tag `v1.0.0` marks the version originally submitted; `main` holds the revision prepared in response to the reviewers.

The simulations, mesh scripts, and analysis workflows reported in the paper are in a separate repository: [plinarodriguez/edds_verification_repo](https://github.com/plinarodriguez/edds_verification_repo). The risk-informed credibility plan is in [plinarodriguez/edds-credibility-plan](https://github.com/plinarodriguez/edds-credibility-plan).

## Files

- `manuscript_edds_Verification.tex`: main file, using the `asmejour` class; it inputs the section files below.
- `sections/`: abstract, introduction, methods, results, discussion, conclusion, acknowledgements, and funding. `nomenclature.tex` is not currently included in the manuscript.
- `figures/`: figures, grouped by study (code verification, heat source, solution verification, schematics, nominal model). Not every file here appears in the paper.
- `references.bib`: bibliography.
- `asmejour.cls`, `asmejour.bst`: ASME journal class (v1.22) and BibTeX style by John H. Lienhard V, distributed under the licenses in their file headers. `asmewide_example/` comes with the class and is not used by the manuscript.
- `appendix/appendix_credibility_plan.tex`: credibility-plan appendix, not currently included in the manuscript.
- `response_to_reviewers.md`: point-by-point response to the reviewers for the revision.
- `writing_review_report.md`: writing-quality review of the submitted draft.
- `.github/workflows/latexdiff.yml`: the "LaTeX Diff" workflow, run manually from the Actions tab, which builds a marked-up PDF of all changes since a given tag or commit (by default the latest tag).

## Building

```
latexmk -pdf manuscript_edds_Verification.tex
```

Requires a current TeX Live installation. Compiled PDFs are not committed.

## Preprint

The unmerged branch `arxiv-preprint` holds a version of the manuscript in a plain two-column article layout (`preprint.tex`) and a script, `make_arxiv_zip.sh`, that builds the arXiv source bundle.
