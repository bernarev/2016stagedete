%*********************************************************************** 
%									 
%	-- Gets highest value compared to its neighboring values 
%   (MUST ONLY BE USED AFTER FINDING THE REAL SERIES)
%
%	-> Usage = 
%		-> indexes = getHighestValues(data,timeDev)
%
%	-> inputs =
%       -> data     - STRUC, containing data
%
%		-> timeDev  - NUMBER: accepted deviation from timeGap
%	
%	-> outputs = 	
%       -> indexes  - ARRAY, indexes of measured direct bursts
%									 
%	-> MATLAB version used:	
%		- R2012b (8.0.0.783) 64-bit	
%				 
% 	-> Special toolboxes used: 
%		-- none	--
%
% 	-> Other dependencies: 
%		- gsec.m
%									 
%	-> Created by Evandro Bernardes	 								 
%		- at ENSTA Bretagne (Brest, Britanny, France)							 								 
%		- In association with: 
%			ANFR - Agence Nationale de Fréquence    		 
%									 
% 	Code version:	1
%
%	last edited in:	30/08/2016 
%									 
%***********************************************************************
function indexes = getHighestValues(data,timeDev)

    %% initialization
    indexes = [];           % initialization of index array
    init = 1;               % initialization of first element of test set
    delta = 2*timeDev;      % 2 times the deviation
    time = gsec(data.time); % get time vector in seconds

    %% testing loop
    while(init <= length(time))
        %% define limits of the testing set
        low = time(init);
        high = low + delta;

        %% BOOL vector showing which values are in the current test set
        timeTest = time >= low & time <= high;
        
        %% selecting power values from the current test set
        powTest = data.pow(timeTest);

        %% construction of selection array
        indexes = [indexes; powTest == max(powTest)];
        init = init + sum(timeTest);
    end
    
    %% convertion of integer array to bool array
    indexes = indexes == 1;
end