#![no_std]
#![no_main]

use attiny_hal::prelude::*;
use attiny_hal::delay::Delay;
use attiny_hal::clock::MHz16;
use attiny_hal::pac;
use panic_halt as _;

#[attiny_hal::entry]
fn main() -> ! {
    let dp = pac::Peripherals::take().unwrap();
    let pins = attiny_hal::Pins::new(dp.PORTB);

    // Set PB1 as output (physical pin 6 on the ATtiny85)
    let mut led = pins.pb1.into_output();

    // Create a delay with the specific clock frequency
    let mut delay = Delay::<MHz16>::new();

    loop {
        // Toggle the LED on
        led.set_high();
        delay.delay_ms(1000u16);

        // Toggle the LED off
        led.set_low();
        delay.delay_ms(1000u16);
    }
}