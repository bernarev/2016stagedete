%*********************************************************************** 
%									 
%	-- Select data from "data" array using a selection vector
%
%	-> Usage = 
%		-> joinedData = joinData(separatedData)
%
%	-> inputs =
%		-> separatedData  - CELL ARRAY, each cell contaning one of the data
%       blocks
%
%	-> outputs = 	
%       -> joinedData  - STRUC with rejoined data
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
% 	Code version:	4
%   - v2: name change
%   - v3: insertion of sample in "time" struct
%   - v4: correction of "tthOfMil" time component
%
%	last edited in: 24/08/2016 					 
%									 
%***********************************************************************

function joinedData = joinData(separatedData)
    N = length(separatedData);
    
    pow = [];
    att = [];
    
    year = [];
    month = [];
    day = [];
    hour = [];
    minute = [];
    second = [];
    tthOfMil = [];
    
    for i = 1:N
        ithData = separatedData{i};
        
        pow = [pow; ithData.pow];
        att = [att; ithData.att];
        year = [year; ithData.time.year];
        month = [month; ithData.time.month];
        day = [day; ithData.time.day];
        hour = [hour; ithData.time.hour];
        minute = [minute; ithData.time.minute];
        second = [second; ithData.time.second];
        tthOfMil = [tthOfMil; ithData.time.tthOfMil];
    end

    %% final definition of data structure
    time = struct('year',year,'month',month,'day',day,'hour',hour,'minute',minute,'second',second,'tthOfMil',tthOfMil);
    joinedData = struct('pow',pow,'time',time,'att',att);
end