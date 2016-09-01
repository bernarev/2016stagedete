%*********************************************************************** 
%									 
%	-- Calculates air loss.
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
%		-> airLosses = getAirLosses(data,systemInfo)
%
%	-> inputs =
%		-> data       - STRUCT containing data
%       -> systemInfo - STRUCT containing system info
%	
%	-> outputs = 	
%		-> airLosses  - STRUCT containing losses at air and time of
%       occurence
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
function airLosses = getAirLosses(data,systemInfo)
  
    type = systemInfo.type;
    variable = systemInfo.variable;
    value = systemInfo.value;
    
    pow = data.pow;
    att = data.att;
    inputPower = sum(value(type == 'p'));    % input power
    otherGains = sum(value(type == 'g'));  % sum of gains
    otherLosses = sum(value(type == 'l'));  % sum of losses
    
    % calculated losses between the antennae
    airLosses = (inputPower + otherGains) - (pow + att + otherLosses);
    airLosses = struct('value',airLosses,'time',data.time);
end
