clc;
clear all;

% [WINDOWS - DOUBLE dt 0100 and neurons 100% Excitatory]
path_to_directory = 'D:/pesquisa/precisionPaper/github/double/results';
doubleWinFile = '/HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES.txt';
filename = strcat(path_to_directory, doubleWinFile);
delimiter = '\t';
formatSpec = '%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
% Allocate imported array to column variable names
a1 = dataArray{:, 3};
s1 = dataArray{:, 4};

% [Mac - DOUBLE dt 0100 and neurons 100% Excitatory]
path_to_directory = 'D:/pesquisa/precisionPaper/mac/results';
doubleMacFile = '/HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES.txt';
filename = strcat(path_to_directory, doubleMacFile);
delimiter = '\t';
formatSpec = '%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
% Allocate imported array to column variable names
a2 = dataArray{:, 3};
s2 = dataArray{:, 4};

% [Linux - DOUBLE dt 0100 and neurons 100% Excitatory]
path_to_directory = 'D:/pesquisa/precisionPaper/linux/results';
doubleLinuxFile = '/HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES.txt';
filename = strcat(path_to_directory, doubleLinuxFile);
delimiter = '\t';
formatSpec = '%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
% Allocate imported array to column variable names
a3 = dataArray{:, 3};
s3 = dataArray{:, 4};

% Time axis
time = 1:800001;
time = time';

% ---- Make Figure ----

figure1 = figure('Color',[1 1 1]);

% Plot - Double - Windows 100% Excitatory neurons
subplot(3,2,1);
plot(time/100000,a1,'k-','LineWidth',2);
hold on;
plot(time/100000,s1,'r-','LineWidth',2);
ylabel({'\color{black}A,\color{red}S'}, 'FontSize',14);
xlim([0,8]);
xticks([])
ylim([0,1]);
set(gca,...
    'FontWeight','bold','FontSize',11,...
    'YTick',0:0.2:1);
title({'Windows'});

% Plot - Double - Mac 100% Excitatory neurons
subplot(3,2,3);
plot(time/100000,a2,'k-','LineWidth',2);
hold on;
plot(time/100000,s2,'r-','LineWidth',2);
ylabel({'\color{black}A,\color{red}S'}, 'FontSize',14);
xlim([0,8]);
xticks([])
ylim([0,1]);
set(gca,...
    'FontWeight','bold','FontSize',11,...
    'YTick',0:0.2:1);
title({'Mac'});

% Plot - Double - Linux 100% Excitatory neurons
subplot(3,2,5);
plot(time/100000,a3,'k-','LineWidth',2);
hold on;
plot(time/100000,s3,'r-','LineWidth',2);
ylabel({'\color{black}A,\color{red}S'}, 'FontSize',14);
xlim([0,8]);
ylim([0,1]);
set(gca,...
    'FontWeight','bold','FontSize',11,...
    'YTick',0:0.2:1);
title({'Linux'});