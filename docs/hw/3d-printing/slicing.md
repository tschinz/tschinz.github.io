---
tags:
  - hardware
  - hw
  - 3d-printing
  - slicing
  - bambu studio
---

# Slicing

This guide outlines the most critical slicing parameters in **Bambu Studio** for Bambu Lab printers like the P1S, X1C, and P1P. It provides practical recommendations to help you achieve optimal print quality, strength, and efficiency.

## Key Slicing Categories

Bambu Studio organizes slicing settings into three main categories:

- **Printer Presets**: Hardware-specific settings (e.g., build volume, nozzle size).
- **Filament Presets**: Material-specific settings (e.g., temperatures, cooling).
- **Process Presets**: Print-specific settings (e.g., layer height, infill, supports).

You can customize and save presets for each category to streamline your workflow.

## Commonly Adjusted Parameters

| **Category** | **Parameter**           | **Recommended Setting**                  | **Notes**                                                                 |
|--------------|-------------------------|------------------------------------------|---------------------------------------------------------------------------|
| Quality      | Layer Height            | 0.2 mm (standard), 0.1 mm (high detail)  | Lower values yield finer details but increase print time.                 |
| Quality      | Wall Loops              | 2–3                                      | More walls enhance strength; 1 wall may suffice for transparent prints.   |
| Strength     | [Infill Density](./filling.md) | 15% (default), 30–40% (functional parts) | Higher infill increases strength and weight.                              |
| Strength     | [Infill Pattern](./filling.md) | Grid (default), Gyroid, etc.      | Gyroid offers isotropic strength; Grid is faster but less strong in Z-axis. |
| Strength     | Top/Bottom Layers       | 4–6                                      | Ensures solid surfaces; more layers improve strength.                     |
| Speed        | Print Speed             | 50–100 mm/s                              | Balance between speed and quality; adjust based on material and model.    |
| Support      | Enable Supports         | As needed                                | Use for overhangs exceeding 45°; Tree supports for complex geometries.    |
| Support      | Support Density         | 15–25%                                   | Higher density provides better support but is harder to remove.           |
| Adhesion     | Brim                    | 5–8 lines (for small contact areas)      | Helps with bed adhesion; not always necessary.                            |
| Adhesion     | Raft                    | Use sparingly                            | Increases material usage; use for models with poor bed adhesion.          |
| Others       | Ironing                 | Enabled for top surfaces                 | Improves top layer smoothness; increases print time.                      |
| Others       | Seam Position           | Rear or Aligned                          | Controls where layer seams appear; affects aesthetics.                    |

## Recommended Presets

Bambu Studio offers several built-in process presets:

- **0.20mm Standard**: Balanced quality and speed; suitable for most prints.
- **0.10mm High Quality**: Enhanced detail; longer print times.
- **0.28mm Draft**: Faster prints; reduced detail.
- **Strength**: Increased wall loops and infill for robust parts.
- **Support**: Optimized settings for models requiring supports.

Select the preset that best matches your print's requirements.

## Tips for Optimal Results

- **Use Modifiers**: Apply different settings to specific model regions (e.g., higher infill in stress areas).
- **Preview Before Printing**: Always check the sliced model in preview mode to identify potential issues.
- **Maintain Your Printer**: Regularly calibrate and maintain your printer for consistent results.
- **Material Considerations**: Adjust settings based on filament type (e.g., PETG may require slower speeds than PLA).
- **Experiment and Iterate**: Don't hesitate to tweak settings and test to find what works best for your specific models.

## Additional Resources

- [Bambu Lab Wiki: Slicing Parameters Guide](https://wiki.bambulab.com/en/software/bambu-studio/how-to-set-slicing-parameters)
- [Bambu Lab Wiki: Slicing Parameter Table](https://wiki.bambulab.com/en/software/bambu-studio/parameter-table)
