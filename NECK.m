function [T01,T02]=NECK(q1,q2,T1,LW)
clc
%disp('This program is used to get the transformation matrix of robot Arm')

%%DH Parameters

alphaa=[-90,0];
a=[0,289.16];
d=[0,0];
q=[q1,q2];
% If we want to shift the matrix by a certain distance then we can use this
t00=[1 0 0 0;0 1 0 0; 0 0 1 0; 0 0 0 1];
T00=T1*t00;
%%Transformation Matrices

for i=1:2
    switch i
        case 1
            T01= [cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
        case 2
            T12= [cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
    end
end

% Now we will calculate the transformation matrix at each point wrt base

T01=T00*T01;

T02=T01*T12;

%Plotting the various points and labelling them

plot3([T1(1,4),T00(1,4)],[T1(2,4),T00(2,4)],[T1(3,4),T00(3,4)],'-c','LineWidth',2);

scatter3(T00(1,4),T00(2,4),T00(3,4));
text(T00(1,4),T00(2,4),T00(3,4),'T00','HorizontalAlignment','Right','VerticalAlignment','Top');
hold on;

scatter3(T01(1,4),T01(2,4),T01(3,4));
text(T01(1,4),T01(2,4),T01(3,4),'T01','HorizontalAlignment','Left','VerticalAlignment','Bottom');

scatter3(T02(1,4),T02(2,4),T02(3,4));
text(T02(1,4),T02(2,4),T02(3,4),'T02','VerticalAlignment','Bottom');
plot3([T01(1,4),T02(1,4)],[T01(2,4),T02(2,4)],[T01(3,4),T02(3,4)],'Color',[0.6350 0.0780 0.1840],'LineWidth',LW*5);

% xlabel('X-axis')
% ylabel('Y-axis')
% zlabel('Z-axis')
% axis([-1000 1000 -1000 1000 -1000 1000])

end