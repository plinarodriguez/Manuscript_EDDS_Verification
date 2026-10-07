# Response to Reviewers

**Manuscript:** Verification of a Conjugate Heat Transfer Model in OpenFOAM for a Simplified Medical Device Geometry

**Journal:** ASME Journal of Verification, Validation and Uncertainty Quantification

**Manuscript ID:** VVUQ-26-1020

Each reviewer comment is quoted, followed by our response.

## Summary of revisions

We thank both reviewers for their comments. In addition to the changes made in response to specific comments, we corrected several places where the manuscript's description of the simulation setup did not match the simulations as run. These corrections bring the text into agreement with the simulation input files archived in the public reproducibility repository; no simulations were rerun and no results changed.

- Casing thickness: 0.30 mm (previously stated as 0.75 mm).
- Simplified EDDS model inlet and initial temperature: 300 K (26.85 °C) (previously stated as 20 °C).
- Material properties (Table 2): air density, specific heat capacity, thermal conductivity and dynamic viscosity, and nickel density and thermal conductivity, now match the solver inputs. The caption now explains how the air conductivity is obtained and that the steady radial conduction case used reduced solid density and specific heat to reach steady state faster, which does not affect the steady solution.
- Radial conduction heat source: 71.85 W (previously stated as 18 W), consistent with the imposed volumetric source and the casing volume.
- Fluid formulation: described as a compressible solver with a constant-density equation of state (previously described as incompressible).
- Eq. 13: a typographical error in the series solution was corrected; the analysis code already used the correct form.
- Solver tolerance study: the statement of the relative error at the tightest tolerance was corrected, since that run is the reference solution.

We also added Table 3 (resolution parameters for all studies), condensed the Results section (Reviewer 2), rewrote the Conclusion (Reviewer 1), and added a justification of the constant interface temperature assumed in the thermal-diffusion benchmark. A marked-up manuscript showing all changes relative to the submitted version is provided.

---

## Reviewer 1

> This article presents a structured and reproducible verification framework for a computational model of a simplified medical device involving conjugate heat transfer using OpenFOAM's chtMultiRegionFoam solver. Code verification is performed using analytical benchmarks for laminar pipe flow, radial heat conduction, and transient thermal diffusion, yielding observed orders of convergence of p = 1.95, p = 2.08, and p = 2.15 (at 0.025 s), respectively. Solution verification evaluates discretization error through systematic mesh and timestep refinement and regression-based extrapolation using the StREEQ method. Results show that spatial and temporal discretization errors in transient coupled simulations interact and cannot be assessed independently. Co-refinement is required to capture true convergence behavior, while independent refinement yields polluted convergence rates. Computational cost analysis demonstrates diminishing returns with refinement and highlights that runtime does not vary monotonically with discretization parameters due to solver convergence behavior.
>
> The contents of the paper are excellent and contain new ideas. In any case, I would like to see the following modifications, whether minor or major, in the revised version to strengthen the paper, broaden its potential readership, and enhance the current work.

### Comment 1.1

> Provide a system description and operating conditions.

A system description and operating conditions are provided in Section 2.2, "System Description & Operating Conditions." This section describes the generalized pipe configuration, geometry, heating conditions, inlet velocity and temperature, and hydrodynamic and thermal entry-length considerations.

### Comment 1.2

> Provide a schematic of the generalized pipe configuration used across all verification studies.

A schematic of the generalized pipe configuration used across the verification studies is provided in Figure 1. The schematic identifies the pipe inlet, pipe case, pipe outlet, solid casing, and quantities-of-interest locations. Additionally, Table 1 provides the quantities to build the geometry for each verification study.

### Comment 1.3

> The governing equations and numerical approach should be given in detail.

The governing equations and numerical approach are provided in Section 2.3, "Governing Equations & Numerical Approach." This section describes the fluid and solid governing equations, conjugate coupling at the fluid-solid interface, and finite-volume discretization used in OpenFOAM.

### Comment 1.4

> The solver configuration may be useful to discuss.

Solver details are provided under "Solver Configuration" in Section 2.3, including the segregated solution strategy and PIMPLE pressure-velocity coupling. The parallel implementation is also described immediately thereafter. Additionally, a more detailed solver configuration can be found in the reproducibility GitHub repository:
<https://github.com/plinarodriguez/edds_verification_repo>

### Comment 1.5

> Show the numerical solution and an analytical parabolic profile.

The numerical and analytical Hagen–Poiseuille velocity profiles are presented in Figure 2, providing a direct comparison of the numerical solution with the analytical parabolic profile.

### Comment 1.6

> Cite the references: (https://doi.org/10.1088/1402-4896/ac0867), (https://doi.org/10.1108/HFF-07-2016-0278), (https://doi.org/10.1108/HFF-10-2017-0394), and (10.1615/JPorMedia.2019028970).

We thank the reviewer for these suggestions. We read the references carefully. They address Tikhonov regularization of an inverse source problem for a time-fractional (Atangana–Baleanu–Caputo) diffusion equation; a reproducing-kernel algorithm for time-fractional partial differential equations with Robin boundary conditions; a reproducing-kernel method for time-fractional forms of the Tricomi and Keldysh equations, mixed elliptic–hyperbolic equations that model transonic flow; and a reproducing-kernel algorithm for time-fractional diffusion-wave, telegraph, Cattaneo, and Klein–Gordon-type equations in porous media with Dirichlet boundary conditions. Our manuscript involves no inverse problem, regularization or fractional-order operator, no reproducing-kernel methods, no Robin boundary conditions, and no porous media. Our manuscript concerns the verification of an existing finite-volume solver for integer-order conservation equations governing low-speed laminar flow and conjugate heat transfer. Although several of the references compare numerical and exact solutions, they do so to establish the accuracy of a new numerical method, whereas our comparisons serve code verification in the sense of ASME V&V 20, for which we cite the standard verification literature (Roache; Oberkampf and Roy). We could not identify a place in the manuscript where these citations would inform the reader, and we have therefore not added them.

### Comment 1.7

> The listed results, especially formulas, tables, figures, and analyses, should be revised to avoid any errors.

The equations, tables, figures, and associated analyses were reviewed for consistency and accuracy. In addition, Table 3 has been added to provide a consolidated summary of the spatial and temporal resolutions used across the verification studies, including the co-refined and decoupled resolution studies. We also corrected several places where the description of the simulation setup did not match the simulations as run; these corrections are listed in the Summary of revisions above.

### Comment 1.8

> English is generally excellent; it needs polishing, and some typos must be revised. Further punctuation marks should be checked throughout the paper, especially after the equations and at the end of the statements.

The manuscript was reviewed and revised for grammar, typographical errors, and punctuation. Punctuation was added after equations and at the ends of statements where appropriate.

### Comment 1.9

> Define the symbols used clearly and enumerate all the existing equations. Furthermore, the keywords and conclusion should be reformulated to reflect the paper's content accurately.

The notation and equation presentation were reviewed and revised for consistency. Symbols were clarified and standardized, including $\kappa$, $S_E$, $R$, and the quantities of interest (QoIs). All displayed equations are now numbered, including the interface energy imbalance in Section 3.3. The keywords were updated to include more verification-specific terms. The Conclusion was also revised to more accurately reflect the paper's content, including the three code-verification cases and their observed orders of convergence.

### Comment 1.10

> Report the material properties used in simulations.

The thermophysical properties used in the simulations are reported in Table 2, including density, specific heat capacity, thermal conductivity, and viscosity for air and nickel. Table 2 was corrected to be consistent with the simulation inputs: for air, the density, specific heat capacity, thermal conductivity, and dynamic viscosity (from $1.48\times10^{-5}$ to $1.8\times10^{-5}$ Pa$\cdot$s); for nickel, the density and thermal conductivity. The caption states how the air thermal conductivity is obtained and that the steady radial conduction case used reduced solid density and specific heat to reach steady state faster, which does not affect the steady solution.

### Comment 1.11

> The following needs more details: Conjugate heat transfer. Fluid dynamics.

Details regarding conjugate heat transfer and fluid dynamics are provided in Sections 2.2 and 2.3. Section 2.3 describes the laminar fluid formulation using a compressible solver with a constant density equation of state, the governing conservation equations, solid heat conduction, and enforcement of temperature and heat-flux continuity at the fluid–solid interface. Boundary and initial conditions for the fluid–thermal configurations are also provided in Section 2.3, and Section 3.3 assesses heat-flux continuity at the fluid–solid interface in the coupled simulations.

### Comment 1.12

> Tabulate the geometry quantities for the code and solution verification studies.

Table 1 has been expanded to provide a comprehensive summary of the geometric quantities for all code and solution verification studies. The table reports the total pipe length and the applicable inlet, case, and outlet lengths for each study, together with the common pipe diameter and case thickness. The case thickness was also corrected to 0.30 mm (previously stated as 0.75 mm), consistent with the simulation geometry.

---

## Reviewer 2

> This paper is extremely comprehensive and well written. There is a little bit of repetativeness in the results section, where the methods do not necessarily need to be repeated, but that is a very minor issue.

### Comment 2.1

Thank you for this comment. The Results section was revised to reduce repetition of methodological details already provided in the Methods section. In particular, repeated descriptions of the code-verification configurations, solver tolerance setup, and mesh and time step refinement pairings were removed or condensed. These study configurations and resolution parameters are now summarized in Table 3, allowing the Results section to focus more directly on the verification results and observed convergence behavior.
