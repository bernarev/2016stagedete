%*********************************************************************** 
%									 
%	-- Simple script that loads all the chracteristic values of the system
%
%	-> Usage = 
%		-> AirLoss = systemLinkBudget(pow,att,system)
%
%	-> inputs =
%       -> system - STRING pointing to the path of the .txt file that
%       stores the system characteristics
%		-> pow  - ARRAY OF FLOATS with measures of power (in dB)
%		-> att  - ARRAY OF FLOATS with attenuation levels of each measure
%	
%	-> outputs = 	
%		-> AirLoss - ARRAY with calculated losses between the antennae
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
% 	Code version:	2
%   - v2: addition config file as parameter
%
%	last edited in:	27/07/2016 					 
%									 
%*********************************************************************** 
function AirLoss = systemLinkBudget(pow,att,system)

    fileID = fopen(system);
	
    % read measures as strings
	pattern = '%s %f';
    rawData = textscan(fileID,pattern);
    
    % extraction of variables   
    values = rawData{2};

    % ---- link budget (bilan de liaison) ----
    power = values(1);             % power generated (dBW)
    lossCables = values(2);        % losses at the cables (dB)
    transAntennaPow = values(3);   % gain of the emission antenna (dB)
    recepAntennaPow = values(4);   % gain of the reception antenna (dBi)
    F = values(5);                 %
    amp = values(6);               % reception amplification (dB)

    % ---- Link budget calculation ----
    % pow = power - lossCables + transAntennaPow - AIRLOSS + recepAntennaPow...
    % ... - F + amp -att
    %
    % AIRLOSS = (power + transAntennaPow + recepAntennaPow + amp) -...
    % ...- (lossCables + F + att) - pow

    % sum of generating power and gains
    totGain = power + transAntennaPow + recepAntennaPow + amp;
    
    % sum of losses
    totLoss = lossCables + F + att;
    
    % calculated losses between the antennae
    AirLoss = totGain - totLoss - pow;
end
