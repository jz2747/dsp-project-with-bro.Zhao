function [goodwin] = optimumwindow(traindata)
goodwin = 0;
miner = 100;
for sampsize = 5:12  %set a range for windowsize
    pdx = traindata;
    windownum = length(traindata)-sampsize;
    [P, messP,tempP] = construct(sampsize);
    for i = 1:windownum
        x = traindata(i:i+sampsize-1);
        %[predvalue, Ek, sec_res] = grey_fourier_pred(x, sampsize, P, messP, tempP)
        [predvalue, Ek, sec_res, lastpred] = grey_fourier_pred(x, sampsize, P, messP, tempP);  
        pdx(i+sampsize) = predvalue;
    end
    ercount = sum(abs(pdx-traindata)./traindata) / windownum; %%%%%%%
    if ercount < miner
        miner = ercount;
        goodwin = sampsize;
    end
end
end



