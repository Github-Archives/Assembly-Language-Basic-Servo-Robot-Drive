# Assembly-Language-Basic-Servo-Robot-Drive
Assembly-Language-Blinking-LED Assembly Language for the PIC 16F628 Microcontroller

Assembly Language for the PIC 16F628 Microcontroller using the MPLAB-X IDE with PICkit software for burning the code into the microcontroller chip.

When hooked up to a breadboard properly this code will allow you to connect a servo motor to both PORTA(Right-Wheel) and PORTB(Left-Wheel) which will in turn make the robot propell forward. 

In order for the left-wheel to spin forward at 100% it must receive a Pulse-Width-Modulated (square wave) signal which is ON for 20ms and then OFF for 1.7ms repeatedly.

In order for the right-wheel to spin forward at 100% it must receive a Pulse-Width-Modulated (square wave) signal which is OFF for 20ms and then ON for 1.3ms repeatedly.

A series of interconnected delay loops have been created to slow the high frequency of the microcontrollers Pin outputs to an acceptable frequency in order to control the Pulse-Width-Modulation trigger output signals to the servo motors.
