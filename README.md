# Comparison Project on ATTiny85: Arduino / CMake / Rust

This project serves as a comparison of three different development environments for a simple Arduino "Blink" example targeting the ATTiny85 microcontroller. The goal is to provide a base for understanding the differences in setup, compilation, and execution across Arduino, CMake, and Rust.

_⚠️ Note: The "AVR Memory Usage" dumps are provided to illustrate the overhead of each solution. They do not indicate performance, as the three frameworks differ significantly in features and capabilities._

## Project Structure 🏗️

The project is organized into three main directories, each containing a different implementation of the Blink example:

- **arduino**: Contains the Arduino sketch for the Blink example.
- **cmake**: Contains the CMake-based implementation of the Blink example.
- **rust**: Contains the Rust implementation of the Blink example.

## Setup Instructions

### Arduino 📦

1. Install the PlatformIO IDE in VSCode
2. Open the `arduino` project
3. Compile and Upload

**Result:**

```plaintext
AVR Memory Usage
----------------
Device: attiny85

Program:     582 bytes (7.1% Full)
(.text + .data + .bootloader)

Data:          9 bytes (1.8% Full)
(.data + .bss + .noinit)
```

**Result using Arduino IDE:**

```plaintext
Sketch uses 542 bytes (8%) of program storage space. Maximum is 6586 bytes.
```

---

### CMake 🧰

1. Install CMake and a suitable toolchain for the ATTiny85.
2. Navigate to the `cmake` directory.
3. Run the following commands to build the project:
   ```bash
   mkdir build
   cd build
   cmake .. -DCMAKE_TOOLCHAIN_FILE=../avr-gcc-toolchain.cmake -G Ninja
   ninja
   ```
4. Upload the resulting binary to the microcontroller. (Don't forget to unplug/plug the device.)
   ```bash
   cmake --build . --target upload
   ```
5. If you want to check the size, run
   ```bash
   cmake --build . --target size
   ```

**Result:**

```plaintext
AVR Memory Usage
----------------
Device: attiny85

Program:      96 bytes (1.2% Full)
(.text + .data + .bootloader)

Data:          0 bytes (0.0% Full)
(.data + .bss + .noinit)
```

---

### Rust 🦀

1. Install `rustup` and `cargo` and the necessary `avr-gcc` toolchain.
2. Navigate to the `rust` directory.
3. Run the following command to build the project:
   ```bash
   cargo build --release
   ```
4. Convert ELF to HEX
   ```bash
   cd target/avr-attiny85/release/
   avr-objcopy -O ihex -R .eeprom blink.elf blink.hex
   ```
5. Upload the resulting binary to the microcontroller.
   ```bash
   micronucleus --run blink.hex
   ```

**Results:**

```plaintext
AVR Memory Usage
----------------
Device: attiny85

Program:     214 bytes (2.6% Full)
(.text + .data + .bootloader)

Data:          1 bytes (0.2% Full)
(.data + .bss + .noinit)
```

## Conclusion 💡

This project provides a simple yet effective way to compare the development environments of Arduino, CMake, and Rust for microcontroller programming. Each implementation showcases the unique aspects and workflows of the respective environments.

## License 📄

This project is licensed under the [MIT License](LICENSE).

## Contact Information 📧

If you have any questions or feedback, please open an issue on GitHub.

GitHub: [TehoorMarjan](https://github.com/TehoorMarjan)
