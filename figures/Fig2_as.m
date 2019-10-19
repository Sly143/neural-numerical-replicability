clc;
clear all;

% [WINDOWS - DOUBLE dt = 0100 and neurons 100% Excitatory]
path_to_directory = 'D:/pesquisa/precisionPaper/windows/double/100/results';
doubleWin100File = '/HH_BBT_rk4_dt0100_100,0,vI70,t=8s_double_IappDES.txt';
filename = strcat(path_to_directory, doubleWin100File);
delimiter = '\t';
formatSpec = '%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
% Allocate imported array to column variable names
a1 = dataArray{:, 3};
s1 = dataArray{:, 4};

% [WINDOWS - DOUBLE dt = 0100 and neurons 80/20% Excitatory/Inhibitory]
path_to_directory = 'D:/pesquisa/precisionPaper/windows/double/80_20/results';
doubleWin8020File = '/HH_BBT_rk4_dt0100_100,20,vI70,t=8s_double_IappDES.txt';
filename = strcat(path_to_directory, doubleWin8020File);
delimiter = '\t';
formatSpec = '%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
% Allocate imported array to column variable names
a2 = dataArray{:, 3};
s2 = dataArray{:, 4};

% Time axis
dt = 0.01;
if dt == 0.01
    time = 1:800001;
    time = time';
    in = 100000;
elseif dt == 0.05
    time = 1:1600001;
    time = time';
    in = 200000;
end


% Difference index between HH - 100 and HH 80/20 [Double Precision]
erro_a = abs(a1 - a2);
index = find(erro_a > 0.000001,1)
erro_a(index)

% ---- Make Figure ----

figure1 = figure('Color',[1 1 1]);

% Plot - Double - Windows 100% Excitatory neurons
subplot(2,2,1);
plot(time/in,a1,'k-','LineWidth',2);
hold on;
plot(time/in,s1,'r-','LineWidth',2);
ylabel({'\color{black}A,\color{red}S'}, 'FontSize',14);
xlim([0,8]);
ylim([0,1]);
set(gca,...
    'FontWeight','bold','FontSize',11,...
    'YTick',0:0.2:1);
title({'DOUBLE','100% Excitatory neurons, vInh = vExc = 70 mV'});

% Plot - Double - Windows 80/20% Excitatory/Inhibitory neurons
subplot(2,2,3);
plot(time/in,a2,'k-','LineWidth',2);
hold on;
plot(time/in,s2,'r-','LineWidth',2);
ylabel({'\color{black}A,\color{red}S'}, 'FontSize',14);
xlim([0,8]);
ylim([0,1]);
set(gca,...
    'FontWeight','bold','FontSize',11,...
    'YTick',0:0.2:1);
title({'DOUBLE','80/20% Excitatory/Inhibitory neurons, vInh = vExc = 70 mV'});