# Writing Quality Review: *Verification of a Conjugate Heat Transfer Model in OpenFOAM for a Simplified Medical Device Geometry*

**Mode:** full review · **Target:** ASME Journal of VVUQ (Research Paper) · **Date:** 29 Sep 2026
**Files reviewed:** `manuscript_edds_Verification.tex` and the files it `\input`s: `sections/abstract, introduction, methods, results, discussion, conclusion, acknowledgements, funding`. Commented-out text and `asmewide_example/` were skipped. The nomenclature and appendix files are commented out of the main file, so they were not reviewed.
**Line references** are `file:line` in the source `.tex` files.

---

## Summary

The prose is grammatical and logically ordered, but three problems recur across the whole paper. First, **numbers and study parameters disagree between sections**: the hydrodynamic order of accuracy, the mesh counts, the solver-tolerance time step, the QoI locations and the cost figures. A VVUQ reviewer will catch these, and they matter more than any style issue. Second, **the names of the verification cases, the resolution measure and several symbols keep changing**, so the reader cannot always tell whether a new case or variable has been introduced. Third, the text is **padded with the same abstract words** (*rigorous* ×16, *isolate* ×23, *consistent* ×28, *demonstrate* ×16, *credibility* ×17). Results and Discussion also repeat each other, which weakens the claims these words are meant to support.

---

## Pass 5: Numbers and Citations (15 issues)

This pass comes first because its findings are the most severe.

| # | Sev. | Location | Issue | Fix |
|---|---|---|---|---|
| 5.1 | **CRITICAL** | `discussion:15` vs `results:34`, abstract | Discussion gives the hydrodynamic order as **p = 1.90**; Results and Abstract say **p = 1.95**. (1.90 is the coupled pipe's value, `results:120`.) Discussion also cites errors "from O(10⁻³) to O(10⁻⁵)", which appear nowhere in Results. | Change to p = 1.95; either state the error range in Results or delete it from the Discussion. |
| 5.2 | **CRITICAL** | `methods:150` vs `results:8` | In Methods the hydrodynamic study uses **four** meshes (0.43, 0.22, 0.11, **0.088 mm**); in Results it uses **three** (0.43, 0.22, 0.11 mm), and Fig. `scatterVelocity` has three panels. | Use one mesh set in both places. If the 0.088 mm mesh was dropped, say why. |
| 5.3 | **CRITICAL** | `methods:39` (Table 1) vs `methods:161`, `results:94` | Table 1 lists the Coupled Pipe as **Transient**; the paragraph heading and Results call it **Steady-State**. | Set the Table 1 entry to "Steady". |
| 5.4 | **CRITICAL** | `methods:162` vs `methods:159`, `results:99–115` | The coupled pipe uses "the same set of **four** … meshes", but the Solution Verification intro says that study uses "**seven** mesh resolutions", and Fig. `scatterTemp` has three panels. | Say which meshes each solution-verification case uses; state seven only for the simplified EDDS. |
| 5.5 | **CRITICAL** | `methods:175` vs `results:143` | Methods runs the solver-tolerance study at "M3 and time step **0.005 s**"; Results says "mesh M3 and time step **T3**", and T3 = **0.0025 s** (`methods:167`). The decoupled study also fixes Δt at 0.005 s (`methods:178`), a value outside the T1–T7 range. | Confirm the actual Δt and use the same value in both sections. If 0.005 s is correct, say why it differs from T3. |
| 5.6 | **MAJOR** | `methods:125`, `methods:156`, `results:81` | The QoI_diff location is given three ways: "1.2 times the thermal entry length", "1.2 times the case region", and "halfway along the heated fluid region". | Give one location, in mm, and repeat it exactly. |
| 5.7 | **MAJOR** | `results:193` | Going from 0.1 % to 0.055 % is a **45 %** error reduction, not 50 %. (The 96 % cost increase, 24 → 47 min, checks out.) | "…a 96 % increase in cost for a 45 % reduction in error." |
| 5.8 | **MAJOR** | `results:198` vs `results:193` | The Fig. `compCost` caption says cost is "in hours"; the text reports minutes. | Use the same unit in both. |
| 5.9 | **MAJOR** | `methods:248` vs `results:191` | Methods says the runs used the SOLO HPC cluster; Results says "18 core CPU workstations". | Describe one platform and give the core count used per run. Otherwise runtime comparisons are meaningless. |
| 5.10 | **MAJOR** | `results:143` | Relative error "decreases … to O(10⁻⁴) at 10⁻⁸", but 10⁻⁸ is the reference solution, so its error is zero by definition. The study has no figure, although `solver_tol_error.png` exists in the repository. | *Content note:* report the error at 10⁻⁷ and add the figure. |
| 5.11 | MINOR | `methods:8`, `methods:181` vs `results:5`, Table 1 | "Two cases" / "Two problems are considered", but three code-verification problems follow. | Change to "three". |
| 5.12 | MINOR | `methods:130–132` | The equation uses V_i; the text defines "vol_i … the i-th **centroid** volume". | "…and V_i is the volume of cell i." |
| 5.13 | MINOR | `methods:153`, `methods:156` | "$1.4e^{-4}$ m" typesets as 1.4·e⁻⁴ (Euler's e). It also mixes m here with mm in Results (`results:43`). | Write "0.14 mm, 0.071 mm, 0.035 mm", matching Results. |
| 5.14 | MINOR | `methods:153` vs `methods:22` | "18 Watts" vs "1~W"; "10~seconds" vs "s" elsewhere. | Use SI symbols throughout: "18 W", "10 s". |
| 5.15 | MINOR | `results:5`, `methods:192–206` | The radial-conduction solution is cited to `hagenPoisueille` and `chtMultiRegion`, which are a fluid-mechanics textbook and the solver documentation. Eq. (solid_conduction) has no citation. | Cite a conduction text (e.g., Lienhard `heat_transfer`) for Eq. (solid_conduction), and remove the misplaced citation from `results:5`. |

**Content notes (flagged, not edited):**

- **Series solution.** Eq. `bessel_theta_solution` (`methods:224`) appears garbled. The standard form is 2 J₀(λₙ r/R) / [λₙ J₁(λₙ)] · exp(−λₙ² αt/R²); the current text has J₁ R λₙ² in the denominator and no argument on J₀.
- **Co-refinement ratios.** The "co-refined" code-verification case refines the mesh by 2× and the time step by 10× per level (`methods:156`). The T1–T7 ratios are uneven (0.004 → 0.0035 → 0.0025 …, `methods:167`), although the meshes use a constant r = 1.26. If this is intentional, state the rationale; a reviewer will ask.
- **Upwind convection.** Convection uses an upwind scheme (`methods:115`), which is first-order, yet the coupled pipe reaches p ≈ 1.9. If this is correct, add one sentence explaining why the observed order is second order.
- **Runtime claim.** The Abstract claims "runtime does not vary monotonically with discretization parameters", but only the Discussion (`discussion:33`) says so. Results should show it explicitly.
- **Interface imbalance.** The explanation in `results:177` is stated as fact but is untested. Hedge it ("we attribute…") or support it.
- **Missing Methods entry.** The Interface Energy Consistency analysis (`results:173`) has no corresponding Methods subsection.

**LaTeX/build issues found along the way:**

- **Duplicate labels.** `fig:sub1`, `fig:sub2` and `fig:sub3` are each defined twice (`results:16,22,28` and `results:102,108,114`).
- **Filename case.** `results:106,112` load `T_scatter_radial_z30mm_m1.png` and `_m2.png`, but the files on disk are named `…_M1.png` and `…_M2.png`. This compiles on macOS but will fail on a case-sensitive system, such as a submission server.
- **Duplicated paragraph.** `methods:173` and `methods:175` repeat the same paragraph; delete 173.

---

## Pass 4: Terminology (8 issues)

| # | Sev. | Issue | Instances | Recommendation |
|---|---|---|---|---|
| 4.1 | **MAJOR** | Case names drift across sections | Hydrodynamic: "Hydrodynamic (Fluid Only) Model", "hydrodynamic case", "laminar pipe flow", "Hagen–Poiseuille flow". Conduction: "Radial Conduction Model", "solid conduction", "conduction-dominated configuration". Diffusion: "Transient Thermal Diffusion **Model**" (methods) vs "**Verification**" (`results:80`). Coupled pipe: "Steady-State Coupled Pipe", "fully coupled CHT configuration". EDDS: "Transient Simplified EDDS", "device-representative EDDS configuration" (`methods:10`), "device-relevant geometry" (`methods:165`), "nominal model" (figure folder). | Use the five Table 1 names verbatim in every heading, caption and cross-reference: *hydrodynamic model, radial conduction model, thermal diffusion model, coupled pipe model, simplified EDDS model*. |
| 4.2 | **MAJOR** | Resolution measure | "representative cell size/length" (10), "representative mesh length/size" (4), "characteristic cell size" (2), "representative length" | Define *h* once as "representative cell size" and use only that term. |
| 4.3 | **MAJOR** | Time step | "time step" (20), "timestep" (23), "time-step" (1) | Use "time step" (noun) and "time-step" only as a compound adjective ("time-step refinement"). |
| 4.4 | **MAJOR** | Symbol drift | Thermal conductivity is κ (`methods:73`) but k (`methods:192`); the source term is S_E but S; QoI is written QOI in the StREEQ equation (`methods:240`); `QoI_{diff}` lacks `\text{}` (`methods:125`). | Use κ, S_E and QoI everywhere. |
| 4.5 | **MAJOR** | Selected configuration named three ways | "M3–T3" (`results:202`, `discussion:35`), "M3 and time step T3" (`results:143`), "M3 with Δt = 0.0025 s" (`results:193`) | Define it once as "M3–T3 (h = 0.23 mm, Δt = 0.0025 s)", then use "M3–T3". |
| 4.6 | MINOR | Solver tolerance named four ways | "solver tolerance", "solver convergence tolerances", "linear solver convergence tolerances", "linear solver convergence criteria" | Use "linear-solver tolerance". |
| 4.7 | MINOR | Unnecessary or undefined acronyms | **B&IC** (`methods:108`) is defined and never used. **BDW** (`results:191`) is non-standard. **StREEQ** is never expanded. **CHT** is re-expanded at `results:95`. | Delete B&IC and BDW; expand StREEQ at first use in the Abstract and the text; drop the second CHT expansion. |
| 4.8 | MINOR | Hyphenation of compound modifiers | "high risk regulatory decision making" (`intro:2`), "medium to low risk applications" (`intro:4`), "application relevant conditions" (`methods:10,56`), "heat transfer driven" (`methods:1`) | "high-risk regulatory decision-making", "medium-to-low-risk applications", "application-relevant", "heat-transfer-driven". |

---

## Pass 1: Clutter (11 issues)

| # | Sev. | Location | Original | Revision | Why |
|---|---|---|---|---|---|
| 1.1 | **MAJOR** | whole paper | *rigorous* ×16, *isolate* ×23, *consistent* ×28, *demonstrate* ×16 | Keep at most one "rigorous" (in the Abstract), and let the numbers show rigor. Replace most uses of "consistent with" with the specific claim ("matches the scheme's formal second order"). | Repeated self-description reads as advocacy, and a VVUQ reviewer discounts it. |
| 1.2 | **MAJOR** | `results:1` | "This section presents the results of the verification studies used to assess … Together, these results provide evidence of numerical correctness, convergence, and overall model credibility." | Delete the paragraph. The subsection headings already give the roadmap. | The paragraph repeats Methods §Verification Study Design. |
| 1.3 | **MAJOR** | `methods:235` | "While the analytical benchmark problems represent simplified physical systems, they were selected … Although analytical solutions are limited to simplified representations of the underlying physics, they remain valuable verification tools for building credibility." | "Although the benchmarks simplify the physics, each isolates a phenomenon present in the full model and has a known exact solution." | The first and last sentences make the same point. |
| 1.4 | **MAJOR** | `discussion:11`, `discussion:17` | The Discussion opens by restating the Abstract, and ¶3 (~190 words) retells the code-verification sequence already given in Methods and Results. | Cut ¶1 to one sentence. Reduce ¶3 to its new point: "Neither steady case tested transient transport or interface coupling; the thermal diffusion model closes that gap (p = 2.15–2.47)." | The Discussion should interpret results, not recap them. |
| 1.5 | MINOR | `intro:6` | "To provide context for the level of verification performed, this study adopts a risk-informed perspective consistent with the ASME V&V 40 framework." | "We set the level of verification using the risk-informed approach of ASME V&V 40." | This is roundabout; the actor is hidden. |
| 1.6 | MINOR | `intro:8` | "This study focuses specifically on verification … In particular, this study presents a structured and transparent verification study…" | "This paper addresses verification; a companion paper covers validation and UQ. We verify a conjugate heat transfer (CHT) model of a heated internal flow…" | "Study" appears three times in two sentences, and "specifically" and "in particular" add nothing. |
| 1.7 | MINOR | `results:174` | "It is expected that the heat flux leaving the solid must equal the heat flux entering the fluid" | "Energy conservation requires the heat flux leaving the solid to equal the heat flux entering the fluid" | Dead-weight opener; the physical principle should be stated as such. |
| 1.8 | MINOR | `results:81` | "In order to reduce the governing energy equation…" | "To reduce the energy equation…" | |
| 1.9 | MINOR | `results:92` | "…building the accuracy and reliability of the coupled fluid-thermal solution." | "…and quantify the accuracy of the coupled solution." | Accuracy is assessed, not built. |
| 1.10 | MINOR | `conclusion:1` | "This study represents the first step…" | "This study is the first step…" | |
| 1.11 | MINOR | `intro:15`, `discussion:39`, `conclusion:5` | "rigorous, transparent, and risk-informed", "traceable, reproducible, and accessible", "accessibility and transparency" | Keep one adjective, whichever carries the claim. | Stacked adjectives dilute one another. |

---

## Pass 2: Voice and Verbs (8 issues)

**Tense (MAJOR).** Methods switches tense within paragraphs. For example, `methods:60` has "Simulations **were** performed … Conjugate heat transfer **is** modeled…", and Results mixes "was assessed" with "is computed" (`results:81`). A simple rule: use the past tense for what you did ("we ran", "we refined") and the present tense for what the solver does and what the figures show.

**First person.** ASME journals accept "we". Use it where a decision is yours; keep the passive for routine procedure.

| # | Sev. | Location | Original | Revision |
|---|---|---|---|---|
| 2.1 | **MAJOR** | `intro:6` | "However, in this work, additional rigor is pursued where computationally feasible." | "Where computationally feasible, we go further." |
| 2.2 | **MAJOR** | `results:202` | "…the M3–T3 configuration … is selected for subsequent validation studies." | "We therefore select M3–T3 for the validation study." (This is a decision, and the authors should own it.) |
| 2.3 | **MAJOR** | `results:131` | "A trend is observed in which error decreases with both mesh refinement and timestep reduction, indicating…" | "Error decreases with both mesh and time-step refinement, so spatial and temporal discretization contribute jointly." |
| 2.4 | MINOR | `intro:6` | "…to enable more detailed assessment of numerical behavior, including estimation of discretization error and evaluation of observed order of accuracy." | "…so that we can estimate discretization error and the observed order of accuracy." (three nominalizations in a row) |
| 2.5 | MINOR | `methods:3` | "This reduction enables direct comparison to analytical solutions and supports high-resolution studies." | "The simpler geometry can be compared directly with analytical solutions and resolved finely." |
| 2.6 | MINOR | `methods:125` | "Quantities of interest (QoIs) are defined to isolate error contributions associated with each verification study." | "Each verification study has its own quantity of interest (QoI), chosen to isolate one error source." |
| 2.7 | MINOR | `results:191` | "Computational cost was evaluated … to assess the trade-off between numerical accuracy and resource requirements." | "To weigh accuracy against cost, we recorded wall-clock time for each M–T pair on the simplified EDDS model." |
| 2.8 | MINOR | throughout | Sentences open with a bare "This" at least 25 times ("This indicates…", "This approach…", "This behavior highlights…"). | Name the referent: "This rate reduction indicates…", "The co-refinement result shows…". |

---

## Pass 3: Sentence Architecture (7 issues)

| # | Sev. | Location | Issue | Revision |
|---|---|---|---|---|
| 3.1 | **MAJOR** | Abstract, sentence 3 | "Code verification is performed using analytical benchmarks for laminar pipe flow, radial heat conduction, and transient thermal diffusion yielding observed orders of convergence of p=1.95, p=2.08, and p=2.15 (at 0.025 s) respectively." A comma is missing before "yielding", which then seems to modify "diffusion". | "Code verification against three analytical benchmarks (laminar pipe flow, radial heat conduction and transient thermal diffusion) yields observed orders of 1.95, 2.08 and 2.15 (at t = 0.025 s), respectively." |
| 3.2 | **MAJOR** | `methods:167` | One 150-word paragraph lists 7 mesh sizes and 7 time steps inline. | Put M1–M7 in a table with columns *h*, Δt, cell count, runtime and relative error. This also collects the numbers behind Figs. `meshTimestep` and `compCost`, and the text shrinks to two sentences. |
| 3.3 | **MAJOR** | `results:177` | "Multiple competing errors, which include interface interpolation, solver tolerances, and velocity-temperature coupling, prevent the interface imbalance from decreasing with mesh refinement because the interface flux depends on temperature gradients that are highly sensitive to local discretization." (51 words; the subject and verb are split by a 9-word clause.) | "The imbalance does not fall with refinement. We attribute this to error sources that do not scale with *h*: interface interpolation, linear-solver tolerance and velocity–temperature coupling. The flux also depends on temperature gradients, which are sensitive to local discretization." |
| 3.4 | **MAJOR** | `conclusion:5` | "The interface imbalance did not exhibit monotonic convergence with mesh refinement, it remained small, approximately O(10⁻⁴) of the applied heat source, thus the energy is well conserved … and that the observed convergence behavior is not associated with…" (comma splice and a dangling "that") | "Although the interface imbalance did not decrease monotonically with refinement, it stayed near 10⁻⁴ of the applied heat source; energy is conserved across the interface, and the observed convergence behavior is not an artifact of coupling error." |
| 3.5 | MINOR | `results:5` | "…the configurations are constructed to isolate fluid flow and heat conduction, **respectively**." Three configurations are paired with two items. | "…each configuration isolates one process: momentum transport, steady conduction or transient diffusion." |
| 3.6 | MINOR | `results:131` | Seven sentences of similar length (18–25 words) with no short one for emphasis, and the key claim comes last. | Open with the finding in a short sentence: "Neither spatial nor temporal refinement alone converges the solution." Then give the error range and the gradient observation. |
| 3.7 | MINOR | `methods:1`, acknowledgements | Grammar: "a users mouth cavity" → "the user's mouth". The acknowledgements say "The author" for a four-author paper, "As well as support…" is a sentence fragment, and "Sandia National laboratories" should be capitalized "Laboratories". | "The authors acknowledge support from … and mentoring from Sandia National Laboratories." |

---

## Top 5 Priority Revisions

1. **Reconcile every number across sections (5.1–5.9).** Fix the hydrodynamic p, the mesh counts for the hydrodynamic and coupled pipe models, steady vs transient in Table 1, the solver-tolerance Δt, the QoI_diff location, and the cost figures. In a verification paper these inconsistencies undercut the main claim.
2. **Freeze the vocabulary (4.1–4.5).** Use the five Table 1 case names, *h* = "representative cell size", "time step", and κ/S_E/QoI, everywhere, including captions and headings.
3. **Move the discretization data into a table (3.2, 5.10).** A single M1–M7/T1–T7 table with *h*, Δt, runtime and error would remove the longest paragraphs, show the non-monotonic runtime claim, and give the solver-tolerance study its missing evidence.
4. **Cut redundancy and self-description (1.1–1.4).** Delete the Results roadmap, condense Discussion ¶1 and ¶3, and drop most instances of *rigorous*, *consistent* and *demonstrate*. Expect roughly 10 % fewer words with no loss of content.
5. **Adopt a voice and tense rule (Pass 2).** Use "we" for decisions (the level of rigor, the choice of M3–T3), the past tense for what you did, and the present tense for what the results show. Replace a bare "This…" with a named subject.
