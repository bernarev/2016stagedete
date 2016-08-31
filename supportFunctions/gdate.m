%*********************************************************************** 
%									 
%	-- Simple script to get string array with dates of measures
%
%	-> Usage = 
%		-> date = gdate(time)
%
%	-> inputs =
%       -> time  - STRUC containing data time
%	
%	-> outputs = 	
%       -> date  - ARRAY of dates in format YY/MM/DD
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
% 	Code version:	2.0
%
%	last edited in:	31/08/2016 					 
%									 
%***********************************************************************
function date = gdate(time)
    n = length(time.YY);
    slash = repmat('/',n,1);
    date = [num2str(time.YY) slash num2str(time.MM,'%02d') slash num2str(time.DD,'%02d')];
end