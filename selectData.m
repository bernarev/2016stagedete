%*********************************************************************** 
%									 
%	-- Select data from "data" array using a selection vector
%
%	-> Usage = 
%		-> newData = selectData(data,selectionVector)
%
%	-> inputs =
%		-> newData - STRUCT with selected data
%		-> selectionVector - vector of zeros and ones
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
% 	Code version:	3
%       - v2: name change
%       - v3: insertion of sample in "time" struct
%
%	last edited in: 22/08/2016 					 
%									 
%***********************************************************************

function newData = selectData(data,selectionVector)
    %% selection of data
    pow = data.pow(selectionVector);
    att = data.att(selectionVector);
    
    year = data.time.year(selectionVector);
    month = data.time.month(selectionVector);
    day = data.time.day(selectionVector);
    hour = data.time.hour(selectionVector);
    minute = data.time.minute(selectionVector);
    second = data.time.second(selectionVector);
    sample = data.time.sample(selectionVector);

    %% final definition of data structure
    time = struct('year',year,'month',month,'day',day,'hour',hour,'minute',minute,'second',second,'sample',sample);
    newData = struct('pow',pow,'time',time,'att',att);
end