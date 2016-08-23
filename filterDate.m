%*********************************************************************** 
%									 
%	-- Filter desired dates from data structure
%
%	-> Usage = 
%		-> newData = filterData(data,selection,t1,t2)
%
%	-> inputs =
%		-> data - STRUCT with data
%		-> selection - desired "time" element to test:
%           1 -> year
%           2 -> month
%           3 -> day
%           4 -> hour
%           5 -> minute
%           6 -> second
%		-> t1 - low time limit
%		-> t2 - high time limit
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--		
%
% 	-> Other dependencies:  
%		- selectData.m	
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	1						 
%	last edited in:	04/08/2016 					 
%									 
%***********************************************************************

function newData = filterDate(data,selection,t1,t2)

switch selection
    case 1
        time = data.time.year;
    case 2
        time = data.time.month;
    case 3
        time = data.time.day;
    case 4
        time = data.time.hour;
    case 5
        time = data.time.minute;
    case 6
        time = data.time.second;
    otherwise
        error('invalid selection (must be a number from 1 to 6)');
end
        
    % selection vector with zeros and ones
    selectionVector = (time >= t1 & time <= t2);

    % extractoin of desired data
    newData = selectData(data,selectionVector);

end
