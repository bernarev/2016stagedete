%*********************************************************************** 
%									 
%	-- reads "data" and saves its content at "directory" in a .txt file
%   called "name"
%
%	-> Usage = 
%		-> saveData(data,name,directory)
%
%	-> inputs =	
%       -> data struct, containing the following 3 elements:
%			pow  - ARRAY OF FLOATS with measures of power (in dB)
%			time - ARRAY OF STRUCT with time of measures
%                   time.year     - year of measure
%                   time.month    - month of measure
%                   time.day      - day of measure
%                   time.hour     - hour of measure
%                   time.minute   - minute of measure
%                   time.second   - second of measure
%                   time.tthOfMil - number of tthOfMil
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
%		-- none --
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	2
%   - v2: correction of "tthOfMil" time component
%
%	last edited in:	24/08/2016 					 
%									 
%*********************************************************************** 
function saveData(data,name,directory)

    %% get data to be stored in file
    pow = num2str(data.pow,'%10.2f');
    att = num2str(data.att,'%10.2f');
    
    hour = num2str(data.time.hour,'%02i');
    minute = num2str(data.time.minute,'%02i');
    second = num2str(data.time.second,'%02i');
    tthOfMil = num2str(data.time.tthOfMil,'%04i');
    
    %% create matrix
    n = length(hour);
    space = repmat('  ',[n 1]);
    comma = repmat(',',[n 1]);
    stop = repmat(':',[n 1]);
    time = [hour stop minute stop second comma tthOfMil];
    outMatrix = [pow space time space att];
    
    %% write file
    filename = sprintf('%s%s',directory,name);
    fileID = fopen(filename,'w');
    for i = 1:size(outMatrix,1)
        fprintf(fileID,'%s\n',outMatrix(i,:));
    end
    fclose(fileID);
end
    
    
    