function [ mfpredvalue ] = Markovpredict(predvalue, Ek, sec_res, lastpred)
global markovP;
i = 100 * sec_res / lastpred;
i = floor(i)+6;
%[M,j] = max(markovP(i));
%newer = 2*(j-6)+1;
r_sum=sum(markovP,2);
nu=[-4.5:1:4.5]';
if (i < 1)|| (i > 10) ||(r_sum(i)==0)
    next_sec_res = 0;
else
    newer = markovP(i,:)*nu/r_sum(i);
    next_sec_res = predvalue * newer/100;
end
mfpredvalue = predvalue + Ek + next_sec_res;
end



