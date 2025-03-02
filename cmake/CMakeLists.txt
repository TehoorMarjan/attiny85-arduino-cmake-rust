cmake_minimum_required(VERSION 3.10)

project(BlinkCompare)

set(CMAKE_CXX_STANDARD 11)

# Specify the target microcontroller
set(MCU "attiny85")

# Specify the target microcontroller frequency
set(F_CPU 16500000UL)

# Add any necessary flags for the ATTiny85
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mmcu=${MCU} -Os")

# Include the source files
add_executable(blink src/main.cpp)

# Define F_CPU through CPPFLAGS
target_compile_definitions(blink PRIVATE F_CPU=${F_CPU})

# Add a custom target to upload the binary to the MCU using micronucleus
add_custom_target(
    upload
    ${AVR_UPLOADTOOL} --run blink.hex
    DEPENDS blink.hex
    COMMENT "Uploading blink.hex to ${MCU} using ${AVR_UPLOADTOOL}"
    USES_TERMINAL
)

# Add a post-build command to generate the .hex file
add_custom_command(TARGET blink POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O ihex -R .eeprom blink blink.hex
    COMMENT "Generating hex file"
)

# Add custom target to get the size of the binary
add_custom_target(size
    COMMAND ${AVR_SIZE_TOOL} --mcu=${MCU} -C blink
    DEPENDS blink
    COMMENT "Getting the size of the binary"
)