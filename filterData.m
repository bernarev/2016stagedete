%*********************************************************************** 
%									 
%	-- Delete data above a limit, divide into small sets of "timeScale" 
%   size and tries to find the probable real data
%
%	-> Usage = 
%		-> filteredData = filterData(data,limit,timeScale,timeGap,timeDev)
%
%	-> inputs =
%		-> data         - STRUCT containing data
%       -> limit        - noise limit
%		-> timeScale    - number defining size of each block 
%       of data (in sec)
%		-> timeGap  - NUMBER: theoretical time distance between direct
%       bursts
%		-> timeDev  - NUMBER: accepted deviation from timeGap
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--
%
% 	-> Other dependencies: 
%		- gsec.m
%		- separateData.m
%       - arrangeData.m
%		- selectData.m
%		- joinData.m
%		- findSeries.m
%       - getHighestValues.m
%		- saveData.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	2.0
%
%	last edited in:	24/08/2016 	
%									 
%***********************************************************************

function filteredData = filterData(data,limit,timeScale,timeGap,timeDev)

    %% filtering out measures with power lower than limit
    selectionVector = data.pow >= limit;
    filteredData = selectData(data,selectionVector);
    
    %% loading of data and separation into small sets
    separatedData = separateData(filteredData,timeScale);
    
    %% filtering of each small set
    newSeparatedData = {}; % cell array with new filtered data

    i = 1;
    while(i <= length(separatedData))
        ithData = separatedData{i};
        
        % filter out parasite data
        idx = findSeries(gsec(ithData.time),timeGap,timeDev);
        ithData = selectData(ithData,idx);
        
        % select only the highest values between adjacent data 
        idx = getHighestValues(ithData,timeDev);
        ithData = selectData(ithData,idx);
        
        % create new cell of separated data
        newSeparatedData{i} = ithData;
        
        i = i+1;
    end 
    
    %% creation of new file
    newData = joinData(newSeparatedData);
    
end