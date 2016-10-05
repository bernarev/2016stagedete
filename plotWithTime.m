%*********************************************************************** 
%									 
%	-- Plots data with time in X Axis. Time labels can be of any type
%
%	-> Usage = 
%		-> plotWithTime(data,timeLabels,angle)
%
%	-> inputs =	
%       -> data         - ARRAY containing data
%       -> timeLabels   - ARRAY OF STRINGS containing labels
%       -> angle        - rotation of label in DEGREES
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
% 	Code version:	2.1
%   -v2.1: changed input parameter from struct to data array
%   -v2.2: changed function name from "plotWithDates" to "plotWithTime"
%
%	last edited in:	01/09/2016 					 
%									 
%***********************************************************************
function plotWithTime(data,timeLabels,angle)
    %% find dates in date time array
    uniqueDates = cellstr(unique(timeLabels,'rows'));
    dateCells = cellstr(timeLabels);
    
    %% find indexes of dates
    n = length(uniqueDates(:,1));
    XAxisPos = zeros(n,1);
    for i =1:n
        XAxisPos(i) = find(strcmp(dateCells,uniqueDates{i}),1);
    end
    
    %% plot and set labels
    plot(data);
    set(gca,'XTick',XAxisPos);
    set(gca,'XTickLabel',uniqueDates);
    rotateXLabels(gca,angle);
end