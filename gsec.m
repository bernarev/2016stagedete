%*********************************************************************** 
%									 
%	-- Simple script to get time as seconds
%
%	-> Usage = 
%		-> s = gsec(time)
%
%	-> inputs =
%       -> time  - STRUC containing data time
%	
%	-> outputs = 	
%       -> s     - ARRAY of seconds
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
%   - v2: changed parameter from "data" to "time"
%   - v3: correction of "tthOfMil" time component
%   - v4: modification of time structure component names
%
%	last edited in:	30/08/2016 					 
%									 
%***********************************************************************
function s = gsec(time)
    s = time.ss + time.mm*60 + time.hh*60*60 + time.ffff/10000;
end