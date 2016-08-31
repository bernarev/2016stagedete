%*********************************************************************** 
%									 
%	-- Applies "filterData.m" to a set of desired files at "pathIn"
%   and saves the output files at "pathOut"
%
%	-> Usage = 
%		-> filterFiles(readPath,savePath,limit,timeScale,timeGap,timeDev,date)
%
%	-> inputs =
%		-> inPath       - path to raw files
%		-> outPath      - path to new files
%		-> timeScale    - number defining size of each block 
%       of data (in sec)
%		-> timeGap  - NUMBER: theoretical time distance between direct
%       bursts
%		-> timeDev  - NUMBER: accepted deviation from timeGap
%		-> date     - STRING defining date in the format "YYMMDD"
%
%       OBS.: 'YY', 'MM' and/or 'DD' can be changed for '*' if any of 
%       them should be a wildcard
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--
%
% 	-> Other dependencies: 
%       - filterFile.m
%		-- gsec.m
%		-- separateData.m
%       -- arrangeData.m
%		-- selectData.m
%		-- joinData.m
%		-- findSeries.m
%       -- getHighestValues.m
%		-- saveData.m
%       --- saveOneFile.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	2.0
%
%	last edited in:	30/08/2016 					 
%									 
%***********************************************************************
function filterFiles(readPath,savePath,limit,timeScale,timeGap,timeDev,date)
    
    % finding desired files
    filesSelection = sprintf('%s%s.txt', readPath, date);
    files = dir(filesSelection);
    
    % filtering each file
    for i=1:length(files);
        % get in and out file names and directories
        inFile = [readPath files(i).name];
        outFile = [savePath files(i).name];
        
        % read ith in file
        data = readOneFile(inFile);
        
        % filter ith in file
        filteredData = filterData(data,limit,timeScale,timeGap,timeDev);
        
        % save filtered ith out file
        saveOneFile(filteredData,'',outFile);
    end
end