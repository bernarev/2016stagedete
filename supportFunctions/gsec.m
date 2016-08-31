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
% 	Code version:	2.1
%   - v2.1: removed "ffff" (tenths of miliseconds) from time structure
%
%	last edited in:	31/08/2016 					 
%									 
%***********************************************************************
function s = gsec(time)
    s = time.ss + time.mm*60 + time.hh*60*60;
end