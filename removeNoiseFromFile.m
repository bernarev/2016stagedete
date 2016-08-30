%*********************************************************************** 
%									 
%	-- Select only data with power over "limit"
%
%	-> Usage = 
%		-> removeNoiseFromFile(inFile,outFile,limit)
%
%	-> inputs =
%		-> inFile     - path to raw data
%		-> outFile    - path to new file
%		-> limit      - noise limit
%								 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		- Statistics Toolbox (Version 8.1)	
%
% 	-> Other dependencies:  
%       - readMeasures.m
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

function removeNoiseFromFile(inFile,outFile,limit)
    data = readMeasures(inFile);
    selectionVector = data.pow >= limit;
    filteredData = selectData(data,selectionVector);
    saveToFile(filteredData,'',outFile);
end