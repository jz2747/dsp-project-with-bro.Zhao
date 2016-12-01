function [] = Markovtrain(traindata, sampsize) 
global markovP;
windownum = length(traindata)-sampsize;
[P, messP,tempP] = construct(sampsize);
for i = 1:windownum
   %x = traindata(i:i+sampsize-1);
   [predvalue, Ek, sec_res, lastpred] = grey_fourier_pred(traindata(i:i+sampsize-1), sampsize, P, messP, tempP); 
   next_sec_res =  traindata(i+sampsize) - predvalue - Ek;  % sec_res => next_sec_res Markov transition
   j = 100*next_sec_res/predvalue;
   j = floor(j)+6;
   k = 100*sec_res/lastpred;
   k = floor(k)+6;
   if j >= 1 && j<=10 && k >= 1 && k <= 10
      markovP(k,j) = markovP(k,j) + 1;
   end
end
end



