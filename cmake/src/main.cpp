#include <avr/io.h>
#include <util/delay.h>

int main() {
    // Set the LED pin (PB1) as an output
    DDRB |= (1 << PB1);

    while (1) {
        // Toggle the LED on
        PORTB |= (1 << PB1);
        _delay_ms(1000); // Wait for 1 second

        // Toggle the LED off
        PORTB &= ~(1 << PB1);
        _delay_ms(1000); // Wait for 1 second
    }

    return 0;
}