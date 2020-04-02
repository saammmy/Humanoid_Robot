function [T65,T64,T63,T62,T61,T60,TF]= Leg_Right2(q1,q2,q3,q4,q5,q6,LL6,LW,plo,c)
clc
%disp('This program is used to get the transformation matrix of robot')

%%DH Parameters

alphaa=[-90,-90,0,-90,90,0];
a=[0,349.7,322.0,0,0,0];
d=[0,0,0,0,0,0];
q=[q1,q2,q3,q4,q5,q6];
% If we want to shift the matrix by a certain distance then we can use this
if(rem(c,2)==0)
    t00=[1 0 0 -240;0 1 0 0;0 0 1 0;0 0 0 1];
else
    t00=[1 0 0 240;0 1 0 0;0 0 1 0;0 0 0 1];
end
    T00=LL6*t00;

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

T65=T00/T56;
T64=T65/T45;
T63=T64/T34;
T62=T63/T23;
T61=T62/T12;
T60=T61/T01;

%Plotting the various points and labelling them

    
        %FOOT
        TF=[1 0 0 T60(1,4)-185.48;0 1 0 T60(2,4);0 0 1 T60(3,4);0 0 0 1];
     if(plo==1)
        scatter3(TF(1,4),TF(2,4),TF(3,4));
        text(TF(1,4),TF(2,4),TF(3,4),'TF','HorizontalAlignment','Right','VerticalAlignment','Top');
        plot3([TF(1,4),T60(1,4)],[TF(2,4),T60(2,4)],[TF(3,4),T60(3,4)],'Color',[0.9290 0.6940 0.1250],'LineWidth',LW);
        hold on;

        %T00
        scatter3(T00(1,4),T00(2,4),T00(3,4));
        text(T00(1,4),T00(2,4),T00(3,4),'T00','HorizontalAlignment','Right','VerticalAlignment','Top');
        hold on;
        plot3([LL6(1,4),T00(1,4)],[LL6(2,4),T00(2,4)],[LL6(3,4),T00(3,4)],'-c','LineWidth',LW);

        %T65
        scatter3(T65(1,4),T65(2,4),T65(3,4));
        text(T65(1,4),T65(2,4),T65(3,4),'T65','HorizontalAlignment','Left','VerticalAlignment','Bottom');

        %T64 
        scatter3(T64(1,4),T64(2,4),T64(3,4));
        text(T64(1,4),T64(2,4),T64(3,4),'T64','VerticalAlignment','Top');
        plot3([T65(1,4),T64(1,4)],[T65(2,4),T64(2,4)],[T65(3,4),T64(3,4)],'-r','LineWidth',LW);

        %T63 
        scatter3(T63(1,4),T63(2,4),T63(3,4));
        text(T63(1,4),T63(2,4),T63(3,4),'T63','VerticalAlignment','Top');
        plot3([T64(1,4),T63(1,4)],[T64(2,4),T63(2,4)],[T64(3,4),T63(3,4)],'-g','LineWidth',LW);

        %T62
        scatter3(T62(1,4),T62(2,4),T62(3,4));
        text(T62(1,4),T62(2,4),T62(3,4),'T62','HorizontalAlignment','Right','VerticalAlignment','Top');
        if(rem(c,2)==0)
        plot3([T63(1,4),T62(1,4)],[T63(2,4),T62(2,4)],[T63(3,4),T62(3,4)],'Color',[0.4660 0.6740 0.1880],'LineWidth',LW);
        else
        plot3([T63(1,4),T62(1,4)],[T63(2,4),T62(2,4)],[T63(3,4),T62(3,4)],'Color',[0.4940 0.1840 0.5560],'LineWidth',LW);
        end    
            
        %T61
        scatter3(T61(1,4),T61(2,4),T61(3,4));
        text(T61(1,4),T61(2,4),T61(3,4),'T61','HorizontalAlignment','Left','VerticalAlignment','Bottom');
        if(rem(c,2)==0)
        plot3([T62(1,4),T61(1,4)],[T62(2,4),T61(2,4)],[T62(3,4),T61(3,4)],'-r','LineWidth',LW);
        else
        plot3([T62(1,4),T61(1,4)],[T62(2,4),T61(2,4)],[T62(3,4),T61(3,4)],'Color',[0 0.4470 0.7410],'LineWidth',LW);
        end    
        %T60
        scatter3(T60(1,4),T60(2,4),T60(3,4));
        text(T60(1,4),T60(2,4),T60(3,4),'T60','HorizontalAlignment','Right','VerticalAlignment','Bottom');
        plot3([T61(1,4),T60(1,4)],[T61(2,4),T60(2,4)],[T61(3,4),T60(3,4)],'-g');

        %Finally labelling the axis and providing upper and lower limits
        % xlabel('X-axis')
        % ylabel('Y-axis')
        % zlabel('Z-axis')
    end
end
