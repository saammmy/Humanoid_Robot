function [T00,T01]=TORSO2(q1,LL6,LW,c)
clc
%disp('This program is used to get the transformation matrix of robot')

%%DH Parameters

alphaa=[0];
a=[0];
d=[591.68];
q=[q1];
% If we want to shift the matrix by a certain distance then we can use this
if(rem(c,2)==0)
t00=[1 0 0 -120;0 1 0 0; 0 0 1 0;0 0 0 1];
else
t00=[1 0 0 120;0 1 0 0; 0 0 1 0;0 0 0 1];
end    
T00=LL6*t00;

%%Transformation Matrices

          
for i=1
    T01= [cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
end
% Now we will calculate the transformation matrix at each point wrt base

T01=T00*T01;


%Plotting the various points and labelling them

%T00
scatter3(T00(1,4),T00(2,4),T00(3,4));
text(T00(1,4),T00(2,4),T00(3,4),'T00','HorizontalAlignment','Right','VerticalAlignment','Top');
hold on;

%T01
scatter3(T01(1,4),T01(2,4),T01(3,4));
text(T01(1,4),T01(2,4),T01(3,4),'T01','HorizontalAlignment','Left','VerticalAlignment','Bottom');
plot3([T00(1,4),T01(1,4)],[T00(2,4),T01(2,4)],[T00(3,4),T01(3,4)],'-k','LineWidth',LW);


%Finally labelling the axis and providing upper and lower limits
% xlabel('X-axis')
% ylabel('Y-axis')
% zlabel('Z-axis')
% axis([-1500 1500 -1500 1500 -1500 1500])
end