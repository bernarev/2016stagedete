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
%       -> timeVector - ARRAY: time sequence
%
%		-> timeGap  - NUMBER: theoretical time distance between direct
%       bursts
%
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
% 	Code version:	3
%   - v2: correction of input time format
%   - v3: correction of documentation
%
%	last edited in:	30/08/2016 
%									 
%***********************************************************************

function indexes = findSeries(timeVector,timeGap,timeDev)
    %% gets time from data as seconds
    
    % normalises time array
    timeVector = timeVector - timeVector(1);
    
    %% get gaps matrix
    % creates all possible combinations of time indexes
    [Y, X] = meshgrid(1:length(timeVector));
    
    % creates matrix with the combinations of every gap
    G = timeVector(X) - timeVector(Y);
    G = abs(G);
    
    %% finding desired gaps
    % remove all gaps that are not multiple of "timeGap" 
    % with "timeDev" hysteresis
    test = abs(mod(G, timeGap));
    G(test > timeDev & test < timeGap - timeDev) = 0;
    
    % creates a counter vector that counts all gaps that are not zeros
    % holds the number of elements in the relevant series of each 
    % time sample.
    C = sum(G > 0, 1);
    
    % return indexes belonging to the maximum series
    indexes = (C == max(C));
end
