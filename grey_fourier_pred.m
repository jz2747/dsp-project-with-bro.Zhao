function [predvalue, Ek, sec_res, lastpred] = grey_fourier_pred(x, sampsize, P, messP, tempP)
%predvalue is the prediction of the next value from gray model.
%Ek is the estimated residual error between the actual next-value and prediction 
%from gray model. second residual of the last value of modelling series is
%sec_res
x_1 = x;
z = x_1;
for i = 5:sampsize
    x_1(i) = x(i) + x_1(i-1);
    z(i) = 0.5*x_1(i) + 0.5*x_1(i-1);
end
X = ones(sampsize-1,2);
X(:,1) = -z(2:sampsize);
Y = x(2:sampsize); 
theta = (X'*X)^(-1)*X'*Y;
a = theta(1);
b = theta(2);
k = [1:1:sampsize]';
predx = (1-exp(a))*(x_1(sampsize)-b/a)*exp(-a*(k-sampsize));
predvalue = (1-exp(a))*(x_1(sampsize)-b/a)*exp(-a);  %¥Ê“…
%predx = (1-exp(a))*(x(1)-b/a)*exp(-a*(k-1));
%predvalue = (1-exp(a))*(x(1)-b/a)*exp(-a*sampsize);
predx(1) = x(1);
Er = x - predx;      
Er = Er(2:sampsize); %fourier series analysis starts from here
C = messP*Er;    
E = P*C;
E = [0;E];      
Ek = tempP * C; 
lastpred = predx(sampsize);
sec_res = x(sampsize) - predx(sampsize) - E(sampsize);
end

