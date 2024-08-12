// Define circuit parameters
Vin = 10;       // Input voltage (V)
Rs = 500;       // Series resistance (ohms)
Vz = 5.1;       // Zener voltage (V)
Rload = 100;    // Load resistance (ohms)
I_knee = 0;     // Knee current of zener diode (A)

// Initialize load voltage
Vload = 0;

// Calculate currents
I_Rs = (Vin - Vz) / Rs;     // Current through series resistor
I_Rl = Vz / Rload;          // Current through load
Iz = I_Rs - I_Rl;           // Current through zener diode

// Check if zener diode is conducting
if Iz < I_knee then
    // Zener is not conducting
    Iz = 0;
    Vload = Vin * Rload / (Rload + Rs);
else
    // Zener is conducting
    Vload = Vz;
end

// Convert zener current to mA for display
Iz_mA = Iz * 10^3;

// Display results
disp('Zener Current in mA:');
disp(Iz_mA);
disp('Voltage Across Load (V):');
disp(Vload);