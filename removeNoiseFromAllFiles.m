%*********************************************************************** 
%									 
%	-- Loads files from "inPath", select only data having above "limit"
%   and saves files at "outPath"
%
%	-> Usage = 
%		-> removeNoiseFromAllFiles(inPath,outPath,limit,year,month,day)
%
%	-> inputs =
%		-> inPath     - path to raw files
%		-> outPath    - path to new files
%		-> limit      - noise limit
%		-> year       - STRING defining year
%		-> month      - STRING defining month
%		-> day        - STRING defining day
%
%       OBS.: 'year', 'month' and 'day' must be either two-digit numbers
%       or '' for wildcard
%								 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		- Statistics Toolbox (Version 8.1)	
%
% 	-> Other dependencies:  
%       - selectData.m
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

function removeNoiseFromAllFiles(inPath,outPath,limit,year,month,day)
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
    
    for i=1:length(files);
        inFile = [inPath files(i).name];
        %outfile = [outPath num2str(timeScale) '_f_' files(i).name];
        outFile = [outPath files(i).name];
        removeNoiseFromFile(inFile,outFile,limit);
    end
end