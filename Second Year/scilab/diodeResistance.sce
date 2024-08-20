// Define diode parameters
Is = 10^-12;        // Reverse saturation current in amperes
I_fwd = 2*10^-3;    // Forward current in amperes
V_T = 26*10^-3;     // Thermal voltage in volts (at room temperature)
eta = 2;            // Ideality factor (1 for ideal diode, typically 1-2 for real diodes)

// Calculate diode voltage using the diode equation
V_d = log(I_fwd/Is + 1) * eta * V_T;

// Calculate static resistance
R_static = V_d / I_fwd;
disp("Static resistance is ", R_static);

// Calculate dynamic resistance
R_dynamic = eta * V_T / (I_fwd + Is);
disp("Dynamic resistance is ", R_dynamic);