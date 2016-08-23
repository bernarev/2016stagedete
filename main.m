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
% 	Code version:	8
%       - v6: "getCDF.m" deprecated in favor of Statistics Toolbox's
%       pre-built function
%       - v7: creation of "systemLinkBudget.m" with system characterists for
%       cleaner code
%       - v8: update for data structures
%
%	last edited in:	04/08/2016 					 
%									 
%*********************************************************************** 

%% ---- loading of desired data ----
% enter files location and date desired
% year, month and day should be either a two-digit string, 
% or an empty string for wildcard (for multiples files)
configFile = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Codes/systemCharacteristics.txt';
dataPath = '/home/ebernardes/Área de Trabalho/Mesures/';
year = '16';
month = '07';
day = '13';

img1 = sprintf('%s%s%s%s_cdf', dataPath,year,month,day);
img2 = sprintf('%s%s%s%s_pdf', dataPath,year,month,day);



[adata,files] = readAllMeasures(dataPath,year,month,day);

selectionVector = adata.pow >= -64;
filterData = selectData(adata,selectionVector);
%% ---- test and selection of data ----

%aadata = filterData(adata,3,18,13);
separatedData = separateData(filterData,18);
N = length(separatedData);
ssData = {};
i = 1;
while(i <= N)
    ithData = separatedData{i};
    
    idx = testData(ithData,4);
    
    ithData = selectData(ithData,idx);
    
    ssData{i} = ithData;
    
    i = i+1;
end 
newData = joinData(ssData);
%% ---- Calculation of air losses ----
data = newData;
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
%ylabel('Percentage of probability');

%print('-f1',img1,'-dpng')
%print('-f2',img2,'-dpng')