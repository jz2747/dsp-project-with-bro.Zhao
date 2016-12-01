function [] = test(testdata, sampsize)
pdx = 0*testdata;
fpdx = 0*testdata;
mfpdx = 0*testdata;
windownum = length(testdata)-sampsize;
t = [1:1:length(testdata)];  %for plot only
[P, messP,tempP] = construct(sampsize);
for i = 1:windownum
    x = testdata(i:i+sampsize-1);
    [predvalue, Ek, sec_res, lastpred] = grey_fourier_pred(x, sampsize, P, messP,tempP);
    pdx(i+sampsize) = predvalue;
    fpdx(i+sampsize) = predvalue + Ek;
    mfpdx(i+sampsize) = Markovpredict(predvalue, Ek, sec_res, lastpred);
end
%plot the result from here to the end
erpdx = 100* abs(pdx - testdata)./testdata;
ermfpdx = 100* abs(mfpdx - testdata)./testdata;
erfpdx = 100* abs(fpdx - testdata)./testdata;
figure(1)
plot(t,testdata,t,pdx,t,mfpdx,t,fpdx);
figure(2)
plot(t,erpdx,t,ermfpdx);
figure(3)
plot(t,testdata,t,pdx);
figure(4)
plot(t,testdata,t,mfpdx);
figure(5)
plot(t,testdata,t,fpdx);
figure(6)
plot(t,pdx - testdata,t,fpdx - testdata);
sum(fpdx-testdata)
sum(pdx-testdata)
end


