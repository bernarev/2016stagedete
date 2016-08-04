%*********************************************************************** 
%									 
%	-- Read data from multiples files generated by the LabView application
%
%	-> Usage = 
%		-> [data,fileNames] = readAllMeasures(path,year,month,day)
%
%	-> inputs =
%		-> path  - STRING defining location of files
%		-> year  - STRING defining year
%		-> month - STRING defining month
%		-> day   - STRING defining day
%
%       OBS.: 'year', 'month' and 'day' must be either two-digit numbers
%       or '*' for wildcard
%	
%	-> outputs = 	
%       -> data  - STRUC, containing the following 3 elements:
%          = pow  - ARRAY OF FLOATS with measures of power (in dB)
%          = time - ARRAY OF STRUCT with time of measures
%                   time.hour    - day of measure
%                   time.minute  - month of measure
%                   time.second   - year of measure
%          = att  - ARRAY OF FLOATS with attenuation levels of each measure
%
%       -> fileNames ARRAY OF STRINGS with names of loaded files
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--
%
% 	-> Other dependencies: 
%		- myCell2Mat.m
%		- readMeasures.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	3
%   - v2: correction of "time" struct
%   - v3: definition of "data" struct
%
%	last edited in:	04/08/2016 					 
%									 
%***********************************************************************

function [data,fileNames] = readAllMeasures(path,year,month,day)

    selectedFiles = sprintf('%s%s%s%s.txt', path, year, month, day);

    files = dir(selectedFiles);
    fileNames = [];
    n = length(files);
    for i=1:n
        fileNames = [fileNames; files(i).name];
    end

    pow = [];
    att = [];
    
    hour = [];
    minute = [];
    second = [];
   
    for i = 1:n

        ithFilePath = sprintf('%s%s', path, fileNames(i,:));
        ithData = readMeasures(ithFilePath);

        pow = [pow;ithData.pow];
        att = [att;ithData.att];
        
        hour = [hour;ithData.time.hour];
        minute = [minute;ithData.time.minute];
        second = [second;ithData.time.second];
        
    end
    
    time = struct('hour',hour,'minute',minute,'second',second);
    
    data = struct('pow',pow,'time',time,'att',att);
end