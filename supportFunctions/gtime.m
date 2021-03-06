%*********************************************************************** 
%									 
%	-- Simple script to get string array with times of measures
%
%	-> Usage = 
%		-> timeString = gdate(time)
%
%	-> inputs =
%       -> time   - STRUC containing data time
%	
%	-> outputs = 	
%       -> timeString - ARRAY either in format hh:mm:ss or hh:mm:ss,ffff
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
% 	Code version:	2.2
%   -v2.1: corrected format of hour to 2 digits
%   -v2.2: removed option
%
%	last edited in:	01/09/2016 					 
%									 
%***********************************************************************
function timeString = gtime(time)
    n = length(time.YY);
    ddot = repmat(':',n,1);

    second = time.ss;
    tthOfMil = int32(10000.*mod(second,1));

    ss = num2str(floor(second),'%02i');
    
    comma = repmat(',',n,1);
    ffff = num2str(tthOfMil,'%04i');
    timeString = [num2str(time.hh,'%02d') ddot num2str(time.mm,'%02d') ddot ss comma ffff];

end