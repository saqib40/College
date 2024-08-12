// Define the peak-to-peak current in amperes
Ipeak2peak = 50*10^(-3);

// Calculate the peak value (amplitude) of the current
Ipeak = Ipeak2peak/2;

// Create a time vector from 0.005 to 1 second with 0.005 second steps
t = 0.005: 0.005: 1;

// Generate the sinusoidal current waveform
I = Ipeak*sin(2*%pi*10*t);

// Calculate the RMS value using numerical method
Irms = sqrt(sum(I.^2)/length(I));

// Display the calculated RMS value
disp("The RMS value of current is ", Irms)

// Calculate and display the RMS value using the analytical formula
disp("The RMS value by formula is ", Ipeak/sqrt(2));

// Plot the current waveform
plot(I)