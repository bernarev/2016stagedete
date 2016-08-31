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
% 	Code version:	2.1
%   - v2.1: removed "ffff" (tenths of miliseconds) from time structure
%
%	last edited in:	31/08/2016 					 
%									 
%***********************************************************************

function dataBlock = arrangeData(data,h1,h2)
    %% selection of data
    
    if(h2 > length(data.pow))
        h2 = length(data.pow);
    end
    
    pow = data.pow(h1:h2);
    att = data.att(h1:h2);

    year = data.time.YY(h1:h2);
    month = data.time.MM(h1:h2);
    day = data.time.DD(h1:h2);
    hour = data.time.hh(h1:h2);
    minute = data.time.mm(h1:h2);
    second = data.time.ss(h1:h2);

    %% final definition of data structure
    time = struct('YY',year,'MM',month,'DD',day,'hh',hour,'mm',minute,'ss',second);
    dataBlock = struct('pow',pow,'time',time,'att',att);
end