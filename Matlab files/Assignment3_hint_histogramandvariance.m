clc
clear all
close all

%% test array
  
 Lhist= [10 10 10 10 10 10 9 8 7 6 5 4 3 2 1 2 3 4 5 6 7 8 9 8 7 10 8 6 4 1 4 5 6 7 8 9 8];
 figure,plot(Lhist);
 varV=[];
 
 %% try find the biggest change within the histogram (using 10 local neighbors)
 for i=11:27
if Lhist(i)+Lhist(i+1)+Lhist(i+2)+Lhist(i+3)+Lhist(i+4)+Lhist(i+5)>0
      varV(i)= abs(Lhist(i-10)+Lhist(i-8)+Lhist(i-6)-Lhist(i)+Lhist(i+6)+Lhist(i+8)+Lhist(i+10));
end
 end
  
 [value, location]=max(varV);
 T = location;
  
i=i;