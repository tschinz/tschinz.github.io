---
tags:
  - hardware
  - hw
  - 3d-printing
  - joins
  - tolerances
---

# Joins and Tolerances

These informations of the Bambu Lab P1S @ 0.2 mm, mostly PLA/PETG materials.

## General Tolerance Guidelines

| Fit Type         | Clearance (total gap) | Notes |
|------------------|----------------------|-------|
| **Press Fit**    | 0–0.15 mm             | Tight, permanent. PETG ~0.15 mm; PLA can go tighter. Chamfer edges. |
| **Slip Fit**     | 0.2–0.3 mm            | Snug sliding fit. PETG prefers upper end. |
| **Loose Fit**    | 0.4–0.6 mm            | Easy assembly, some play. |

PLA prints crisper and holds tighter fits; PETG needs slightly more clearance (stringing, flex).

## Common Joints

### Press Fit
- **Use:** Pegs, bearings, rods.
- **Tips:** 0–0.15 mm gap. Chamfer edges to ease insertion. PETG flexes; PLA can crack if forced.

### Slip Fit
- **Use:** Hinges, sliders, rotating parts.
- **Tips:** 0.2–0.3 mm gap. Clean surfaces. Print moving faces vertical for smoother slide.

### Snap Fit
- **Use:** Clips, latches.
- **Tips:** PETG preferred. Clearance ~0.5 mm between engaging surfaces. Fillet snap base. Print snap arms lying flat (stronger).

### Living Hinge
- **Use:** Flip lids, wallets, integrated hinges.
- **Tips:** PETG better than PLA. Hinge ~0.5–0.8 mm thick. Print hinge **vertically** for max durability. Expect limited cycles.

### Dovetail / Slide Fit
- **Use:** Modular parts, adjustable joints.
- **Tips:** 0.2–0.4 mm per side. Chamfer entry. Print sliding faces vertical for smoothness.

### Threads
- **Printed Threads:** Use for large sizes (M6+). Add ~0.2 mm radial clearance. PLA crisp but brittle; PETG more durable.
- **Inserts/Nuts:** Use heat-set inserts or captured nuts for strength. Follow insert datasheet for hole size.

## Calibration & Testing

- **Tolerance Test Models:** Print clearance test blocks in your filament (0.1–0.6 mm steps).
- **First Layer:** Use 0.2 mm chamfer to counteract elephant foot.
- **Orientation:** Moving/sliding faces → print vertical. Snap arms → print lying flat.

## Summary

- Start with **0.2 mm clearance** for general fits.
- PETG: ** +0.05–0.1 mm vs PLA** for same joint.
- Always test small before committing to large assemblies!
