global markovP;
markovP = zeros(10);
rawdata = sh01;%read the data as column in this line
traindatasize = 16000;  %take the oldest this many samples as traindata;
traindata = rawdata(1:16000);%get traindata in this line
testdatasize = 2584;   %take the most recent this many samples as test data
testdata = rawdata(16001:18584);
sampsize = optimumwindow(traindata); 
Markovtrain(traindata, sampsize);
test(testdata, sampsize);   %markovP is the trained transition probability matrix 



%重新遍历寻找fourier周期
%修改fourier残差公式
%开盘价修正markov
