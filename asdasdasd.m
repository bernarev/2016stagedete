%% load
file = '/home/ebernardes/Área de Trabalho/Mesures/160318.txt';
configFile = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Codes/systemCharacteristics.txt';
allData = readMeasures(file);
%% separate
separatedData = separateData(allData,18);

%% gets time from data as seconds
time = gsec(data);

% normalises time array
tt = time - time(1);

    %% creates array for comparison
    N = length(data.pow);
    i = 1;
    comp = zeros(N,N);