
# Define the toolchain for AVR
find_program(AVR_CC avr-gcc REQUIRED)
find_program(AVR_CXX avr-g++ REQUIRED)
find_program(AVR_OBJCOPY avr-objcopy REQUIRED)
find_program(AVR_SIZE_TOOL avr-size REQUIRED)
find_program(AVR_OBJDUMP avr-objdump REQUIRED)
find_program(AVR_AR avr-ar REQUIRED)
find_program(AVR_RANLIB avr-ranlib REQUIRED)
find_program(AVR_UPLOADTOOL micronucleus REQUIRED)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avr)

# Specify the cross compiler
set(CMAKE_C_COMPILER ${AVR_CC})
set(CMAKE_CXX_COMPILER ${AVR_CXX})

# Specify the archiver
set(CMAKE_AR ${AVR_AR})
set(CMAKE_RANLIB ${AVR_RANLIB})

# Specify the size tool
set(CMAKE_SIZE ${AVR_SIZE_TOOL})

# Specify the objcopy tool
set(CMAKE_OBJCOPY ${AVR_OBJCOPY})
set(CMAKE_OBJDUMP ${AVR_OBJDUMP})
