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
% 	Code version:	2.1
%   - v2.1: removed "ffff" (tenths of miliseconds) from time structure
%
%	last edited in:	31/08/2016 						 
%									 
%***********************************************************************

function newData = selectData(data,selectionVector)
    %% selection of data
    pow = data.pow(selectionVector);
    att = data.att(selectionVector);
    
    year = data.time.YY(selectionVector);
    month = data.time.MM(selectionVector);
    day = data.time.DD(selectionVector);
    hour = data.time.hh(selectionVector);
    minute = data.time.mm(selectionVector);
    second = data.time.ss(selectionVector);

    %% final definition of data structure
    time = struct('YY',year,'MM',month,'DD',day,'hh',hour,'mm',minute,'ss',second);
    newData = struct('pow',pow,'time',time,'att',att);
end