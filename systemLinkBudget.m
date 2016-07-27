%*********************************************************************** 
%									 
%	-- Simple script with all the chracteristic values of the system
%
%	-> Usage = 
%		-> AirLoss = systemLinkBudget(pow,att)
%
%	-> inputs =
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
% 	Code version:	1
%
%	last edited in:	27/07/2016 					 
%									 
%*********************************************************************** 
function AirLoss = systemLinkBudget(pow,att)

    % ---- link budget (bilan de liaison) ----
    power = 55;             % power generated (dBW)
    lossCables = 1;         % losses at the cables (dB)
    transAntennaPow = 30;   % gain of the emission antenna (dB)
    recepAntennaPow = 24;   % gain of the reception antenna (dBi)
    F = 3.5;                %
    amp = 24.3;             % reception amplification (dB)

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