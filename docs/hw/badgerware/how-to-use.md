---
tags:
  - hardware
  - board
  - badgerware
  - tufty
  - blinky
  - badger
  - rp2350
---

# How to use

## Updating/Reflashing Firmware

!!! warning Firmware
    The firmware comes in two flavours:

    1. `badger-vX.X.X-micropython-with-filesystem` which will replace all the apps and software on your device with the defaults, and

    2. `badger-vX.X.X-micropython.uf2` which will replace only the firmware.

Pick your desired firmware image from the latest release for each hardware:

- [Badger Releases](https://github.com/pimoroni/badger2350/releases/latest)
- [Tufty Releases](https://github.com/pimoroni/tufty2350/releases/latest)
- [Blinky Releases](https://github.com/pimoroni/blinky2350/releases/latest)

**Procedure**

- Connect your badge to your computer with a USB Type-C to USB A cable.
- Turn your badge around so the back is facing you.
- **Press and hold the BOOT button** towards the far left.
- **Briefly tap the RESET button** to the right of BOOT.
- **A disk named "RP2350"** should appear on your computer.
- **Drag and drop the firmware .uf2** onto this disk.
- Your badge should update and reboot into the menu!

## Installing Apps

Installing apps is as simple as copying your app directory into the "apps" folder on your badge's storage.

**Procedure**

- Connect your badge to your computer with a USB Type-C to USB A cable.
- Turn your badge around so the back is facing you.
- **Double-tap the RESET button**, located toward the right on the left-hand side of the badge.
- **A disk named "Badger2350"** should appear on your computer.
- Copy your app directory into "apps".
- _Safely Unmount_ the disk from your computer. This may take a second.
- Your badge should reboot into the menu!

## Configuring WiFi

WiFi credentials are stored in the `secrets.py` file on the badge's storage. You can edit this file to add your WiFi SSID and password.

**Procedure**

- Connect your badge to your computer with a USB Type-C to USB A cable.
- Turn your badge around so the back is facing you.
- **Double-tap the RESET button**, located toward the right on the left-hand side of the badge.
- **A disk named "Badger2350"** should appear on your computer.
- **Edit the file `secrets.py`** and fill in your WiFi credentials.
- _Safely Unmount_ the disk from your computer. This may take a second.
- Your badge should reboot into the menu!

## API Documentation

For comprehensive documentation of the Badgeware API, see: [https://badgewa.re/docs](https://badgewa.re/docs)
