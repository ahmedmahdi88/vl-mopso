clear;clc;close all;
for s=1:10
    f1=figure;
    HvVisualizationComp(s);
    p=pwd;
    saveas(f1,[p '\rosenLevy-images\HV-rl-scenario' num2str(s) '.png']);
end