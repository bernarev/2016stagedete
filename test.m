% ---- loading of desired data ----
% enter files location and date desired
% year, month and day should be either a two-digit string, 
% or an empty string for wildcard (for multiples files)
configFile = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Codes/systemCharacteristics.txt';
dataPath = '/home/ebernardes/Área de Trabalho/Mesures/';
year = '16';
month = '';
day = '';

img1 = sprintf('%s%s%s%s_cdf', dataPath,year,month,day);
img2 = sprintf('%s%s%s%s_pdf', dataPath,year,month,day);

% checking for "wildcard" option
if(isempty(year))
    year = '*'; end
if(isempty(month))
    month = '*'; end
if(isempty(day))
    day = '*'; end

%[pow,time,att,files] = readAllMeasures(dataPath,year,month,day);

file = '/home/ebernardes/Área de Trabalho/Mesures/160708.txt';
%[pow,time,att] = readMeasures(file);

% loss calculations following the characteristics of the system
% -> read "systemLinkBudget.m" for details

h = 16;
hour = time.hour;
pow_h = pow(hour == h);
att_h = att(hour == h);
AirLosse = systemLinkBudget(pow_h,att_h,configFile);
%AirLosse = systemLinkBudget(pow,att,configFile);

% calculation of probability functions with Statistics toolbox
[cdf,xi] = ecdf(AirLosse);
[pdf,xj] = ksdensity(AirLosse);

% plotTitle = sprintf('Empirical CDF \nData at %d', h);
% figure; plot(xi,100*cdf,'r','LineWidth',2);
% title(plotTitle);
% axis([120 200 0 110]);
% xlabel('Loss in air (dB)');
% ylabel('Percentage of probability');

plotTitle = sprintf('Empirical PDF \nData at %d', h);
figure(2); plot(xj,pdf,'LineWidth',2);
axis([120 200 0 0.3]);
title(plotTitle);
xlabel('Loss in air (dB)');
%ylabel('Percentage of probability');

%print('-f1',img1,'-dpng')
%print('-f2',img2,'-dpng')