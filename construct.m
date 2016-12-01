function [ P,messP, tempP] = construct( sampsize )
%construct a probability matrix for fourier series modification
%and some other important temporary numbers which will be used many times
%and stay the same as long as the samplesize stays the same.
T = sampsize-1;
k = [2:1:sampsize]';
P = ones(T, 2*floor(T/2-1)+1);
P(:,1) = 0.5 * P(:,1);
Ka = [1:1:floor(T/2-1)];
for i = 1:floor(T/2-1)
    P(:,i*2) = cos(i*2*pi*k/T);
    P(:,i*2+1) = sin(i*2*pi*k/T);
end
messP = (P'*P)^(-1)*P';    % least square method
temp = 2*pi*(sampsize+1)/T;
Kac = cos(Ka*temp);
Kas = sin(Ka*temp);
tempP = [Kac' Kas'];
tempP = reshape(tempP',1,[]);
tempP = [0.5 tempP];
end

