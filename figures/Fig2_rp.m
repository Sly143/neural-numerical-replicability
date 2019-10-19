
clear all;

path_to_directory = 'D:/pesquisa/precisionPaper/windows/double/100/results';
doubleWin100Spikes = '/HH_BBT_rk4_dt0100_100_0_vI_70_t8s_double_IappDES_Spikes.m';
filenameSpikesWin100 = strcat(path_to_directory, doubleWin100Spikes);
run(filenameSpikesWin100); % create the variable "spikeTimes"
win100 = spikeTimes

path_to_directory = 'D:/pesquisa/precisionPaper/windows/double/80_20/results';
doubleWin8020Spikes = '/HH_BBT_rk4_dt0100_100_20_vI_70_t8s_double_IappDES_Spikes.m';
filenameSpikesWin80_20 = strcat(path_to_directory, doubleWin8020Spikes);
run(filenameSpikesWin80_20); % create the variable "spikeTimes"
win80_20 = spikeTimes

clc

y = 1:100;
for i = 1:100
   sz = size(win80_20{i});
   for j = 1:sz(2)       
         if double(win80_20{i}(j)) ~= double(win100{i}(j))
            if double(win80_20{i}(j)) >= double(win100{i}(j))
                difWin100_20(i) = win100{i}(j);
            else
                difWin100_20(i) = win80_20{i}(j);
            end
            break;
         end
   end
end

figure1 = figure('Color',[1 1 1]);

neuColor = 'black';
marker = 'd';
sizeMark = 5

subplot(2,2,1);
rasterPlot([],win80_20, 80, 1000,1,0,0,'.');
hold on;
a = plot(difWin100_20/1000,y,[neuColor marker], 'MarkerSize',sizeMark)
set(a, 'markerfacecolor', get(a, 'color')); % Use same color to fill in markers
title({'DOUBLE','Diference between 80/20% Excitatory/Inhibitory neurons | 100% Excitatory neurons'});
set(gca,'fontweight','bold','fontsize',11)
xlim([0,8]);

function rasterPlot( gcaHandle, mSpikeTimes, vnExcNeurons, timeScale, lineWidth, countAct, timeRange, marker)

nNeurons = numel(mSpikeTimes);

maxTime=0;
for n = 1:nNeurons
    maxT = max(mSpikeTimes{n});
    if (maxT > maxTime)
        maxTime = maxT;
    end
end

if (gcaHandle == [])
    fh = figure('Color',[1 1 1], ...
        'Position', [50 50 1600 1050]);hold on
end;

if (countAct==1)
    subplot(2,1,1);
end

if (isempty(marker))
    marker = '.';
end


hold on
for n = 1:nNeurons
    vSpikes = mSpikeTimes{n};
    nSpikes = numel(vSpikes);
    y = n*ones(1,nSpikes);
    %        yline = [(n-1)*ones(1,nSpikes); n*ones(1,nSpikes)];
    if (numel(vnExcNeurons)==1)
        if (n<=vnExcNeurons)
            neuColor = 'r';
        else
            neuColor = 'b';
        end
    elseif (vnExcNeurons(n)==1)
        neuColor = 'r';
    else 
        neuColor = 'b';       
    end
    plot(vSpikes/timeScale, y, [neuColor marker], ...
        'LineWidth',lineWidth);
end
if (timeRange == 0)
    xlim([0 maxTime/timeScale])
else
    xlim([timeRange(1)/timeScale timeRange(2)/timeScale])
end
ylim([0 nNeurons])
if (gcaHandle ~= [])
    ylabel(['\fontsize{16} ' num2str(nNeurons) ' Neurons <{\color{red}' num2str(vnExcNeurons) ' Exc}, {\color{blue} ' num2str(nNeurons-vnExcNeurons) ' Inh} >']);
    xlabel('\fontsize{16} Time (s)');
end

if (countAct ==1)
    binTime  = 2; % ms
    xbins = 1:binTime:maxT;
    countExc = zeros(1,numel(xbins));
    countInh = zeros(1,numel(xbins));
    for n = 1:nNeurons
        x = mSpikeTimes{n};
        [counts,centers] = hist(x,xbins);
        if (n<=vnExcNeurons)
            countExc = countExc + (counts>=1);
        else
            countInh = countInh + (counts>=1);
        end
    end
    
    subplot(2,1,2);
    hold on
    plot(centers/timeScale, countExc/nNeurons, 'r-');
    plot(centers/timeScale, countInh/nNeurons, 'b-');
    % plot(centers/timeScale, countExc - countInh,'g-');
    
    if (timeRange == 0)
        xlim([0 maxTime/timeScale])
    else
        xlim([timeRange(1)/timeScale timeRange(2)/timeScale])
    end
    ylim([0 1])
    xlabel('\fontsize{16} Time (s)');
end


end
