%% initialization and adding paths
p=pwd;p(p=='\')='/';
addpath([p '/visualization codes/source codes']);
%%
clc;disp('Delta visualization');
deltaBoxPlot;
%%
clc;disp('set coverage visualization');
setCovBoxPlot;
%%
clc;disp('RGD visualization');
RGDboxplot;
%%
clc;disp('NDS visualization');
NDSboxplot;
%% Hyper volume box plot
HvBoxplot;
%% execution time boc plot
if problemNumber==1
    timeBoxPlot;
end
%% 
clc;
disp('all done');
%% the end

