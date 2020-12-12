clear all;
close all;

%% Theoritical curve
SNR_R = [0:0.1:20]; %Es_sur_N0 en dB
b = log2(4);
Eb_sur_N0 = 10.^(SNR_R./10)./b;
Es_sur_N0 = 10.^(SNR_R./10);
P_b = 0.5*(1-sqrt((Eb_sur_N0)./(Eb_sur_N0+1)));
BER = P_b;


%% SNR-BER curve project part 1
%% Perfect
%SNR = [13, 11, 9, 7, 5, 3];
%SNR_norm = SNR-3;
% Sacha
%BER_S = [0.000329, 0.001765, 0.00541, 0.0156, 0.0344, 0.0749];  

% Louis
%BER_L = [0.00022, 0.00096, 0.00325, 0.0096, 0.023, 0.0545];
%without cuting at 12
%SNR_perfect = [15, 13, 11, 9, 7, 5, 3];
%SNR_perfect = SNR_perfect-3;
%BER_without_cuting = [0.00141996 ,0.00219244, 0.0047194, 0.0101307, 0.0234973, 0.053172, 0.11489];


SNR_perfect = [21, 19, 17, 15, 13, 11, 9, 7, 5, 3];
SNR_perfect = SNR_perfect-3;

BER_perfect_new = [9E-08, 9E-07, 1.24E-05, 5.88267E-05, 0.00030595,  0.0012464  ,0.00428707,0.0132908,0.0339204,0.0715464];
BER_perfect_from_moodle = [9.06667E-06, 6.13067E-05, 0.00028605,0.00121844  ,0.00439433,0.0132218,0.033543,0.0688596];
%% Imperfect
%BER_imp_S = [0.00269, 0.005133, 0.0107, 0.02496, 0.0553, 0.1166];

%BER_imp_L = [0.00128, 0.00357, 0.0067, 0.0188, 0.0433, 0.088256];

%BER_imp_L2 = [0.002436, 0.0048, 0.0125, 0.0283, 0.059, 0.11795];

SNR_imp = [19, 17, 15, 13, 11, 9, 7, 5, 3];
SNR_imp = SNR_imp-3;

BER_imp_new = [7.846E-05, 0.000168125,0.0003176, 0.00077168,0.0019505,0.00512013,0.0138953,0.0344482,0.0720986];

BER_from_moodle = [0.0002844,0.0004258, 0.00087124,0.0021407,0.00513907,0.0140153,0.0327262,0.072398];


%% Plots
fig = figure();
%semilogy(SNR_norm, BER_S);


semilogy(SNR_perfect, BER_perfect_new);
xlim([0 17]);

hold on;
semilogy(SNR_R, BER);
xlim([0 19]);

hold on; 
semilogy(SNR_imp, BER_imp_new);
xlim([0 19]);



xlabel('SNR [dB]');
ylabel('BER');
title('BER function of SNR in QPSK');
legend('Alamouti perfect CSI', 'Rayleigh','Alamouti imperfect CSI');
saveas(fig, 'ber_snr.png');