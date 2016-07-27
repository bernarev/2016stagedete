%*********************************************************************** 
%									 
%	-- Main file
%								 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		- Statistics Toolbox (Version 8.1)	
%
% 	-> Other dependencies:  
%       - readMeasures.m
%       - readAllMeasures.m
%		- myCell2Mat.m
%		- systemLinkBudget.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	7
%       - "getCDF.m" deprecated in favor of Statistics Toolbox's
%       pre-built function
%       - creation of "systemLinkBudget.m" with system characterists for
%       cleaner code
%
%	last edited in:	27/07/2016 					 
%									 
%*********************************************************************** 

% ---- loading of desired data ----
% enter files location and date desired
% year, month and day should be either a two-digit string, 
% or an empty string for wildcard (for multiples files)
path = '/home/ebernardes/Área de Trabalho/Mesures/';
year = '16';
month = '07';
day = '';

img1 = sprintf('%s%s%s%s_cdf', path,year,month,day);
img2 = sprintf('%s%s%s%s_pdf', path,year,month,day);

% checking for "wildcard" option
if(isempty(year))
    year = '**'; end
if(isempty(month))
    month = '**'; end
if(isempty(day))
    day = '**'; end

% loss calculations following the characteristics of the system
% -> read "systemLinkBudget.m" for details
AirLosse = systemLinkBudget(pow,att);

% calculation of probability functions with Statistics toolbox
[cdf,xi] = ecdf(AirLosse);
[pdf,xj] = ksdensity(AirLosse);

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
xlabel('Loss in air (dB)');
%ylabel('Percentage of probability');

print('-f1',img1,'-dpng')
print('-f2',img2,'-dpng')