---
tags:
  - hardware
  - hw
  - 3d-printing
  - filaments
---

# Filaments
Each material has unique properties, print requirements, and ideal use cases. Choosing the right filament depends on the desired strength, flexibility, heat/UV resistance, and the printing difficulty you’re prepared to handle. Below we a list of the common materials – `PLA`, `PETG`, `PC`, `ASA`, `ABS`, `TPU`, and `Nylon` – and compare their characteristics.

## Summary

| Material     | Heat Resistance   | UV Resistance                             | Print Difficulty                         | Use Cases                                                   | Nozzle Temp     | Bed Temp       | Humidity (%)                            | Tensile Strength (MPa)  | Flexibility / Impact Strength (kJ/m²) |
|--------------|-------------------|-------------------------------------------|------------------------------------------|-------------------------------------------------------------|-----------------|----------------|-----------------------------------------|-------------------------|---------------------------------------|
| **PLA**      | $\sim 50–60 °C$   | Poor (degrades in sun)                    | Easiest                                  | Visual prototypes, toys, cases (not for high heat)          | $190–220 °C$    | $0–60 °C$      |  <50% (drying optional, absorbs slowly) | $\sim 60 MPa$           | Low                                   |
| **PETG**     | $\sim 75 °C$      | Fair (better than PLA, can discolor)      | Easy/Medium (stringing)                  | Functional parts, containers, moderately stressed parts     | $220–250 °C$    | $60–80 °C$     |  <40% (drying recommended)              | $\sim 50 MPa$           | Medium – better XY than PLA           |
| **ABS**      | $\sim 100 °C$     | Poor (UV causes brittleness)              | Hard (needs enclosure, warps)            | Durable parts, automotive interior, tool housings           | $230–250 °C$    | $95–110 °C$    |  <50% (drying optional)                 | $\sim 35–40 MPa$        | Medium – good in XY, weak in Z        |
| **ASA**      | $\sim 100 °C$     | Excellent (UV stable)                     | Hard (enclosure, less warp than ABS)     | Outdoor parts, automotive, functional prototypes            | $240–260 °C$    | $90–110 °C$    |  <40-50% (drying optional)              | $\sim 30–45 MPa$        | High – tough, XY > ABS                |
| **PC**       | $\sim 115–130 °C$ | Moderate (can yellow with UV)             | Very Hard (high temp, warps, dry needed) | High-strength parts, high-temp jigs, engineering prototypes | $260–310 °C$    | $90–110 °C$    |  <20% (drying requried)                 | $\sim 70 MPa$           | Very High – extremely tough           |
| **Nylon**    | $\sim 100 °C$     | Poor–Fair (UV-degrades unless stabilized) | Very Hard (must stay dry, warps)         | Gears, hinges, wear parts, high-strength functional parts   | $240–270 °C$    | $60–90 °C$     |  <15% (drying requried)                 | $\sim 50 MPa$           | High – tough & ductile                |
| **TPU (95A)**| $\sim 60–80 °C$   | Varies (most not UV-stable)               | Medium (slow feed, stringy)              | Flexible parts: seals, bumpers, phone cases, belts          | $210–240 °C$    | $30–60 °C$     |  <30% (drying recommended)              | $\sim 25 MPa$           | Very High (rubbery, won’t break)      |


## `PLA` (Polylactic Acid)

`PLA` is the most popular beginner filament. It’s **easy to print** and made from corn starch or sugarcane, making it relatively eco-friendly (biodegradable under industrial composting). It prints at low temperatures without needing a heated enclosure. `PLA` offers high rigidity and tensile strength (around $50–65MPa$), so parts can be quite strong in a static sense. However, `PLA` is **brittle** and has **poor impact resistance** – it tends to **crack or shatter under shock or flexing**. It also has **low heat resistance**, deforming around $\sim 60°C$. `PLA` is **not suitable for high-heat or long-term outdoor** use: it will soften in a hot car and embrittle with UV exposure.

- **Print temp:** $\sim 200°C$ (typically $190–220°C$).
- **Bed temp:** $\sim 50–60°C$ (some use an unheated bed with tape or glue).
- **Difficulty*:** Very easy – excellent flow and low warp, `PLA` is often “plug and play”. Bed adhesion is generally good on textured or glue-coated beds. Watch out for stringing on higher temps or cheap `PLA`.
- **Use cases:** Great for prototypes, cosmetic models, toys, and basic household parts. Ideal when you need good dimensional accuracy and a nice surface finish, but not for parts under stress or high temperature.

## `PETG` (Polyethylene Terephthalate Glycol)

`PETG` is a popular **all-rounder** that offers a balance between `PLA` and `ABS`. It’s less brittle than `PLA` and more ductile – `PETG` parts can flex more before breaking. Tensile strength is comparable to `PLA` (around 40–55 MPa), but impact strength is slightly better (`PETG` can absorb a bit more energy before fracturing). `PETG` has higher heat resistance than `PLA` ($\sim 70–80°C$ before softening). It’s also generally hydrophobic and chemically resistant (doesn’t absorb much moisture, and resists acids/alkalis better than `PLA`).

- **Print temp:** $\sim 230°C$ (usually in $220–250°C$ range).
- **Bed temp:** $\sim 70°C$ ($60–85°C$ range). A **heated bed is recommended** to prevent warping. `PETG` can fuse strongly to bare PEI bed sheets, so **using a layer of glue stick** as a release agent is common.
- **Difficulty*:** Moderate-Easy. `PETG` prints with **low warp** (no enclosure needed) and decent layer adhesion, but it is more stringy than `PLA`. **Print slower and with reduced fan** (e.g. 30–50%) to avoid stringing and ensure layer bonding.
- **Use cases:** Functional parts that need some toughness and heat resistance. `PETG` is great for mechanical prints, brackets, containers, and outdoor parts that `PLA` couldn’t handle. It’s often used when `PLA` is too brittle but `ABS` is too troublesome – `PETG` gives good strength without requiring an enclosure.

## `PC` (Polycarbonate)

Polycarbonate is an advanced engineering filament known for its **high strength and thermal stability**. `PC` has one of the **highest tensile strengths** (~70+ MPa) among common filaments and very **high impact toughness **– `PC` is the material used in bullet-resistant glass and safety goggles. 3D printed `PC` parts tend to be **extremely tough and heat-resistant** (glass transition $\sim 150°C$, can handle 110°C$+ without deforming). `PC` is also somewhat flexible before breaking, giving it good impact performance (though in some 3D printing tests, `PC` impact strength in XY wasn’t as high as expected, possibly due to print conditions).

- **Print temp:** $\sim 270°C$ (typically 260–310°C$). `PC` needs high extrusion temperatures to bond layers. A **hardened steel nozzle** is recommended for higher temps (and required if using glass/carbon fiber `PC` blends).
- **Bed temp:** $\sim 100°C$ (80–120°C$). An enclosure is strongly recommended – `PC` **warps significantly as it cools**. The P1S’s enclosed build chamber will help, but large `PC` prints may still be challenging. Bed adhesion can be aided by a `PC`-specific **adhesive or using a textured PEI plate**.
- **Difficulty*:** Hard. `PC` is one of the **most difficult materials** to print. It **warps and delaminates if not kept hot**; it also **absorbs moisture quickly** (dry it before use). Expect trial and error to get good `PC` prints. The AMS can handle `PC` filament, but ensure it’s in a dry box to avoid moisture issues.
- **Use cases:** High-strength, high-heat parts. Use `PC` for functional prototypes, brackets, RC/drone parts, light-duty engine bay parts, or enclosures that might see temperature or impact that would shatter `PLA`/`ABS`. `PC` is overkill for casual prints, but shines in demanding engineering applications. (Note: `PC` is not UV-stable on its own – it can yellow or embrittle under UV unless it’s a UV-stabilized blend.)

## `ASA` (Acrylonitrile Styrene Acrylate)

`ASA` was developed as a **UV-resistant** alternative to `ABS`. It has mechanical properties similar to `ABS` – moderate-high tensile strength ($\sim 30–45MPa$, similar to `ABS`) and good impact resistance – but its key advantage is **excellent weather resistance**. `ASA` can handle prolonged UV exposure without significant degradation, making it ideal for outdoor parts. In terms of strength, `ASA` is often slightly tougher than standard `ABS` (Prusa’s tests showed `ASA` to be “by far the most tough” among `PLA`, `PETG`, and `ASA`). However, like `ABS`, `ASA`’s **layer adhesion can be its weak point** if printing conditions are poor – impact strength in the Z direction is lower, so enclose and cool slowly for strong parts. `ASA`’s heat resistance is also high ($\sim 100°C$, similar to `ABS`; it can even withstand near-boiling temperatures without losing integrity).

- **Print temp:** $\sim 245°C$ (typically 240–260°C$).
- **Bed temp:** $\sim 100°C$ (90–110°C$). An **enclosure is required** for `ASA`, just as for `ABS` – it prevents warping and cracking.
- **Difficulty*:** Moderate-Hard. `ASA` prints very much like `ABS`: it can **warp and emit fumes** (though `ASA`’s odor is a bit less acrid than `ABS`). Good bed adhesion (use `ABS`/`ASA` slurry or glue stick on PEI) and minimal cooling (often 0–20% fan) are needed to prevent cracks. Expect some trial and error, but `ASA` is slightly less warpy than `ABS` in practice (better dimensional stability).
- **Use cases:** Outdoor and automotive parts. `ASA`’s UV and weather resistance make it perfect for garden fixtures, outdoor enclosures, automotive trim/clips, drone parts etc. It’s also used for functional prototypes that need strength and durability similar to `ABS`, with the bonus of surviving sunlight.

## `ABS` (Acrylonitrile Butadiene Styrene)

`ABS` is a classic engineering plastic, known for being used in LEGO bricks and many consumer products. It offers **good impact resistance and durability** – `ABS` parts can withstand drops and wear better than `PLA` (`ABS` is not as brittle). Its tensile strength is around $30–40 MPa$, a bit lower than `PLA`’s, but `ABS` stays much more impact-tough across a range of temperatures. Critically, `ABS` has a high heat resistance (softening around $\sim 95–105°C$), so it won’t deform in a hot car or under load until much higher temps than `PLA`/`PETG`. The downsides: `ABS` is tricky to print (it warps and shrinks when cooling) and produces noxious fumes (styrene odor). It absolutely requires an enclosure and ventilation.

- **Print temp:** $\sim 240°C$ (220–250°C$ typical).
- **Bed temp:** $\sim 100°C$. A **heated bed and chamber are needed to prevent warping**. Use an enclosure (the P1S built-in panels help, though it’s not a heated chamber, it retains some heat). **Keeping the chamber $\sim 45°C$ or warmer greatly improves layer adhesion**.
- **Difficulty*:** Hard. `ABS` can be frustrating: it tends to curl off the bed or crack between layers if cooled too fast. Bed adhesion tricks (`ABS` juice, Kapton tape, brim) are often needed. Minimal part cooling is recommended (0–20%). The AMS can feed `ABS`, but ensure the filament isn’t exposed to cool drafts. Also, the fumes mean you should operate in a well-ventilated area or use a filtration system.
- **Use cases:** Durable functional parts, prototyping, automotive. `ABS` is chosen for tool housings, machine parts, clips, electrical enclosures – anything that needs to take some abuse and maybe a bit of heat. If you plan to sand, acetone-vapor smooth, or solvent-weld parts, `ABS` is great (**it dissolves in acetone, allowing post-processing**). For purely outdoor use, `ASA` is generally preferred over `ABS` (due to `ASA`’s UV resistance), but `ABS` is fine for indoor functional prints.

## `TPU` (Thermoplastic Polyurethane) – Flexible Filament

`TPU` is a **flexible, rubber-like** filament. It comes in different hardness levels (e.g. Shore 95A, 90A, 85A, etc. – lower number = softer). `TPU` has lower tensile strength (often $\sim 20–30 MPa$, depending on formulation) but extremely high elongation at break (300–500+%). In other words, it’s **not used for rigidity or strength**, but for **elasticity and impact absorption**. `TPU` parts can bend or stretch dramatically without breaking, giving them effectively very high impact toughness (they don’t shatter, they deform). `TPU` also has good abrasion resistance and tear strength, especially in higher durometer blends. Heat resistance varies by `TPU` blend but is typically around 80°C$ (they’ll get soft and rubbery beyond that).

- **Print temp:** $\sim 230°C$ ($210–250°C$ depending on brand/hardness). Softer `TPU`s (e.g. 85A) might print better a bit cooler/slower to reduce stringing.
- **Bed temp:** $\sim 50°C$ (often $40–60°C$). Some `TPU`s print fine on unheated beds, but a bit of warmth helps adhesion.
- **Difficulty*:** Moderate. `TPU` can be challenging to feed – it’s soft, so it may buckle in the extruder if print settings aren’t tuned. The Bambu Lab’s direct-drive extruder is a big help (direct-drive handles flexibles better than Bowden setups). To succeed with `TPU`: print slow (e.g. 30–60 mm/s), with low retraction (2 mm or less) and minimal part cooling (`TPU` sticks better layer to layer with little fan). Watch for stringing and oozing; you may need to enable coasting or wipe in slicer settings. Once tuned, `TPU` prints can be very reliable.
- **Use cases:** Flexible parts: phone cases, drone bumpers, gaskets, seals, vibration dampeners, drive belts, tires (for RC cars), and any application where you need rubber-like properties. `TPU`’s ability to absorb impact makes it great for protective components. Just remember that soft `TPU` parts won’t hold heavy loads (they’ll flex). Also, flexible filaments can be used for snug-fit enclosures (like snap-on covers) because they can stretch over a part and then hold it tightly.

## `Nylon` (Polyamide, e.g. PA6, PA12)

`Nylon` is an engineering-grade filament known for its **toughness, flexibility, and wear resistanc**e. It has a wide range of formulations; generally, `Nylon`’s tensile strength is in the $40–70 MPa$ range (so it can be quite strong, especially `Nylon` 6 which can reach the high end). But more impressive is `Nylon`’s impact strength and fatigue resistance – it can absorb a lot of energy and **resist cyclic stress without cracking**. `Nylon` parts are semi-flexible (especially thinner sections), which means they tend to bend rather than snap (one source notes “`Nylon` will take a lot more abuse than `ABS`”). `Nylon` is also self-lubricating and great for low-friction applications (gears, bushings). Its heat resistance is good ($\sim  ≈100°C$ or more depending on type). Importantly, most `Nylon` filaments are hygroscopic – they absorb moisture from the air rapidly, which can ruin print quality (wet `Nylon` pops and foams during printing).

- **Print temp:** $\sim 250°C$ (generally $240–270°C$). Higher-end nylons (like PA 6) prefer the upper end ($\sim 260+°C$).
- **Bed temp:** $\sim 70°C$ ($60–90°C$). An enclosure is recommended because `Nylon` can warp (less than `ABS`, but still). Some nylons (especially PA 6) shrink significantly; others like `Nylon` 12 warp less. Use bed adhesives (glue or specific sheets) because `Nylon` doesn’t stick well to bare PEI – Garolite or PA-friendly bed surfaces work best.
- **Difficulty:** Hard. `Nylon` **demands careful handling: keep it dry** (ideally print from a dry box or the AMS with filament dryer). It will warp, though often a bit less violently than `ABS`. Layer bonding can be excellent if printed hot enough and kept warm, but if your environment is cool the parts may split. Additionally, dimensional accuracy can suffer (`Nylon` can shrink 1–2% upon cooling). The P1S can print `Nylon`, especially with the AMS Pro’s humidity control, but be prepared to tweak settings.
- **Use cases:** Functional mechanical parts needing toughness or low friction. Examples: gears, hinges, bushings, pulley wheels, tool handles, structural brackets. `Nylon`’s wear resistance makes it great for parts with sliding contact. It’s also a choice for living hinges or snap-fit parts that must flex repeatedly (though `Nylon`’s flexibility means it’s not as stiff as `PLA`/`ABS`, so it’s not for every application). For any load-bearing part in a tough environment (vibration, impacts, moderate heat), `Nylon` is often a top choice – if you can print it properly.
