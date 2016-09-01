rawPath = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Mesures/';
dataPath = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Mesures/filtered/';
configFile = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Codes/systemCharacteristics.txt';
sysInfo = getSysInfo(configFile);
%%
limit = -64;
timeScale = 18;
timeGap = 4;
timeDev = 0.25;
date = '16*';
filterFiles(rawPath,dataPath,limit,timeScale,timeGap,timeDev,date);
%% plot loss in July
dataAugust = readData(dataPath,'1608*');
loss = getAirLosses(dataAugust,sysInfo);

% using dates of each measure to create labels
timeLabels = gdate(dataAugust.time);

figure(1)
% this function finds only the exact points within the data where the 
% label should change. Also rotate labels in 90 degrees
plotWithDates(loss,timeLabels,90);
axis([0 length(data.pow) 80 200])
xlabel('Date');
ylabel('Losses in dB');
title('Air losses in August');
%% plot losses in 30th and 31st of August
clear dataTmp
dataTmp{1} = readData(dataPath,'160830');
dataTmp{2} = readData(dataPath,'160831');
data = joinData(dataTmp);

loss = getAirLosses(data,sysInfo);

% using 'day, hour' as label
comma = repmat(', ',[length(loss.pow) 1]);
day = num2str(loss.time.DD,'%02i');
hours = num2str(loss.time.hh,'%02i');

timeLabels = [day comma hours];
figure(2)
plotWithDates(loss,timeLabels,90);
axis([0 length(data.pow) 80 200]);
xlabel('Hour');
ylabel('Loss in dB');
title('Air losses in 30th and 31st of August');

%%
data = readData(dataPath,'1607*');
loss = getAirLosses(data,sysInfo);
[cdf,xi] = ecdf(loss.pow);
[pdf,xj] = ksdensity(loss.pow);

figure(3)
plot(xi,cdf);

figure(4)
plot(xj,pdf);

%%
plotWithDates(loss.pow,gdate(loss.time),90);