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
%		-> year  - STRING defining year
%		-> month - STRING defining month
%		-> day   - STRING defining day
%
%       OBS.: 'year', 'month' and 'day' must be either two-digit numbers
%       or '' for wildcard
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
% 	Code version:	1
%
%	last edited in:	22/08/2016 					 
%									 
%***********************************************************************
function filterAllFiles(inPath,outPath,timeScale,timeGap,timeDev,year,month,day)
    % checking for "wildcard" option
    if(isempty(year))
        year = '*'; end
    if(isempty(month))
        month = '*'; end
    if(isempty(day))
        day = '*'; end
    
    % finding desired files
    filesSelection = sprintf('%s%s%s%s.txt', inPath, year, month, day);
    files = dir(filesSelection);
    
    % filtering each file
    for i=1:length(files);
        inFile = [inPath files(i).name];
        %outfile = [outPath num2str(timeScale) '_f_' files(i).name];
        outfile = [outPath files(i).name];
        filterFile(inFile, outfile, timeScale,timeGap,timeDev);
    end
end