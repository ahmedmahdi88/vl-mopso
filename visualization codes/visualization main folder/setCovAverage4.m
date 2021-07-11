% clear;close all;
cont = 1;
for problemNumber=1:9
for Scenario=1:10
    AddRequiredPaths;
   for cv = (classesvl)
        paretovlSep{cv} = [];
       for ps = 1:numel(paretoSetvl)
           if length(paretoSetvl{ps}{:})==(cv)
               paretovlSep{cv} = [paretovlSep{cv} ; paretoFrontvl(ps,:)];
           end
       end
       C_VL_N2{cont,cv} = SetCoverage2(paretovlSep{cv},pno);
       C_N2_VL{cont,cv} = SetCoverage2(pno,paretovlSep{cv});
   end

cont = cont + 1;
end
end
%%
f11 = figure;
subplot(1,2,1)
for i =  1:numel(C_VL_N2)
if isempty(C_VL_N2{i})
C_VL_N2{i} = nan;
end
end
fm = [C_VL_N2{:,:}];
fm = reshape(fm,cont-1,size(C_VL_N2,2));
for lb = 1:size(C_VL_N2,2)
    labels{lb} = lb;
end

ax=boxplot(fm,'Labels',labels);
set(gcf,'color','w');
set(gca,'FontSize',6);
set(ax,'LineWidth', 2);
set(gca,'XTickLabelRotation', 45);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
ylim([0 1])

subplot(1,2,2)
for i =  1:numel(C_N2_VL)
if isempty(C_N2_VL{i})
C_N2_VL{i} = nan;
end
end
fm = [C_N2_VL{:,:}];
fm = reshape(fm,cont-1,size(C_N2_VL,2));
for lb = 1:size(C_N2_VL,2)
    labels{lb} = lb;
end

ax=boxplot(fm,'Labels',labels);
set(gcf,'color','w');
set(gca,'FontSize',6);
set(ax,'LineWidth', 2);
set(gca,'XTickLabelRotation', 45);
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
ylim([0 1])

suptitle('Histogram of SetCoverage Respect To Each Class For CEC2020 Functions');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gcf,'color','w');


p=pwd;p(p=='\')='/';
folder='mathAll-Functions';
saveas(f11, [p '/results images/' folder '/setCovSC_N2_1.png'])


%% 
clc;
close all;
disp('save is done');