%*********************************************************************** 
%									 
%	-- Creates array of numbers from cell of strings representing
%   numbers (either with decimal point or comma)
%
%	-> Usage = 
%		-> outMat = myCell2Mat(inCell)
%
%	-> inputs =
%		-> inCell - CELL ARRAY cell with numbers as strings
%	
%	-> outputs = 	
%		-> outMat -	ARRAY OF FLOATS
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
%	last edited in:	25/07/2016 					 
%									 
%*********************************************************************** 
function outMat = myCell2Mat(inCell)

    if ~iscell(inCell)
        error('Input must be a cell');
    end
    
    lengthOfCell = length(inCell);
    outMat = [];
    for i=1:lengthOfCell
        ithValue = inCell{i};
        ithValue(ithValue == ',') = '.';
        outMat = [outMat; str2num(ithValue)];
    end
end