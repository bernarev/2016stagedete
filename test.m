filename = '/home/ebernardes/Área de Trabalho/Mesures/160318.txt';

fileID = fopen(filename);
	
% read measures as strings
pattern = '%s %s %s';
rawData = textscan(fileID,pattern);
rawTime = cell2mat(rawData{2});

time.day = str2num(rawTime(:,1:2));
    time.month = str2num(rawTime(:,4:5));
    time.year = str2num(rawTime(:,7:8));
    time.hour = str2num(rawTime(:,10:13));