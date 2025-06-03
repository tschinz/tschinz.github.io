---
tags:
  - hardware
  - hw
  - 3d-printing
  - filling
---

# Structure Filling Patterns (Sparse infill patterns)

Sparse infill is the internal structure of a 3D print that balances strength, weight, flexibility, and print time. The Bambu Lab P1S (with Bambu Studio) supports a wide variety of **infill patterns**, each optimized for different needs.

## Summary
| Image                                                               | Pattern                 | Advantages                        | Disadvantages                 | Common Use Cases                   |
|---------------------------------------------------------------------|-------------------------|-----------------------------------|-------------------------------|------------------------------------|
| ![gyroid](img/filling/filling-gyroid.png)                           | **Gyroid**              | Isotropic, efficient, fast        | Slightly less rigid than grid | General-purpose, flexible parts    |
| ![3d-honeycomb](img/filling/filling-3d-honeycomb.png)               | **3D Honeycomb**        | Very strong in X/Y/Z, aesthetic   | Slower, more material         | Strong functional parts            |
| ![honeycomb](img/filling/filling-honeycomb.png)                     | **Honeycomb**           | Very rigid, classic               | High material usage           | Functional parts needing stiffness |
| ![tri-hexagon](img/filling/filling-tri-hexagon.png)                 | **Tri-Hexagon**         | One of the strongest patterns     | Slower, high material use     | Functional load-bearing parts      |
| ![grid](img/filling/filling-grid.png)                               | **Grid**                | Fast, simple, rigid in XY         | Less strength in Z            | Default for prototypes             |
| ![rectilinear](img/filling/filling-rectilinear.png)                 | **Rectilinear**         | Fast, predictable                 | Weaker diagonally             | General prints, prototypes         |
| ![line](img/filling/filling-line.png)                               | **Line**                | Fastest, minimal filament         | Weak in Z, anisotropic        | Drafts, quick prints               |
| ![cross-zag](img/filling/filling-cross-zag.png)                     | **Cross Zag**           | Balanced strength, easy removal   | Slightly slower               | General-purpose prints             |
| ![lighting](img/filling/filling-lightning.png)                      | **Lighting**            | Very low material use for support | For support only              | Support structures                 |
| ![adaptive-cubic](img/filling/filling-adaptive-cubic.png)           | **Adaptive Cubic**      | Variable density, efficient       | May create uneven strength    | Large parts, optimized infill      |
| ![crosshatch](img/filling/filling-crosshatch.png)                   | **Crosshatch**          | Strong, rigid                     | Harder to remove              | Structural parts, supports         |
| ![cubic](img/filling/filling-cubic.png)                             | **Cubic**               | Isotropic strength                | Slightly more complex         | Mechanical parts                   |
| ![support-cubic](img/filling/filling-support-cubic.png)             | **Support Cubic**       | Minimal support material          | For support only              | Support structures                 |
| ![triangles](img/filling/filling-triangles.png)                     | **Triangles**           | Very rigid in-plane               | Brittle under shear           | Brackets, flat parts               |
| ![aligend-rectilinear](img/filling/filling-aligned-rectilinear.png) | **Aligned Rectilinear** | Easy print, consistent direction  | Weaker in cross axis          | Simple geometries                  |
| ![zigzig](img/filling/filling-zig-zig.png)                          | **Zigzig**              | Fast, similar to line             | Weak, decorative              | Drafts, aesthetic lines            |
| ![concentric](img/filling/filling-concentric.png)                   | **Concentric**          | Good flexibility, follows shape   | Weak structural strength      | TPU/flexible prints                |
| ![archimedes-chord](img/filling/filling-archimedes-chord.png)       | **Archimedes Chord**    | Aesthetic spiral                  | Not optimized for strength    | Decorative objects                 |
| ![octragram-spiral](img/filling/filling-octragram-spiral.png)       | **Octagram Spiral**     | Decorative, aesthetic             | Not structural                | Art, vases                         |
| ![hilbert-curce](img/filling/filling-hilbert-curve.png)             | **Hilbert Curve**       | Continuous line, aesthetic        | Not strong, slow              | Art pieces, visual infill          |

## Sparse Infill Percentages

The **infill percentage** sets how dense the internal structure is, balancing strength, weight, print time, and flexibility.

**Typical guidelines:**

| Infill %             | Usage                                           |
|----------------------|-------------------------------------------------|
| **0–5%**             | Hollow parts, vases, pure decoration             |
| **~15%** *(default)* | Good balance for most prints, prototypes, enclosures |
| **20–40%**           | Functional parts, added rigidity                 |
| **50%**              | Rarely needed — for very strong or load-bearing parts |
| **100%**             | Maximum strength, solid parts (threads, inserts, machining) |

**Notes:**

- **15% is a great default** — works for ~80% of prints.
- **More than 50%** is **rarely necessary** — increases weight & time significantly.
- **100%** only for parts needing **maximum rigidity**, **post-processing (tapping threads)**, or **machining**.
- **Gyroid / Cubic** patterns are especially efficient at 15–25%.
