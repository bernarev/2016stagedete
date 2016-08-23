%% select and filter files
configFile = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Codes/systemCharacteristics.txt';
dataPath = '/home/ebernardes/Área de Trabalho/Mesures/';
dataPath1 = '/home/ebernardes/Área de Trabalho/Mesures/filter1/';
dataPath2 = '/home/ebernardes/Área de Trabalho/Mesures/filter2/';
year = '16';
month = '07';
day = '';

limit = -64;
timeGap = 4;
timeDev = 0.1;

removeNoiseFromAllFiles(dataPath,dataPath1,limit,year,month,day);
filterAllFiles(dataPath1,dataPath2,14,timeGap,timeDev,year,month,day);

%% read raw data
[data1,files] = readAllMeasures(dataPath,year,month,day);

%% read new data
[data2,files] = readAllMeasures(dataPath1,year,month,day);

%% read new data
[data3,files] = readAllMeasures(dataPath2,year,month,day);

%% ---- Calculation of air losses ----
data = data3;
pow = data.pow;
att = data.att;

% loss calculations following the characteristics of the system
% -> read "systemLinkBudget.m" for details
AirLosses = systemLinkBudget(pow,att,configFile);

% calculation of probability functions with Statistics toolbox
[cdf,xi] = ecdf(AirLosses);
[pdf,xj] = ksdensity(AirLosses);

plotTitle = sprintf('Empirical CDF \nData from:\t%s/%s/%s\n\t\tdd/mm/yy', day, month, year);
figure(1); plot(xi,100*cdf,'r','LineWidth',2);
title(plotTitle);
axis([120 200 0 110]);
xlabel('Loss in air (dB)');
ylabel('Percentage of probability');

plotTitle = sprintf('Empirical PDF \nData from:\t%s/%s/%s\n\t\tdd/mm/yy', day, month, year);
figure(2); plot(xj,pdf,'LineWidth',2);
axis([120 200 0 0.3]);
title(plotTitle);
xlabel('Losses in air (dB)');

