clear;clc;close all;
for Scenario=1:10
    g=timeVis(Scenario);
    saveas(g,['images/Time-scenario-' num2str(Scenario) '.png']);
end
