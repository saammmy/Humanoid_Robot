function [T01,T02,T03,T04,T05,T06,T07]=Arm_Right2(q1,q2,q3,q4,q5,q6,q7,T1,LW,c)
clc
% disp('This program is used to get the transformation matrix of robot Arm')

%%DH Parameters
alphaa=[-90,-90,-90,+90,+90,-90,0];
a=[0,0,0,0,0,0,-185.5]; % Here 50 is assumed distance of the end effector from the hookes Joint (-ve because it is in the negative direction of X axis of the 6th Joint)

q=[q1,q2,q3,q4,q5,q6,q7];
% If we want to shift the matrix by a certain distance then we can use this

if(rem(c,2)==0)
t00=[0 0 1 -207.425;0 -1 0 0; 1 0 0 0; 0 0 0 1];
d=[0,0,270.2,-15.540,228.78,0,0];
else
t00=[0 0 1 207.425;0 -1 0 0; 1 0 0 0; 0 0 0 1];
d=[0,0,270.2,15.540,228.78,0,0];
end    
T00=T1*t00;
%%Transformation Matrices

for i=1:7
    switch i
        case 1
            T01= [cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
        case 2
            T12= [cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
        case 3
            T23= [cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
        case 4
            T34= [cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
        case 5
            T45= [cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
        case 6
            T56=[cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
        case 7
            T67=[cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
    end
end

% Now we will calculate the transformation matrix at each point wrt base

T01=T00*T01;

T02=T01*T12;

T03=T02*T23;

T04=T03*T34;

T05=T04*T45;

T06=T05*T56;

T07=T06*T67;

%Plotting the various points and labelling them

plot3([T1(1,4),T00(1,4)],[T1(2,4),T00(2,4)],[T1(3,4),T00(3,4)],'-c','LineWidth',LW);

scatter3(T00(1,4),T00(2,4),T00(3,4));
text(T00(1,4),T00(2,4),T00(3,4),'T00','HorizontalAlignment','Right','VerticalAlignment','Top');
hold on;

scatter3(T01(1,4),T01(2,4),T01(3,4));
text(T01(1,4),T01(2,4),T01(3,4),'T01','HorizontalAlignment','Left','VerticalAlignment','Bottom');


scatter3(T02(1,4),T02(2,4),T02(3,4));
text(T02(1,4),T02(2,4),T02(3,4),'T02','VerticalAlignment','Top');
plot3([T01(1,4),T02(1,4)],[T01(2,4),T02(2,4)],[T01(3,4),T02(3,4)],'-r','LineWidth',LW);

scatter3(T03(1,4),T03(2,4),T03(3,4));
text(T03(1,4),T03(2,4),T03(3,4),'T03','VerticalAlignment','Top');
if(rem(c,2)==0)
plot3([T02(1,4),T03(1,4)],[T02(2,4),T03(2,4)],[T02(3,4),T03(3,4)],'Color',[0.4660 0.6740 0.1880],'LineWidth',LW);
else
plot3([T02(1,4),T03(1,4)],[T02(2,4),T03(2,4)],[T02(3,4),T03(3,4)],'Color',[0.4940 0.1840 0.5560],'LineWidth',LW);
end   
scatter3(T04(1,4),T04(2,4),T04(3,4));
text(T04(1,4),T04(2,4),T04(3,4),'T04','HorizontalAlignment','Right','VerticalAlignment','Top');
plot3([T03(1,4),T04(1,4)],[T03(2,4),T04(2,4)],[T03(3,4),T04(3,4)],'-g');

scatter3(T05(1,4),T05(2,4),T05(3,4));
text(T05(1,4),T05(2,4),T05(3,4),'T05','HorizontalAlignment','Left','VerticalAlignment','Bottom');
if(rem(c,2)==0)
plot3([T04(1,4),T05(1,4)],[T04(2,4),T05(2,4)],[T04(3,4),T05(3,4)],'-r','LineWidth',LW);
else
plot3([T04(1,4),T05(1,4)],[T04(2,4),T05(2,4)],[T04(3,4),T05(3,4)],'Color',[0 0.4470 0.7410],'LineWidth',LW);
end    
scatter3(T06(1,4),T06(2,4),T06(3,4));
text(T06(1,4),T06(2,4),T06(3,4),'T06','HorizontalAlignment','Right','VerticalAlignment','Bottom');
plot3([T05(1,4),T06(1,4)],[T05(2,4),T06(2,4)],[T05(3,4),T06(3,4)],'-g');

scatter3(T07(1,4),T07(2,4),T07(3,4));
text(T07(1,4),T07(2,4),T07(3,4),'T07');
plot3([T06(1,4),T07(1,4)],[T06(2,4),T07(2,4)],[T06(3,4),T07(3,4)],'Color',[0.9290 0.6940 0.1250],'LineWidth',LW);
% 
% xlabel('X-axis')
% ylabel('Y-axis')
% zlabel('Z-axis')
% axis([-2650 2650 -2650 2650 -2650 2650])

end