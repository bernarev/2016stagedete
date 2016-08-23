%*********************************************************************** 
%									 
%	-- Arrange data into block for "separateData.m" function. Takes
%   from "data" array and select only data between "h1" and "h2" indexes
%
%	-> Usage = 
%		-> dataBlock = arrangeData(data,h1,h2)
%
%	-> inputs =
%       -> data  - STRUC, containing the following 3 elements:
%          = pow  - ARRAY OF FLOATS with measures of power (in dB)
%          = time - ARRAY OF STRUCT with time of measures
%          = att  - ARRAY OF FLOATS with attenuation levels of each measure
%
%		-> h1    - First index
%		-> h2    - Second index
%	
%	-> outputs = 	
%       -> dataBlock  - STRUC, block of arranged data
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
% 	Code version:	2
%   - v2: insertion of sample in "time" struct
%
%	last edited in:	22/08/2016 					 
%									 
%***********************************************************************

function dataBlock = arrangeData(data,h1,h2)
    %% selection of data
    
    if(h2 > length(data.pow))
        h2 = length(data.pow);
    end
    
    pow = data.pow(h1:h2);
    att = data.att(h1:h2);

    year = data.time.year(h1:h2);
    month = data.time.month(h1:h2);
    day = data.time.day(h1:h2);
    hour = data.time.hour(h1:h2);
    minute = data.time.minute(h1:h2);
    second = data.time.second(h1:h2);
	sample = data.time.sample(h1:h2);

    %% final definition of data structure
    time = struct('year',year,'month',month,'day',day,'hour',hour,'minute',minute,'second',second,'sample',sample);
    dataBlock = struct('pow',pow,'time',time,'att',att);
end