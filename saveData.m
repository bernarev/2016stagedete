%*********************************************************************** 
%									 
%	-- reads "data" and saves its content at "directory" in multiple 
%   .txt files, separing by date
%
%	-> Usage = 
%		-> saveData(data,directory)
%
%	-> inputs =	
%       -> data  - STRUCT containing data
%
%       -> directory - STRING with directory to save
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--
%
% 	-> Other dependencies: 
%		- saveOneFile.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	1
%
%	last edited in:	30/08/2016 					 
%									 
%*********************************************************************** 
function saveData(data,directory)
    %% detect dates of data
    years = num2str(data.time.YY,'%02i');
    months = num2str(data.time.MM,'%02i');
    days = num2str(data.time.DD,'%02i');
    
    dates = [years months days];
    uniqueDates = unique(dates,'rows'); % stores each date
    dates = num2cell(dates,2);          % cell array, date of each measure

    nOfDays = length(uniqueDates);            % number of dates

    %% save data in different files for each date
    for i = 1:nOfDays
        ithDate = uniqueDates(i,:);
        selectionVector = strcmp(ithDate,dates);
        selectedData = selectData(data,selectionVector);
        saveOneFile(selectedData,[ithDate '.txt'],directory);
    end
end

