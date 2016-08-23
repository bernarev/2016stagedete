%*********************************************************************** 
%									 
%	-- Separate data into blocks accoarding to desired time window
%
%	-> Usage = 
%		-> separatedData = separateData(data,timeScale)
%
%	-> inputs =
%       -> data  - STRUC, containing the following 3 elements:
%          = pow  - ARRAY OF FLOATS with measures of power (in dB)
%          = time - ARRAY OF STRUCT with time of measures
%          = att  - ARRAY OF FLOATS with attenuation levels of each measure
%
%		-> timeScale  - number defining size of each block of data (in sec)
%	
%	-> outputs = 	
%       -> separatedData  - CELL ARRAY, each cell contaning one of the data
%       blocks
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--
%
% 	-> Other dependencies: 
%		-- none --
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

function separatedData = separateData(data,timeScale)
    % get time as seconds
    seconds = gsec(data.time);
    
    i = 1;
    j = 1;
    n = 1;
    separatedData = {};
    
    while(i < length(seconds))
        while(j < length(seconds) && seconds(j) < seconds(i) + timeScale)
            j = j+1;
        end
        separatedData{n} = arrangeData(data,i,j-1);
        i = j;
        j = 1;
        n = n+1;
    end
end