rawPath = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Mesures/';
filteredPath = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Mesures/filtered/';
configFile = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Codes/systemCharacteristics.txt';
sysInfo = getSysInfo(configFile);
date = '1607*';
%% read data
data = readData(filteredPath,'1607*');
%% save data
saveData(data,filteredPath);

%% filter data
limit = -64;
timeScale = 16;
timeGap = 4;
timeDev = 0.3;
%newData = filterData(data,limit,timeScale,timeGap,timeDev);
filterFiles(rawPath,filteredPath,limit,timeScale,timeGap,timeDev,'16*');
%%
dates = gdate(data.time);
loss = getAirLosses(data,sysInfo);
plotWithDates(loss)
%hold on;

