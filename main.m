path = '/home/ebernardes/Área de Trabalho/Mesures/';
year = '16';
month = '07';
day = '07';

[pow,time,att] = readAllMeasures(path,year,month,day);
[values,cdf] = getCDF(pow);

h = values(2) - values(1);
pdf = diff(cdf)/h;