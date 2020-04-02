function [T01,T02,T03,T04,T05,T06,TF]=Leg_Left2(q1,q2,q3,q4,q5,q6,LW,plo,c,x,y,q)

%disp('This program is used to get the transformation matrix of robot')

%%DH Parameters

if(rem(c,2)==0)
    z=0;
else
    z=-240*cosd(q);
end
alphaa=[-90,-90,0,-90,90,0];
a=[0,349.7,322.0,0,0,0];
d=[0,0,0,0,0,0];
%  q=[0,0,0,0,90,0];
q=[q1,q2,q3,q4,q5,q6];
% If we want to shift the matrix by a certain distance then we can use this
T00=[1 0 0 185.48+x;0 1 0 y;0 0 1 z;0 0 0 1]; 

%%Transformation Matrices

for i=1:6
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
            T56= [cosd(q(1,i)),-sind(q(1,i))*cosd(alphaa(1,i)),sind(alphaa(1,i))*sind(q(1,i)),a(1,i)*cosd(q(1,i));sind(q(1,i)),cosd(q(1,i)).*cosd(alphaa(1,i)),-sind(alphaa(1,i))*cosd(q(1,i)),sind(q(1,i))*a(1,i);0,sind(alphaa(1,i)),cosd(alphaa(1,i)),d(1,i);0,0,0,1];
    end
end

% Now we will calculate the transformation matrix at each point wrt base

T01=T00*T01;

T02=T01*T12;

T03=T02*T23;

T04=T03*T34;

T05=T04*T45;

T06=T05*T56;

%Plotting the various points and labelling them



    %FOOT
    TF=[1 0 0 T00(1,4)-185.48;0 1 0 T00(2,4);0 0 1 T00(3,4);0 0 0 1];
   if(plo==1)
    scatter3(TF(1,4),TF(2,4),TF(3,4));
    hold on;
    text(TF(1,4),TF(2,4),TF(3,4),'TF','HorizontalAlignment','Right','VerticalAlignment','Top');
    plot3([TF(1,4),T00(1,4)],[TF(2,4),T00(2,4)],[TF(3,4),T00(3,4)],'Color',[0.9290 0.6940 0.1250],'LineWidth',LW);


    %T00
    scatter3(T00(1,4),T00(2,4),T00(3,4));
    text(T00(1,4),T00(2,4),T00(3,4),'T00','HorizontalAlignment','Right','VerticalAlignment','Top');

    %T01
    scatter3(T01(1,4),T01(2,4),T01(3,4));
    text(T01(1,4),T01(2,4),T01(3,4),'T01','HorizontalAlignment','Left','VerticalAlignment','Bottom');

    %T02 color
    scatter3(T02(1,4),T02(2,4),T02(3,4));
    text(T02(1,4),T02(2,4),T02(3,4),'T02','VerticalAlignment','Top');
    if(rem(c,2)==0)
        plot3([T01(1,4),T02(1,4)],[T01(2,4),T02(2,4)],[T01(3,4),T02(3,4)],'Color',[0 0.4470 0.7410],'LineWidth',LW);
    else
        plot3([T01(1,4),T02(1,4)],[T01(2,4),T02(2,4)],[T01(3,4),T02(3,4)],'Color','r','LineWidth',LW);
    end
    %T03 color
    scatter3(T03(1,4),T03(2,4),T03(3,4));
    text(T03(1,4),T03(2,4),T03(3,4),'T03','VerticalAlignment','Top');
    if(rem(c,2)==0)
    plot3([T02(1,4),T03(1,4)],[T02(2,4),T03(2,4)],[T02(3,4),T03(3,4)],'Color',[0.4940 0.1840 0.5560],'LineWidth',LW);
    else
    plot3([T02(1,4),T03(1,4)],[T02(2,4),T03(2,4)],[T02(3,4),T03(3,4)],'Color',[0.4660 0.6740 0.1880],'LineWidth',LW);
    end
    %T04
    scatter3(T04(1,4),T04(2,4),T04(3,4));
    text(T04(1,4),T04(2,4),T04(3,4),'T04','HorizontalAlignment','Right','VerticalAlignment','Top');
    plot3([T03(1,4),T04(1,4)],[T03(2,4),T04(2,4)],[T03(3,4),T04(3,4)],'-b');

    %T05
    scatter3(T05(1,4),T05(2,4),T05(3,4));
    text(T05(1,4),T05(2,4),T05(3,4),'T05','HorizontalAlignment','Left','VerticalAlignment','Bottom');
    plot3([T04(1,4),T05(1,4)],[T04(2,4),T05(2,4)],[T04(3,4),T05(3,4)],'-g','LineWidth',LW);

    %T06
    scatter3(T06(1,4),T06(2,4),T06(3,4));
    text(T06(1,4),T06(2,4),T06(3,4),'T06','HorizontalAlignment','Right','VerticalAlignment','Bottom');
    plot3([T05(1,4),T06(1,4)],[T05(2,4),T06(2,4)],[T05(3,4),T06(3,4)],'-c','LineWidth',LW);

    %Finally labelling the axis and providing upper and lower limits
    % xlabel('X-axis')
    % ylabel('Y-axis')
    % zlabel('Z-axis')
   end
end
