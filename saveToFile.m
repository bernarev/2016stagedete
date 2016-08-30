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
%                   time.ffff - tenths of miliseconds
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
% 	Code version:	4
%   - v2: correction of "tthOfMil" time component
%   - v3: modification of time structure component names
%   - v4: change of name
%
%	last edited in:	30/08/2016 					 
%									 
%*********************************************************************** 
function saveToFile(data,name,directory)

    %% get data to be stored in file
    pow = num2str(data.pow,'%10.2f');
    att = num2str(data.att,'%10.2f');
    
    hour = num2str(data.time.hh,'%02i');
    minute = num2str(data.time.mm,'%02i');
    second = num2str(data.time.ss,'%02i');
    tthOfMil = num2str(data.time.ffff,'%04i');
    
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
    
    
    