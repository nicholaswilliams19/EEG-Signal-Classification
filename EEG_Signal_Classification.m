%%Subject 1, experiment 1, session 1, resting state%%
clear
clc
data = readtable('D:\s01_ex01_s01.txt' );
datatwo = readtable('D:\Data_trim.csv' );
filledTable = fillmissing(datatwo,'constant',0)
data.Other = [];
data.Other_1 = [];
data.Other_2 = [];
data.Other_3= [];
data.Other_4 = [];
data.Timestamp_Formatted_ = [];
%Subject 1, eyes open for three sessions, unprocessed
EEG_1=plot(table2array(data(:,2)), 'Color', 'red')
title('EXG Channel 1 - T7')
figure
EEG_2=plot(table2array(data(:,3)),'Color', 'blue')
title('EXG Channel 2 - F8')
figure
EEG_3=plot(table2array(data(:,4)),'Color', 'yellow')
title('EXG Channel 3 - Cz')
figure
EEG_4=plot(table2array(data(:,5)), 'Color', 'Green')
title('EXG Channel 4 - P4')
figure

raw_data = readmatrix('D:\s01_ex01_s01.txt' );

fs = 200; % sampling range
fpass = [1 40]; %passband range
EEG_1_filtered = bandpass(table2array(data(:,2)), fpass, fs);
time_start = 45;
time_end = 165;
idxStart = round(time_start * fs)+1;
idxEnd = round(time_end * fs);
t = (idxStart:idxEnd) / fs;
plot(t, EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
title('EEG 1 filtered')
figure

EEG_2_filtered = bandpass(table2array(data(:,3)), fpass, fs);
plot(t, EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
title('EEG 2 filtered')
figure

EEG_3_filtered = bandpass(table2array(data(:,4)), fpass, fs);
plot(t, EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
title('EEG 3 filtered')
figure

EEG_4_filtered = bandpass(table2array(data(:,5)), fpass, fs);
plot(t, EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');
title('EEG 4 filtered')

figure
hold on
plot(t, EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
plot(t, EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
plot(t, EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
plot(t, EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');

xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;

[b,a] = butter(4,fpass/(fs/2),'bandpass')

EEG_1_butter=filtfilt(b,a,table2array(data(:,2)));
EEG_2_butter=filtfilt(b,a,table2array(data(:,3)));
EEG_3_butter=filtfilt(b,a,table2array(data(:,4)));
EEG_4_butter=filtfilt(b,a,table2array(data(:,5)));

% Calculate the mean of the filtered EEG signals
meanEEG_1 = mean(EEG_1_butter(idxStart:idxEnd));
meanEEG_2 = mean(EEG_2_butter(idxStart:idxEnd));
meanEEG_3 = mean(EEG_3_butter(idxStart:idxEnd));
meanEEG_4 = mean(EEG_4_butter(idxStart:idxEnd));

%offset data
% Offset the filtered EEG data by subtracting the mean
EEG_1_butter_offset = EEG_1_butter(idxStart:idxEnd) - meanEEG_1;
EEG_2_butter_offset = EEG_2_butter(idxStart:idxEnd) - meanEEG_2;
EEG_3_butter_offset = EEG_3_butter(idxStart:idxEnd) - meanEEG_3;
EEG_4_butter_offset = EEG_4_butter(idxStart:idxEnd) - meanEEG_4;

figure
hold on 
plot(t, EEG_1_butter_offset,'Color', 'red')
plot(t, EEG_2_butter_offset, 'Color', 'blue');
plot(t, EEG_3_butter_offset, 'Color', 'yellow');
plot(t, EEG_4_butter_offset, 'Color', 'green');
xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;

%%Frequency bands%%

%alpha
% Calculate the alpha band power (8-12 Hz)
alphaBand = [8 12];
alphaPower_1 = bandpower(EEG_1_butter_offset, fs, alphaBand);
alphaPower_2 = bandpower(EEG_2_butter_offset, fs, alphaBand);
alphaPower_3 = bandpower(EEG_3_butter_offset, fs, alphaBand);
alphaPower_4 = bandpower(EEG_4_butter_offset, fs, alphaBand);

%plot alpha band
figure;
bar([alphaPower_1, alphaPower_2, alphaPower_3, alphaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Alpha Band Power (µV²/Hz)');
title('Alpha Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'EEG 1', 'EEG 2', 'EEG 3', 'EEG 4'});

%Alpha
% Calculate the alpha band power (8-12 Hz)
alphaBand = [8 12];
alphaPower_1 = bandpower(EEG_1_butter_offset, fs, alphaBand);
alphaPower_2 = bandpower(EEG_2_butter_offset, fs, alphaBand);
alphaPower_3 = bandpower(EEG_3_butter_offset, fs, alphaBand);
alphaPower_4 = bandpower(EEG_4_butter_offset, fs, alphaBand);

%Beta
betaBand = [13 30];
betaPower_1 = bandpower(EEG_1_butter_offset, fs, betaBand);
betaPower_2 = bandpower(EEG_2_butter_offset, fs, betaBand);
betaPower_3 = bandpower(EEG_3_butter_offset, fs, betaBand);
betaPower_4 = bandpower(EEG_4_butter_offset, fs, betaBand);

%plot beta band
figure;
bar([betaPower_1, betaPower_2, betaPower_3, betaPower_4], 'FaceColor', 'flat');
xlabel('EEG Channels');
ylabel('Beta Band Power (µV²/Hz)');
title('Beta Band Power for Each EEG Channel');
set(gca, 'XTickLabel', {'EEG 1', 'EEG 2', 'EEG 3', 'EEG 4'});

%%Mean and Variance%%