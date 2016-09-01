%*********************************************************************** 
%									 
%	-- reads "data" and saves its content at "directory" in a .txt file
%   called "name"
%
%	-> Usage = 
%		-> saveToFile(data,name,directory)
%
%	-> inputs =	
%       -> data struct, containing the following 3 elements:
%			pow  - ARRAY OF FLOATS with measures of power (in dB)
%			time - ARRAY OF STRUCT with time of measures
%                   time.YY   - year of measure
%                   time.MM   - month of measure
%                   time.DD   - day of measure
%                   time.hh   - hour of measure
%                   time.mm   - minute of measure
%                   time.ss   - second of measure
%			att  - ARRAY OF FLOATS with attenuation levels of each measure
%
%       -> name, STRING name of file
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--
%
% 	-> Other dependencies: 
%		- gtime.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	2.3
%   - v2.1: removed "ffff" (tenths of miliseconds) from time structure
%   - v2.2: addition of "gtime.m" function
%   - v2.3: removed option from "gtime.m" function
%
%	last edited in:	01/09/2016 				 
%									 
%*********************************************************************** 
function saveOneFile(data,name,directory)

    %% get data to be stored in file
    pow = num2str(data.pow,'%10.2f');
    att = num2str(data.att,'%10.2f');
    time = gtime(data.time);
    
    %% create matrix
    n = length(data.pow);
    space = repmat('  ',[n 1]);
    outMatrix = [pow space time space att];
    
    %% write file
    filename = sprintf('%s%s',directory,name);
    fileID = fopen(filename,'w');
    for i = 1:size(outMatrix,1)
        fprintf(fileID,'%s\n',outMatrix(i,:));
    end
    fclose(fileID);
end
    
    
    