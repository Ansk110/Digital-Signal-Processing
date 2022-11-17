clc;clear;
n = 1:1:10;
N = 10;
g = log10(n);
rt = rate(g(:,1), g(:,2), n);
R = 2*cos(pi*2*n/N);
a = ceil(average(rt));

subplot(2,2,1), stem(n, g); hold on
xlabel("number of years");
ylabel("ht of plants");
title("growth graph");

subplot(2,2,2), stem(n, rt); hold on
xlabel("number of years");
ylabel("rate of increase in ht");
title("growth graph");

subplot(2,2,3), stem(n, R); hold on
xlabel("number of years");
ylabel("change in range of height");

function[av] = average(s)
l = length(s);
av = sum(s)/l;
end

function r = rate(a, b, n)
    r = [];
    for i = 1 : length(n)
        r = [r (b-a) / n(i) ];
    end
end
    
