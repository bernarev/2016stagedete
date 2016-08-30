%*********************************************************************** 
%									 
%	-- Read "inFile" data, divide into small sets of "timeScale" size,
%   tries to find the probable real data and saves new data in "outFile"
%
%	-> Usage = 
%		-> filterFile(inFile,outFile,timeScale,timeGap,timeDev)
%
%	-> inputs =
%		-> inFile       - path to raw data
%		-> outFile      - path to new file
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
%		- readMeasures.m
%		- separateData.m
%		- findSeries.m
%		- selectData.m
%		- joinData.m
%		- saveData.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	2
%
%	last edited in:	24/08/2016 	
%   - v2: correction of input time format in "findSeries" function
%									 
%***********************************************************************

function filterFile(inFile,outFile,timeScale,timeGap,timeDev)

    %% loading of data and separation into small sets
    data = readMeasures(inFile);
    separatedData = separateData(data,timeScale);
    
    %% filtering of each small set
    
    % definition of cell array for new filtered data
    newSeparatedData = {};

    i = 1;
    while(i <= length(separatedData))
        ithData = separatedData{i};
        idx = findSeries(gsec(ithData.time),timeGap,timeDev);
        ithData = selectData(ithData,idx);
        newSeparatedData{i} = ithData;
        i = i+1;
    end 
    
    %% creation of new file
    newdata = joinData(newSeparatedData);
    saveToFile(newdata,'',outFile);
end