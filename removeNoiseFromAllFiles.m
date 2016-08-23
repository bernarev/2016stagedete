%*********************************************************************** 
%									 
%	-- Loads files from "inPath", select only data having above "limit"
%   and saves files at "outPath"
%
%	-> Usage = 
%		-> removeNoiseFromAllFiles(inPath,outPath,limit,date)
%
%	-> inputs =
%		-> inPath     - path to raw files
%		-> outPath    - path to new files
%		-> limit      - noise limit
%		-> date       - STRING defining date in the format "YYMMDD"
%
%       OBS.: 'YY', 'MM' and/or 'DD' can be changed for '*' if any of 
%       them should be a wildcard
%								 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		- Statistics Toolbox (Version 8.1)	
%
% 	-> Other dependencies:  
%       - selectData.m
%       - removeNoiseFromFile.m
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

function removeNoiseFromAllFiles(inPath,outPath,limit,date)
   
    % finding desired files
    filesSelection = sprintf('%s%s.txt', inPath, date);
    files = dir(filesSelection);
    
    for i=1:length(files);
        inFile = [inPath files(i).name];
        %outfile = [outPath num2str(timeScale) '_f_' files(i).name];
        outFile = [outPath files(i).name];
        removeNoiseFromFile(inFile,outFile,limit);
    end
end