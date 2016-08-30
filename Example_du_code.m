%% selectionner et filtrer les fichiers désirés

% fichier des mesures
dataPath = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Mesures/';

% fichier où les nouvelles données sont mises après l'enlèvement de
% toutes les valeurs plus petites que le niveau de bruit "limit"
dataPath1 = [dataPath 'filter1/'];

% fichier où les données déjà filtrées selon le niveau de bruit seront
% sauvegardées après trouver les vraies valeurs
dataPath2 = [dataPath 'filter2/'];

% selection des données désirées (le "*" fait que tous les jours seront
% selectionés.)
year = '16';
month = '07';
day = '*';
date = [year month day];

limit = -64;    % niveau de bruit
timeGap = 4;    % intervalle théorique entre les emissions
timeDev = 0.1;  % déviation accepté de l'intervalle de temps

% on accepté que les données sont décalées de :
% timeGap - timeDev à timeGap + timeDev

% enlèvement des données dont las puissance sont trop basses
removeNoiseFromAllFiles(dataPath,dataPath1,limit,date);

% cherche la vraie séquence de données
% la variable "timeScale" défine que les données vont être séparées en des
% séquences de 14 secondes avant de les tester
timeScale = 14;
filterAllFiles(dataPath1,dataPath2,timeScale,timeGap,timeDev,date);

%% lecture des nouveaux données
[data,files] = readAllMeasures(dataPath2,date);

%% calcule des pertes et plot de la CDF et de la PDF
pow = data.pow;
att = data.att;

configFile = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Codes/systemCharacteristics.txt';

% loss calculations following the characteristics of the system
% -> read "systemLinkBudget.m" for details
AirLosses = systemLinkBudget(pow,att,configFile);

% calculation of probability functions with Statistics toolbox
[cdf,xi] = ecdf(AirLosses);
[pdf,xj] = ksdensity(AirLosses);

plotTitle = sprintf('Empirical CDF \nData from:\t%s/%s/%s\n\t\tdd/mm/yy', day, month, year);
figure(1); plot(xi,100*cdf,'r','LineWidth',2);
title(plotTitle);
axis([120 200 0 110]);
xlabel('Loss in air (dB)');
ylabel('Percentage of probability');

plotTitle = sprintf('Empirical PDF \nData from:\t%s/%s/%s\n\t\tdd/mm/yy', day, month, year);
figure(2); plot(xj,pdf,'LineWidth',2);
axis([120 200 0 0.3]);
title(plotTitle);
xlabel('Losses in air (dB)');

