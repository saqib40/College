// Define amplifier parameters
openLoopGain = 1000;    // Open-loop gain (A)
closedLoopGain = 10;    // Desired closed-loop gain (Af)

// Calculate exact feedback factor (β)
Beta = 1/closedLoopGain - 1/openLoopGain;

// Calculate approximate feedback factor
BetaApprox = 1/closedLoopGain;

// Display results
printf("Beta value = %f\n", Beta);
printf("Approximate value of Beta = %f\n", BetaApprox);