% function   SetCoverageVisualizationComp(s)
% Scenario=s;
% AddRequiredPaths;
C_MOmut_VL = SetCoverage2(paretoFront,paretoFrontvl);
C_VL_MOmut = SetCoverage2(paretoFrontvl,paretoFront)
somedata=[C_MOmut_VL C_VL_MOmut  ];
somenames={'c(m-MOPSO,SC-MOPSO)', 'c(SC-MOPSO,m-MOPSO)'};
subplot(4,1,1)
bar(somedata);set(gca,'xticklabel',somenames)
set(gcf,'color','w');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

C_N2_VL = SetCoverage2(pno,paretoFrontvl);
C_VL_N2 = SetCoverage2(paretoFrontvl,pno);
somedata=[C_N2_VL C_VL_N2  ];
somenames={'c(NSGA-II,SC-MOPSO)', 'c(SC-MOPSO,NSGA-II)'};
subplot(4,1,3)
bar(somedata);set(gca,'xticklabel',somenames)
set(gcf,'color','w');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

C_MO_VL = SetCoverage2(paretoFrontwm,paretoFrontvl);
C_VL_MO = SetCoverage2(paretoFrontvl,paretoFrontwm);
somedata=[C_MO_VL C_VL_MO  ];
somenames={'c(MOPSO,SC-MOPSO)', 'c(SC-MOPSO,MOPSO)'};
subplot(4,1,2)
bar(somedata);set(gca,'xticklabel',somenames)
set(gcf,'color','w');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

C_WS_VL = SetCoverage2(paretoFrontws,paretoFrontvl);
C_VL_WS = SetCoverage2(paretoFrontvl,paretoFrontws);
somedata=[ C_WS_VL C_VL_WS ];
somenames={'c(WS-VLPSO,SC-MOPSO)', 'c(SC-MOPSO,WS-VLPSO)'};
subplot(4,1,4)
bar(somedata);set(gca,'xticklabel',somenames)
set(gcf,'color','w');
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 

suptitle('set coverage' );
%%%%
 C_N2_MOmut = SetCoverage2(pno,paretoFront);
     C_N2_MO = SetCoverage2(pno,paretoFrontwm);
      C_N2_WS = SetCoverage2(pno,paretoFrontws);
       C_WS_MOmut = SetCoverage2(paretoFrontws,paretoFront);
    C_WS_MO = SetCoverage2(paretoFrontws,paretoFrontwm);
     C_WS_N2 = SetCoverage2(paretoFrontws,pno);
     C_MO_MOmut = SetCoverage2(paretoFrontwm,paretoFront);
     C_MO_N2 = SetCoverage2(paretoFrontwm,pno);
     C_MO_WS = SetCoverage2(paretoFrontwm,paretoFrontws);
      C_MOmut_MO = SetCoverage2(paretoFront,paretoFrontwm);
        C_MOmut_N2 = SetCoverage2(paretoFront,pno);
        C_MOmut_WS = SetCoverage2(paretoFront,paretoFrontws);
      C_VL_VL = 0;
      C_WS_WS = 0;
      C_MOmut_MOmut = 0;
      C_MO_MO = 0;
      C_N2_N2 = 0;
      
f11 = figure(11);

mat = [C_VL_VL C_VL_MOmut C_VL_MO C_VL_N2 C_VL_WS;...
    C_MOmut_VL C_MOmut_MOmut C_MOmut_MO C_MOmut_N2 C_MOmut_WS;...
    C_MO_VL C_MO_MOmut C_MO_MO C_MO_N2 C_MO_WS;...
    C_N2_VL C_N2_MOmut C_N2_MO C_N2_N2 C_N2_WS;...
    C_WS_VL C_WS_MOmut C_WS_MO C_WS_N2 C_WS_WS];


imagesc(mat);            %# Create a colored plot of the matrix values
colormap(flipud(gray)); 
  %# Change the colormap to gray (so higher values are
                         %#   black and lower values are white)
                         
textStrings = num2str(mat(:),'%0.02f');  %# Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding
 
%% ## New code: ###
%idx = find(strcmp(textStrings(:), '0.00'));
%textStrings(idx) = {'   '};
%% ################
 
[x,y] = meshgrid(1:5);   %# Create x and y coordinates for the strings
hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
                'HorizontalAlignment','center');
% hStrings = text(x,y,textStrings(:),...      %# Plot the strings
%                 'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
textColors = repmat(mat(:) > midValue,1,3);  %# Choose white or black for the
                                             %#   text color of the strings so
                                             %#   they can be easily seen over
                                             %#   the background color
set(hStrings,{'Color'},num2cell(textColors,2));  %# Change the text colors
set(gcf,'units','normalized','outerposition',[0 0 1 1])
set(gca,'FontWeight','bold','FontSize',12,'LineWidth',2) 
 
set(gca,'XTick',1:5,...                         %# Change the axes tick marks
        'XTickLabel',{'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'},...  %#   and tick labels
        'YTick',1:5,...
        'YTickLabel',{'SC-MOPSO','m-MOPSO','MOPSO','NSGA-II','WS-VLPSO'},...
        'TickLength',[0 0]);
suptitle('SetCoverage Confusion Matrix');
set(gcf,'units','normalized','outerposition',[0 0 1 1])

% end