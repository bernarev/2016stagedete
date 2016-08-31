readPath = 'Mesures/';
savePath = 'Mesures/test/';
date = '1607*';
%% read data
data = readData(readPath,date);

%% save data
saveData(data,savePath);

%% filter data
limit = -64;
timeScale = 16;
timeGap = 4;
timeDev = 0.3;
newData = filterData(data,limit,timeScale,timeGap,timeDev);

%% filter files
% of handling too much data at the same time, it might be a better idea
% to use "filterFiles.m" first to filter all data and save each file 
% individually, reloading them and using them afterwards.
% This doesn't overload the computer's memory
filterFiles(readPath,savePath,limit,timeScale,timeGap,timeDev,date);
