clear all;

path_to_directory = 'D:/pesquisa/precisionPaper/windows/boost/100/results';
doubleBoost100Spikes = '/HH_BBT_rk4_dt10_100_0_vI_70_t8s_Boost_IappDES_Spikes.m';
filenameSpikesBoostWin100 = strcat(path_to_directory, doubleBoost100Spikes);
run(filenameSpikesBoostWin100); % create the variable "spikeTimes"
winBoost100 = spikeTimes;

path_to_directory = 'D:/pesquisa/precisionPaper/windows/boost/80_20/results';
doubleBoost8020Spikes = '/HH_BBT_rk4_dt10_100_20_vI_70_t8s_Boost_IappDES_Spikes.m';
filenameBoostSpikesWin80_20 = strcat(path_to_directory, doubleBoost8020Spikes);
run(filenameBoostSpikesWin80_20); % create the variable "spikeTimes"
winBoost80_20 = spikeTimes;

path_to_directory = 'D:/pesquisa/precisionPaper/windows/longDouble/100/results';
doubleLB100Spikes = '/HH_BBT_rk4_dt10_100_0_vI_70_t8s_LD_IappInter_Spikes.m';
filenameLBSpikesWin100 = strcat(path_to_directory, doubleLB100Spikes);
run(filenameLBSpikesWin100); % create the variable "spikeTimes"
winLB100 = spikeTimes;

path_to_directory = 'D:/pesquisa/precisionPaper/windows/longDouble/80_20/results';
doubleLB8020Spikes = '/HH_BBT_rk4_dt10_100_20_vI_70_t8s_LD_IappInter_Spikes.m';
filenameLBSpikesWin80_20 = strcat(path_to_directory, doubleLB8020Spikes);
run(filenameLBSpikesWin80_20); % create the variable "spikeTimes"
winLB80_20 = spikeTimes;
clc

y = 1:100;
for i = 1:100
   sz = size(winLB80_20{i});
   for j = 1:sz(2)       
         if double(winLB80_20{i}(j)) ~= double(winLB100{i}(j))
             if double(winLB80_20{i}(j)) >= double(winLB100{i}(j))
                difLDWin100_20(i) = winLB100{i}(j);
             else
                difLDWin100_20(i) = winLB80_20{i}(j);
            end
            break;
         end
   end
end

for i = 1:100
   sz = size(winBoost80_20{i});
   for j = 1:sz(2)       
         if double(winBoost80_20{i}(j)) ~= double(winBoost100{i}(j))
            if double(winBoost80_20{i}(j)) >= double(winBoost100{i}(j))
                difBoostWin100_20(i) = winBoost100{i}(j);
             else
                difBoostWin100_20(i) = winBoost80_20{i}(j)
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
rasterPlot([],winLB80_20, 80, 1000,1,0,0,'.');
hold on;
a = plot(difLDWin100_20/1000,y,[neuColor marker], 'MarkerSize',sizeMark)
set(a, 'markerfacecolor', get(a, 'color')); % Use same color to fill in markers
title({'LONG DOUBLE','Diference between 80/20% Excitatory/Inhibitory neurons | 100% Excitatory neurons'});
set(gca,'fontweight','bold','fontsize',11)
xlim([0,8]);


subplot(2,2,2);
rasterPlot([],winBoost80_20, 80, 1000,1,0,0,'.');
hold on;
%b = plot(difBoostWin100_20/1000,y,[neuColor marker ])
%set(b, 'markerfacecolor', get(b, 'color')); % Use same color to fill in markers
title({'BOOST IMPLEMENTED','Diference between 80/20% Excitatory/Inhibitory neurons | 100% Excitatory neurons'});
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

% if (gcaHandle == [])   
%     fh = figure('Color',[1 1 1], ...
%         'Position', [50 50 1600 1050]);hold on
% end;

if (countAct==1)
    subplot(2,1,1);
end

% if (isempty(marker))
%     marker = '.';
% end

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
    plot(vSpikes/timeScale, y, [neuColor marker ], ...
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
     plot(centers/timeScale, countExc - countInh,'g-');
   
    if (timeRange == 0)
        xlim([0 maxTime/timeScale])
    else
        xlim([timeRange(1)/timeScale timeRange(2)/timeScale])
    end
    ylim([0 1])
    xlabel('\fontsize{16} Time (s)');
end
  
end


