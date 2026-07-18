clear
clc
preprocessing;

%Subject 01, experiment 01, session 01, eyes open%
%alpha band
alphaBand = [8 12];
alphaPower_1 = bandpower(s01_EEG_1_butter_offset, fs, alphaBand);
alphaPower_2 = bandpower(s01_EEG_2_butter_offset, fs, alphaBand);
alphaPower_3 = bandpower(s01_EEG_3_butter_offset, fs, alphaBand);
alphaPower_4 = bandpower(s01_EEG_4_butter_offset, fs, alphaBand);

%Plot alpha band
figure;
bar([alphaPower_1, alphaPower_2, alphaPower_3, alphaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Alpha Band Power (µV²/Hz)');
title('Alpha Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'T7', 'F8', 'Cz', 'P4'});

%Beta
betaBand = [13 30];
betaPower_1 = bandpower(s01_EEG_1_butter_offset, fs, betaBand);
betaPower_2 = bandpower(s01_EEG_2_butter_offset, fs, betaBand);
betaPower_3 = bandpower(s01_EEG_3_butter_offset, fs, betaBand);
betaPower_4 = bandpower(s01_EEG_4_butter_offset, fs, betaBand);

%Plot beta band
figure;
bar([betaPower_1, betaPower_2, betaPower_3, betaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Beta Band Power (µV²/Hz)');
title('Beta Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'T7', 'F8', 'Cz', 'P4'});




%% 

%Subject 01, experiment 02, session 01, eyes closed%
%alpha
alphaBand = [8 12];
alphaPower_1 = bandpower(s01_ex02_EEG_1_butter_offset, fs, alphaBand);
alphaPower_2 = bandpower(s01_ex02_EEG_2_butter_offset, fs, alphaBand);
alphaPower_3 = bandpower(s01_ex02_EEG_3_butter_offset, fs, alphaBand);
alphaPower_4 = bandpower(s01_ex02_EEG_4_butter_offset, fs, alphaBand);

%plot alpha band
figure;
bar([alphaPower_1, alphaPower_2, alphaPower_3, alphaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Alpha Band Power (µV²/Hz)');
title('Alpha Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'T7', 'F8', 'Cz', 'P4'});

%Beta
betaBand = [13 30];
betaPower_1 = bandpower(s01_ex02_EEG_1_butter_offset, fs, betaBand);
betaPower_2 = bandpower(s01_ex02_EEG_2_butter_offset, fs, betaBand);
betaPower_3 = bandpower(s01_ex02_EEG_3_butter_offset, fs, betaBand);
betaPower_4 = bandpower(s01_ex02_EEG_4_butter_offset, fs, betaBand);

%plot beta band
figure;
bar([betaPower_1, betaPower_2, betaPower_3, betaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Beta Band Power (µV²/Hz)');
title('Beta Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'T7', 'F8', 'Cz', 'P4'});
%% 
%Subject 02, experiment 01, session 01, eyes open%
%alpha band
alphaBand = [8 12];
alphaPower_1 = bandpower(s02_EEG_1_butter_offset, fs, alphaBand);
alphaPower_2 = bandpower(s02_EEG_2_butter_offset, fs, alphaBand);
alphaPower_3 = bandpower(s02_EEG_3_butter_offset, fs, alphaBand);
alphaPower_4 = bandpower(s02_EEG_4_butter_offset, fs, alphaBand);

%Plot alpha band
figure;
bar([alphaPower_1, alphaPower_2, alphaPower_3, alphaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Alpha Band Power (µV²/Hz)');
title('Alpha Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'T7', 'F8', 'Cz', 'P4'});

%Beta
betaBand = [13 30];
betaPower_1 = bandpower(s02_EEG_1_butter_offset, fs, betaBand);
betaPower_2 = bandpower(s02_EEG_2_butter_offset, fs, betaBand);
betaPower_3 = bandpower(s02_EEG_3_butter_offset, fs, betaBand);
betaPower_4 = bandpower(s02_EEG_4_butter_offset, fs, betaBand);

%Plot beta band
figure;
bar([betaPower_1, betaPower_2, betaPower_3, betaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Beta Band Power (µV²/Hz)');
title('Beta Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'T7', 'F8', 'Cz', 'P4'});
%% 
%Subject 02, experiment 02, session 01, eyes closed%
%alpha
alphaBand = [8 12];
alphaPower_1 = bandpower(s02_ex02_EEG_1_butter_offset, fs, alphaBand);
alphaPower_2 = bandpower(s02_ex02_EEG_2_butter_offset, fs, alphaBand);
alphaPower_3 = bandpower(s02_ex02_EEG_3_butter_offset, fs, alphaBand);
alphaPower_4 = bandpower(s02_ex02_EEG_4_butter_offset, fs, alphaBand);

%plot alpha band
figure;
bar([alphaPower_1, alphaPower_2, alphaPower_3, alphaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Alpha Band Power (µV²/Hz)');
title('Alpha Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'T7', 'F8', 'Cz', 'P4'});

%Beta
betaBand = [13 30];
betaPower_1 = bandpower(s02_ex02_EEG_1_butter_offset, fs, betaBand);
betaPower_2 = bandpower(s02_ex02_EEG_2_butter_offset, fs, betaBand);
betaPower_3 = bandpower(s02_ex02_EEG_3_butter_offset, fs, betaBand);
betaPower_4 = bandpower(s02_ex02_EEG_4_butter_offset, fs, betaBand);

%plot beta band
figure;
bar([betaPower_1, betaPower_2, betaPower_3, betaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Beta Band Power (µV²/Hz)');
title('Beta Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'T7', 'F8', 'Cz', 'P4'});
%%
%Power Spectral Density
figure
pspectrum(s01_EEG_1_butter_offset,200)
pspectrum(s01_EEG_2_butter_offset,200)
pspectrum(s01_EEG_3_butter_offset,200)
pspectrum(s01_EEG_4_butter_offset,200)
%% 
figure
pspectrum(s02_EEG_1_butter_offset,200)
pspectrum(s02_EEG_2_butter_offset,200)
pspectrum(s02_EEG_3_butter_offset,200)
pspectrum(s02_EEG_4_butter_offset,200)

%%
figure
pspectrum(s01_ex02_EEG_1_butter_offset,200)
pspectrum(s01_ex02_EEG_2_butter_offset,200)
pspectrum(s01_ex02_EEG_3_butter_offset,200)
pspectrum(s01_ex02_EEG_4_butter_offset,200)
%% 
figure
pspectrum(s02_ex02_EEG_1_butter_offset,200)
pspectrum(s02_ex02_EEG_2_butter_offset,200)
pspectrum(s02_ex02_EEG_3_butter_offset,200)
pspectrum(s02_ex02_EEG_4_butter_offset,200)
