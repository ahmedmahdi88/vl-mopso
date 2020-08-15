function visSensors(W,H,pos,color,r)
% r=1;
A=W*H;
environment=1:A;
env=reshape(environment,10,10)';
sensorsPos=[];
numberOfSensors=length(pos);
sensorsPos=pos;
coverage=[];
for sen=1:length(sensorsPos)
coverage=[ coverage sensorsPos(sen) sensorsPos(sen)+r sensorsPos(sen)-r sensorsPos(sen)+W sensorsPos(sen)-W];
end
 coverage(coverage<1 | coverage>(W*H))=[];
  coverage=unique(coverage);
  lenCov=length(coverage);
  ind=[];
for p=1:length(sensorsPos)
ind=[ind find(env==sensorsPos(p))];
end
[j,i] = ind2sub([W H],ind);
theta = 0 : 0.01 : 2*pi;
for ix=1:length(i)

       xlim([1 W]);ylim([1 H]);
        grid on;hold on;
        thisX = r * cos(theta) + i(ix);
        thisY = r * sin(theta) + j(ix);
        plot(thisX,thisY,color);hold on;
%         fill(thisX, thisY, color);
         plot(i(ix),j(ix),'bx');
end
end