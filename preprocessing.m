
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
s01_EEG_1=plot(table2array(data(:,2)), 'Color', 'red')
title('EXG Channel 1 - T7')
figure
s01_EEG_2=plot(table2array(data(:,3)),'Color', 'blue')
title('EXG Channel 2 - F8')
figure
s01_EEG_3=plot(table2array(data(:,4)),'Color', 'yellow')
title('EXG Channel 3 - Cz')
figure
s01_EEG_4=plot(table2array(data(:,5)), 'Color', 'Green')
title('EXG Channel 4 - P4')
figure

raw_data = readmatrix('D:\s01_ex01_s01.txt' );

fs = 200; % sampling range
fpass = [1 40]; %passband range
s01_EEG_1_filtered = bandpass(table2array(data(:,2)), fpass, fs);
time_start = 45;
time_end = 165;
idxStart = round(time_start * fs)+1;
idxEnd = round(time_end * fs);
t = (idxStart:idxEnd) / fs;
plot(t, s01_EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
title('s01 ex01 EEG 1 filtered')
figure

s01_EEG_2_filtered = bandpass(table2array(data(:,3)), fpass, fs);
plot(t, s01_EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
title('s01 ex01 EEG 2 filtered')
figure

s01_EEG_3_filtered = bandpass(table2array(data(:,4)), fpass, fs);
plot(t, s01_EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
title('s01 ex01 EEG 3 filtered')
figure

s01_EEG_4_filtered = bandpass(table2array(data(:,5)), fpass, fs);
plot(t, s01_EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');
title('s01 ex01 EEG 4 filtered')

figure
hold on
plot(t, s01_EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
plot(t, s01_EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
plot(t, s01_EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
plot(t, s01_EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');

xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;

[b,a] = butter(4,fpass/(fs/2),'bandpass')

s01_EEG_1_butter=filtfilt(b,a,table2array(data(:,2)));
s01_EEG_2_butter=filtfilt(b,a,table2array(data(:,3)));
s01_EEG_3_butter=filtfilt(b,a,table2array(data(:,4)));
s01_EEG_4_butter=filtfilt(b,a,table2array(data(:,5)));

% Calculate the mean of the filtered EEG signals
s01_meanEEG_1 = mean(s01_EEG_1_butter(idxStart:idxEnd));
s01_meanEEG_2 = mean(s01_EEG_2_butter(idxStart:idxEnd));
s01_meanEEG_3 = mean(s01_EEG_3_butter(idxStart:idxEnd));
s01_meanEEG_4 = mean(s01_EEG_4_butter(idxStart:idxEnd));

%offset data
s01_EEG_1_butter_offset = s01_EEG_1_butter(idxStart:idxEnd) - s01_meanEEG_1;
s01_EEG_2_butter_offset = s01_EEG_2_butter(idxStart:idxEnd) - s01_meanEEG_2;
s01_EEG_3_butter_offset = s01_EEG_3_butter(idxStart:idxEnd) - s01_meanEEG_3;
s01_EEG_4_butter_offset = s01_EEG_4_butter(idxStart:idxEnd) - s01_meanEEG_4;

figure
hold on 
plot(t, s01_EEG_1_butter_offset,'Color', 'red')
plot(t, s01_EEG_2_butter_offset, 'Color', 'blue');
plot(t, s01_EEG_3_butter_offset, 'Color', 'yellow');
plot(t, s01_EEG_4_butter_offset, 'Color', 'green');
xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;
%% 

%%Subject 2, Experiment 1, Session 1, Resting State%%
clear
clc
data = readtable('D:\s02_ex01_s01.txt' );
datatwo = readtable('D:\Data_trim.csv' );
filledTable = fillmissing(datatwo,'constant',0)
data.Other = [];
data.Other_1 = [];
data.Other_2 = [];
data.Other_3= [];
data.Other_4 = [];
data.Timestamp_Formatted_ = [];

%Subject 2, eyes open for three sessions, unprocessed
s02_EEG_1=plot(table2array(data(:,2)), 'Color', 'red')
title('EXG Channel 1 - T7')
figure
s02_EEG_2=plot(table2array(data(:,3)),'Color', 'blue')
title('EXG Channel 2 - F8')
figure
s02_EEG_3=plot(table2array(data(:,4)),'Color', 'yellow')
title('EXG Channel 3 - Cz')
figure
s02_EEG_4=plot(table2array(data(:,5)), 'Color', 'Green')
title('EXG Channel 4 - P4')
figure

raw_data = readmatrix('D:\s02_ex01_s01.txt' );

fs = 200; % sampling range
fpass = [1 40]; %passband range
s02_EEG_1_filtered = bandpass(table2array(data(:,2)), fpass, fs);
time_start = 80;
time_end = 200;
idxStart = round(time_start * fs)+1;
idxEnd = round(time_end * fs);
t = (idxStart:idxEnd) / fs;
plot(t, s02_EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
title('s02 ex01 EEG1 filtered')
figure

s02_EEG_2_filtered = bandpass(table2array(data(:,3)), fpass, fs);
plot(t, s02_EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
title('s02 ex01 EEG 2 filtered')
figure

s02_EEG_3_filtered = bandpass(table2array(data(:,4)), fpass, fs);
plot(t, s02_EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
title('s02 ex01 EEG 3 filtered')
figure

s02_EEG_4_filtered = bandpass(table2array(data(:,5)), fpass, fs);
plot(t, s02_EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');
title('s02 ex01 EEG 4 filtered')

figure
hold on
plot(t, s02_EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
plot(t, s02_EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
plot(t, s02_EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
plot(t, s02_EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');

xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;

[b,a] = butter(4,fpass/(fs/2),'bandpass')

s02_EEG_1_butter=filtfilt(b,a,table2array(data(:,2)));
s02_EEG_2_butter=filtfilt(b,a,table2array(data(:,3)));
s02_EEG_3_butter=filtfilt(b,a,table2array(data(:,4)));
s02_EEG_4_butter=filtfilt(b,a,table2array(data(:,5)));

% Calculate the mean of the filtered EEG signals
s02_meanEEG_1 = mean(s02_EEG_1_butter(idxStart:idxEnd));
s02_meanEEG_2 = mean(s02_EEG_2_butter(idxStart:idxEnd));
s02_meanEEG_3 = mean(s02_EEG_3_butter(idxStart:idxEnd));
s02_meanEEG_4 = mean(s02_EEG_4_butter(idxStart:idxEnd));

%offset data
s02_EEG_1_butter_offset = s02_EEG_1_butter(idxStart:idxEnd) - s02_meanEEG_1;
s02_EEG_2_butter_offset = s02_EEG_2_butter(idxStart:idxEnd) - s02_meanEEG_2;
s02_EEG_3_butter_offset = s02_EEG_3_butter(idxStart:idxEnd) - s02_meanEEG_3;
s02_EEG_4_butter_offset = s02_EEG_4_butter(idxStart:idxEnd) - s02_meanEEG_4;

figure
hold on 
plot(t, s02_EEG_1_butter_offset,'Color', 'red')
plot(t, s02_EEG_2_butter_offset, 'Color', 'blue');
plot(t, s02_EEG_3_butter_offset, 'Color', 'yellow');
plot(t, s02_EEG_4_butter_offset, 'Color', 'green');
xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;
%% 
%%Subject 1, Experiment 2, Session 1, Eyes Closed%%
clear
clc
data = readtable('D:\s01_ex02_s01' );
datatwo = readtable('D:\Data_trim.csv' );
filledTable = fillmissing(datatwo,'constant',0)
data.Other = [];
data.Other_1 = [];
data.Other_2 = [];
data.Other_3= [];
data.Other_4 = [];
data.Timestamp_Formatted_ = [];

%Subject 1, eyes closed for three sessions, unprocessed
s01_ex02_EEG_1=plot(table2array(data(:,2)), 'Color', 'red')
title('EXG Channel 1 - T7')
figure
s01_ex02_EEG_2=plot(table2array(data(:,3)),'Color', 'blue')
title('EXG Channel 2 - F8')
figure
s01_ex02_EEG_3=plot(table2array(data(:,4)),'Color', 'yellow')
title('EXG Channel 3 - Cz')
figure
s01_ex02_EEG_4=plot(table2array(data(:,5)), 'Color', 'Green')
title('EXG Channel 4 - P4')
figure

raw_data = readmatrix('D:\s01_ex02_s01.txt' );

fs = 200; % sampling range
fpass = [1 40]; %passband range
s01_EEG_1_filtered = bandpass(table2array(data(:,2)), fpass, fs);
time_start = 15;
time_end = 135;
idxStart = round(time_start * fs)+1;
idxEnd = round(time_end * fs);
t = (idxStart:idxEnd) / fs;
plot(t, s01_EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
title('s01 ex02 EEG 1 filtered')
figure

s01_ex02_EEG_2_filtered = bandpass(table2array(data(:,3)), fpass, fs);
plot(t, s01_ex02_EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
title('s01 ex02 EEG 2 filtered')
figure

s01_ex02_EEG_3_filtered = bandpass(table2array(data(:,4)), fpass, fs);
plot(t, s01_ex02_EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
title('s01 ex02 EEG 3 filtered')
figure

s01_ex02_EEG_4_filtered = bandpass(table2array(data(:,5)), fpass, fs);
plot(t, s01_ex02_EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');
title('s01 ex 02 EEG 4 filtered')

figure
hold on
plot(t, s01_EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
plot(t, s01_ex02_EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
plot(t, s01_ex02_EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
plot(t, s01_ex02_EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');

xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;

[b,a] = butter(4,fpass/(fs/2),'bandpass')

s01_ex02_EEG_1_butter=filtfilt(b,a,table2array(data(:,2)));
s01_ex02_EEG_2_butter=filtfilt(b,a,table2array(data(:,3)));
s01_ex02_EEG_3_butter=filtfilt(b,a,table2array(data(:,4)));
s01_ex02_EEG_4_butter=filtfilt(b,a,table2array(data(:,5)));

% Calculate the mean of the filtered EEG signals
s01_ex02_meanEEG_1 = mean(s01_ex02_EEG_1_butter(idxStart:idxEnd));
s01_ex02_meanEEG_2 = mean(s01_ex02_EEG_2_butter(idxStart:idxEnd));
s01_ex02_meanEEG_3 = mean(s01_ex02_EEG_3_butter(idxStart:idxEnd));
s01_ex02_meanEEG_4 = mean(s01_ex02_EEG_4_butter(idxStart:idxEnd));

%offset data
s01_ex02_EEG_1_butter_offset = s01_ex02_EEG_1_butter(idxStart:idxEnd) - s01_ex02_meanEEG_1;
s01_ex02_EEG_2_butter_offset = s01_ex02_EEG_2_butter(idxStart:idxEnd) - s01_ex02_meanEEG_2;
s01_ex02_EEG_3_butter_offset = s01_ex02_EEG_3_butter(idxStart:idxEnd) - s01_ex02_meanEEG_3;
s01_ex02_EEG_4_butter_offset = s01_ex02_EEG_4_butter(idxStart:idxEnd) - s01_ex02_meanEEG_4;

figure
hold on 
plot(t, s01_ex02_EEG_1_butter_offset,'Color', 'red')
plot(t, s01_ex02_EEG_2_butter_offset, 'Color', 'blue');
plot(t, s01_ex02_EEG_3_butter_offset, 'Color', 'yellow');
plot(t, s01_ex02_EEG_4_butter_offset, 'Color', 'green');
xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;
%% 
%%Subject 2, Experiment 2, Session 1, Eyes Closed%%
clear
clc
data = readtable('D:\s02_ex02_s01' );
datatwo = readtable('D:\Data_trim.csv' );
filledTable = fillmissing(datatwo,'constant',0)
data.Other = [];
data.Other_1 = [];
data.Other_2 = [];
data.Other_3= [];
data.Other_4 = [];
data.Timestamp_Formatted_ = [];

%Subject 2, eyes closed for three sessions, unprocessed
s02_ex02_EEG_1=plot(table2array(data(:,2)), 'Color', 'red')
title('EXG Channel 1 - T7')
figure
s02_ex02_EEG_2=plot(table2array(data(:,3)),'Color', 'blue')
title('EXG Channel 2 - F8')
figure
s02_ex02_EEG_3=plot(table2array(data(:,4)),'Color', 'yellow')
title('EXG Channel 3 - Cz')
figure
s02_ex02_EEG_4=plot(table2array(data(:,5)), 'Color', 'Green')
title('EXG Channel 4 - P4')
figure

raw_data = readmatrix('D:\s02_ex02_s01.txt' );

fs = 200; % sampling range
fpass = [1 40]; %passband range
s02_ex02_EEG_1_filtered = bandpass(table2array(data(:,2)), fpass, fs);
time_start = 10;
time_end = 130;
idxStart = round(time_start * fs)+1;
idxEnd = round(time_end * fs);
t = (idxStart:idxEnd) / fs;
plot(t, s02_ex02_EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
title('s02 ex02 EEG 1 filtered')
figure

s02_ex02_EEG_2_filtered = bandpass(table2array(data(:,3)), fpass, fs);
plot(t, s02_ex02_EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
title('s02 ex02 EEG 2 filtered')
figure

s02_ex02_EEG_3_filtered = bandpass(table2array(data(:,4)), fpass, fs);
plot(t, s02_ex02_EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
title('s02 ex 02 EEG 3 filtered')
figure

s02_ex02_EEG_4_filtered = bandpass(table2array(data(:,5)), fpass, fs);
plot(t, s02_ex02_EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');
title('s02 ex 02 EEG 4 filtered')

figure
hold on
plot(t, s02_ex02_EEG_1_filtered(idxStart:idxEnd), 'Color', 'red');
plot(t, s02_ex02_EEG_2_filtered(idxStart:idxEnd), 'Color', 'blue');
plot(t, s02_ex02_EEG_3_filtered(idxStart:idxEnd), 'Color', 'yellow');
plot(t, s02_ex02_EEG_4_filtered(idxStart:idxEnd), 'Color', 'green');

xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;

[b,a] = butter(4,fpass/(fs/2),'bandpass')

s02_ex02_EEG_1_butter=filtfilt(b,a,table2array(data(:,2)));
s02_ex02_EEG_2_butter=filtfilt(b,a,table2array(data(:,3)));
s02_ex02_EEG_3_butter=filtfilt(b,a,table2array(data(:,4)));
s02_ex02_EEG_4_butter=filtfilt(b,a,table2array(data(:,5)));

% Calculate the mean of the filtered EEG signals
s02_ex02_meanEEG_1 = mean(s02_ex02_EEG_1_butter(idxStart:idxEnd));
s02_ex02_meanEEG_2 = mean(s02_ex02_EEG_2_butter(idxStart:idxEnd));
s02_ex02_meanEEG_3 = mean(s02_ex02_EEG_3_butter(idxStart:idxEnd));
s02_ex02_meanEEG_4 = mean(s02_ex02_EEG_4_butter(idxStart:idxEnd));

%offset data
s02_ex02_EEG_1_butter_offset = s02_ex02_EEG_1_butter(idxStart:idxEnd) - s02_ex02_meanEEG_1;
s02_ex02_EEG_2_butter_offset = s02_ex02_EEG_2_butter(idxStart:idxEnd) - s02_ex02_meanEEG_2;
s02_ex02_EEG_3_butter_offset = s02_ex02_EEG_3_butter(idxStart:idxEnd) - s02_ex02_meanEEG_3;
s02_ex02_EEG_4_butter_offset = s02_ex02_EEG_4_butter(idxStart:idxEnd) - s02_ex02_meanEEG_4;

figure
hold on 
plot(t, s02_ex02_EEG_1_butter_offset,'Color', 'red')
plot(t, s02_ex02_EEG_2_butter_offset, 'Color', 'blue');
plot(t, s02_ex02_EEG_3_butter_offset, 'Color', 'yellow');
plot(t, s02_ex02_EEG_4_butter_offset, 'Color', 'green');
xlabel('Time (s)');
ylabel('Amplitude (µV)');
legend('EEG 1', 'EEG 2', 'EEG 3', 'EEG 4');
hold off;