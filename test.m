%% load file
filePath = '/home/ebernardes/Dropbox/ENSTA/Stage dete/Codes2/Mesures/160318.txt';
rawData = readMeasures(filePath);

%% separate data
timeInterval = 20;
sepData = separateData(rawData,timeInterval);
dataPart = sepData{3};

%% plot one of the intervals
time = gsec(dataPart.time);
time = time - time(1);

figure(1)
stem(time,-dataPart.pow); 
axis([time(1) time(end)+1 0 70])

%% plot filtered interval
delta = 0.4;
sel = findSeries(time,4,delta);
time2 = time(sel == 1);
newData = selectData(dataPart,sel);

figure(2)
stem(time2,-newData.pow,'r'); 
axis([time(1) time(end)+1 0 70])

%% 
tt = [];
init = 1;
%time3 = gsec(newData.time);
%time3 = time3 - time3(1);
dd = 2*delta;

while(init <= length(time2))
    
    a = time2(init);
    b = a + dd;

    timeTest = time2 >= a & time2 <= b;

    powTest = dataPart.pow(timeTest);

    tt = [tt; powTest == max(powTest)];
    init = init + sum(timeTest);
end
tt = tt == 1;

%% 
tt = getBiggerValues(newData,timeDev);
figure(3)
newnewData = selectData(newData,tt);
time3 = time2(tt == 1);
stem(time3,-newnewData.pow,'g'); 
axis([time(1) time(end)+1 0 70])