% this to be added to the thesis 
clc
clear all

NC=5; % the number of classes 
NPC=10; % the number of particles per one class 
NP=NC*NPC; % the total number of particles 
Classes=1:NC; % the dimension of the classes 
swarm{NC*NP}=0; % the swarm memory 
objectiveValues=[];

for i=1:NC
    
    d=Classes(i);
    for j=1:NPC
        
       particle=rand(1,d);
       swarm{(i-1)*NPC+j}=particle;
       [y1,y2]=ObjectiveFuc(particle);
        objectiveValues=[objectiveValues;y1 y2];
        
    end
   
    
end


AM=objectiveValues';
AM1=AM(:,1:10);
AM2=AM(:,11:20);
AM3=AM(:,21:30);
AM4=AM(:,31:40);
AM5=AM(:,41:50);

RAM=zeros(2,NC);

RAM(:,1)=max(AM1')';
RAM(:,2)=max(AM2')';
RAM(:,3)=max(AM3')';
RAM(:,4)=max(AM4')';
RAM(:,5)=max(AM5')';

pdfcf1=RAM(1,:)/sum(RAM(1,:));

pdfcf2=RAM(2,:)/sum(RAM(2,:));

figure 

plot(pdfcf1);
hold on
plot(pdfcf2);



pdfpf1=AM3(1,:)/sum(AM3(1,:));

pdfpf2=AM3(2,:)/sum(AM3(2,:));

figure 

plot(pdfpf1);
hold on
plot(pdfpf2);


function [y1,y2]=ObjectiveFuc(x)
d=length(x);

y1=0;

for i=1:d
    
    
    y1=y1+x(i)^2;
    
end

y21=0;
for i=1:d
    
    y21=y21+x(i)^2/4000;
   
end

y22=1;

for i=1:d 
    
    y22=y22*cos(x(i)/sqrt(i));
    
end

y2=y21-y22+1;



end