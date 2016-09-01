%*********************************************************************** 
%									 
%	-- Plots data with dates in X Axis
%
%	-> Usage = 
%		-> plotWithDates(data,angle)
%
%	-> inputs =	
%       -> data  - STRUCT containing data
%       -> angle - rotation of label in DEGREES
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--
%
% 	-> Other dependencies: 
%		- rotateXLabels.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	2.0
%
%	last edited in:	01/09/2016 					 
%									 
%***********************************************************************
function plotWithDates(data,angle)
    %% find dates in date time array
    dates = gdate(data.time);
    uniqueDates = cellstr(unique(dates,'rows'));
    dateCells = cellstr(dates);
    
    %% find indexes of dates
    n = length(uniqueDates(:,1));
    XAxisPos = zeros(n,1);
    for i =1:n
        XAxisPos(i) = find(strcmp(dateCells,uniqueDates{i}),1);
    end
    
    %% plot and set labels
    plot(data.pow);
    set(gca,'XTick',XAxisPos);
    set(gca,'XTickLabel',uniqueDates);
    rotateXLabels(gca,angle);
end