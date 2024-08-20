// Define circuit parameters
Vcc = 18;           // Supply voltage (V)
R1 = 100*1e3;       // Voltage divider resistor 1 (Ω)
R2 = 47*1e3;        // Voltage divider resistor 2 (Ω)
RC = 5.6*1e3;       // Collector resistor (Ω)
RE = 0.6*1e3;       // Emitter resistor (Ω)
Rs = 500;           // Source resistance (Ω)
RL = 1*10^3;        // Load resistance (Ω)
Vs = 10*10^-3;      // Input source voltage (V)
r_pi = 10^3;        // Transistor base-emitter resistance (Ω)
gm = 36.5*1e-3;     // Transistor transconductance (S)

// Calculate effective load resistance (RC parallel with RL)
RCParRL = 1 / (1/RC + 1/RL);

// Calculate voltage gain
Av = -gm * RCParRL;

// Calculate input impedance
Zin = 1 / (1/r_pi + 1/R1 + 1/R2);

// Calculate voltage input to the amplifier (after voltage division)
Vi = Vs * Zin / (Zin + Rs);

// Calculate output voltage
Vo = Av * Vi;

// Display results
printf("The voltage gain is %f \n", Av);
printf("The output voltage for an input voltage of peak 10mV is %f volts\n", Vo);