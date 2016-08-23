%*********************************************************************** 
%									 
%	-- Tries to detect the real direct bursts on "data", according to
%   the theoretical antenna turning time of "timeGap" and taking a into
%   account a deviation of "timeDeviation", saving the results in the
%   "indexes" matrix
%
%	-> Usage = 
%		-> indexes = findSeries(timeVector,timeGap,timeDev)
%
%	-> inputs =
%       -> data     - STRUC, containing the following 3 elements:
%           = pow   - ARRAY OF FLOATS with measures of power (in dB)
%           = time  - ARRAY OF STRUCT with time of measures
%           = att   - ARRAY OF FLOATS with attenuation levels of each measure
%
%		-> timeGap  - NUMBER: theoretical time distance between direct
%       bursts
%		-> timeDev  - NUMBER: accepted deviation from timeGap
%	
%	-> outputs = 	
%       -> indexes  - ARRAY, indexes of measured direct bursts
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--
%
% 	-> Other dependencies: 
%		- gsec.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	1
%
%	last edited in:	18/08/2016 					 
%									 
%***********************************************************************

function indexes = findSeries(timeVector,timeGap,timeDev)
    %% gets time from data as seconds
    time = gsec(timeVector);
    
    % normalises time array
    time = time - time(1);
    
    %% get gaps matrix
    % creates all possible combinations of time indexes
    [Y, X] = meshgrid(1:length(time));
    
    % creates matrix with the combinations of every gap
    G = time(X) - time(Y);
    G = abs(G);
    
    %% finding desired gaps
    % remove all gaps that are not multiple of "timeGap" 
    % with "timeDeviation" hysteresis
    G(abs(mod(G, timeGap)) > timeDev) = 0;
    
    % creates a counter vector that counts all gaps that are not zeros
    % holds the number of elements in the relevant series of each 
    % time sample.
    C = sum(G > 0, 1);
    
    % return indexes belonging to the maximum series
    indexes = (C == max(C));
end