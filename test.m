file = '/home/ebernardes/Área de Trabalho/Mesures/160318.txt';

%data = readMeasures(file);

path = '/home/ebernardes/Área de Trabalho/Mesures/';
year = '16';
month = '*';
day = '*';

[data,fileNames] = readAllMeasures(path,year,month,day);

