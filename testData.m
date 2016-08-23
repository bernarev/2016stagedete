%*********************************************************************** 
%									 
%	-- Tries to detect the real direct bursts on "data", accoarding to
%   the theoretical antenna turning time of "timeDif" and saves the 
%   indexes of the results in "indexes" matrix
%
%	-> Usage = 
%		-> indexes = testData(data,timeDif)
%
%	-> inputs =
%       -> data     - STRUC, containing the following 3 elements:
%       = pow   - ARRAY OF FLOATS with measures of power (in dB)
%       = time  - ARRAY OF STRUCT with time of measures
%       = att   - ARRAY OF FLOATS with attenuation levels of each measure
%
%		-> timeDif  - NUMBER: theoretical time distance between direct
%       bursts
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
%		- myCell2Mat.m
%		- readMeasures.m
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
function indexes = testData(data,timeDif)
    %% gets time from data as seconds
    time = gsec(data.time);
    
    % normalises time array
    tt = time - time(1);
    %% creates array for comparison
    N = length(data.pow);
    i = 1;
    comp = zeros(N,N);
    
    % compares the whole time array with each value, N times
    while(i <= N)
        comp(:,i) = mod(tt - tt(i),timeDif);
        i = i + 1;
    end
    
    % A: array with ones for every bad check result
    A = comp ~= 0;
    % B: array storing the sum check of every column of A
    B = sum(A,1);
    %% finding measures
    
    % first real measure
    k = find(B == min(B),1);
    
    % difference of normalised time with the first real measure's time
    Dt = tt - tt(k);

    indexes = mod(Dt,timeDif) == 0;
end