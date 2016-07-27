%*********************************************************************** 
%									 
%	-- Calculates CDF from data
%
%	-> Usage = 
%		-> [values,cdf] = getCDF(data)
%
%	-> inputs =
%		-> data - ARRAY with data
%	
%	-> outputs = 	
%		-> values -	ARRAY with random variable values
%		-> cdf    -	ARRAY with cdf values
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--		
%
% 	-> Other dependencies:  
%		-- none	--		
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	2
%   - v2: preallocation of arrays 'values' and 'cdf' for speed
%
%	last edited in:	27/07/2016 					 
%									 
%*********************************************************************** 

function [values,cdf] = getCDF(data)

    sortedArray = sort(data);
    noOfMeasures = length(data);
    Dx = (sortedArray(end)-sortedArray(1))/noOfMeasures;

    low = sortedArray(1);

    acum = 0;
    values = zeros(noOfMeasures+1,1);
    cdf = zeros(noOfMeasures+1,1);
    i = 1;
    j = 1;
    while (i <= noOfMeasures)
        while(i <= noOfMeasures && sortedArray(i) <= low)
            acum = acum + 1;
            i = i+1;
        end
        values(j) = low;
        cdf(j) = acum;
        low = low + Dx;
        j = j + 1;
    end

    cdf = cdf/noOfMeasures;
end