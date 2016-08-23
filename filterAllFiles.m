%*********************************************************************** 
%									 
%	-- Applies "filterFile.m" to a set of desired files at "pathIn"
%   and saves the output files at "pathOut"
%
%	-> Usage = 
%		-> filterAllFiles(inPath,outPath,timeScale,timeGap,timeDev,year,month,day)
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
%		-- readMeasures.m
%		-- separateData.m
%		-- findSeries.m
%		-- selectData.m
%		-- joinData.m
%		-- saveData.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	2
%   - v2: no more checking and changing of parameter to "date"
%   (more direct single string parameter)
%
%	last edited in:	23/08/2016 					 
%									 
%***********************************************************************
function filterAllFiles(inPath,outPath,timeScale,timeGap,timeDev,date)
    
    % finding desired files
    filesSelection = sprintf('%s%s.txt', inPath, date);
    files = dir(filesSelection);
    
    % filtering each file
    for i=1:length(files);
        inFile = [inPath files(i).name];
        %outfile = [outPath num2str(timeScale) '_f_' files(i).name];
        outfile = [outPath files(i).name];
        filterFile(inFile, outfile, timeScale,timeGap,timeDev);
    end
end