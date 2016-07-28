path = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Scripts/systemCharacteristics.txt';

fileID = fopen(path);
	
% read measures as strings
pattern = '%s %f';
rawData = textscan(fileID,pattern);
    
% extraction of variables' names
variables = myCell2Mat(rawData{1});
values = rawData{2};