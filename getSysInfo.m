%*********************************************************************** 
%									 
%	-- Loads all the chracteristic values of the system.
%
%   The type of the parameter must be one of the following:
%   -p	Input power
%   -l	Point losses in the system
%   -g	Point gains in the system
%
%   Usually, there should only be one 'Input Power', but the program will accept
%   more than one.
%
%	-> Usage = 
%		-> systemInfo = getSysInfo(systemFile)
%
%	-> inputs =
%       -> systemFile - STRING pointing to the path of the .txt file that
%       stores the system characteristics
%	
%	-> outputs = 	
%		-> systemInfo - STRUCT containing system info
%								 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%       -- none --
%
% 	-> Other dependencies:  
%       -- none --
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	2.0
%
%	last edited in:	01/09/2016 					 
%									 
%*********************************************************************** 
function systemInfo = getSysInfo(systemFile)

    fileID = fopen(systemFile);
	
    % read measures as strings
	pattern = '-%c %s %f';
    rawData = textscan(fileID,pattern,'CommentStyle','%');
    
    
    % extraction of variables   
    type = rawData{1};
    variable = rawData{2};
    value = rawData{3};

    % system info
    systemInfo = struct('type',type,'variable',variable,'value', value);
end
