function [RLL1,RLL2,RLR3,RLR2,RT,RLS,RRS,RAL2,RAL4,RAL6,RAR2,RAR4,RAR6,RN1]=Static(LL1,LL2,LR3,LR2,T0,T1,AL2,AL4,AL6,AR2,AR4,AR6,N1,qL2,qL3,qT0,qAL3,qAL5,qAL7,qAR3,qAR5,qAR7,qN2,i)
%     %MASS
%     mLL1=6;
%     mLL2=4;
%     mLR3=4;
%     mLR2=6;
%     mT=11;
%     mLS=0;
%     mRS=0;
%     mAL2=3.5;
%     mAL4=2.5;
%     mAL6=2;
%     mAR2=3.5;
%     mAR4=2.5;
%     mAR6=2;
%     mN1=2.5;
%     mTotal=50;
mLL1=2;
    mLL2=1.5;
    mLR3=1.5;
    mLR2=2;
    mT=9.01;
    mLS=0;
    mRS=0;
    mAL2=3.5;
    mAL4=2.5;
    mAL6=0.731;
    mAR2=3.5;
    mAR4=2.5;
    mAR6=0.731;
    mN1=2.5;
    mTotal=33.772;
    
    A=rotz(qL2);
    A(4,4)=1;
    B=rotz(qL3);
    B(4,4)=1;
    C=rotz(qT0);
    C(4,4)=1;
    D=rotz(qAL3);
    D(4,4)=1;
    E=rotz(qAL5);
    E(4,4)=1;
    F=rotz(qAR3);
    F(4,4)=1;
    G=rotz(qAR5);
    G(4,4)=1;
    H=rotz(qN2);
    H(4,4)=1;
    I=rotz(qAR7);
    I(4,4)=1;
    J=rotz(qAL7);
    J(4,4)=1;
    %LEFT LEG LOWER LINK
    rLL1=LL1*A*[174.85;0;0;1];
    RLL1=[rLL1(1);rLL1(2);rLL1(3)]; %projected
    %LEFT LEG UPPER LINK
    rLL2=LL2*B*[214.667;0;0;1];
    RLL2=[rLL2(1);rLL2(2);rLL1(3)];
    %RIGHT LEG UPPER LINK
    rLR3=LR3*[-107.33;0;0;1];
    RLR3=[rLR3(1);rLR3(2);rLR3(3)];
    %RIGHT LEG LOWER LINK
    rLR2=LR2*[-174.85;0;0;1];
    RLR2=[rLR2(1);rLR2(2);rLR2(3)];
    %TORSO
    rT=T0*C*[0;0;216.5;1];
    RT=[rT(1);rT(2);rT(3)];
    %LEFT SHOULDER
    rLS=T1*[103.7125;0;0;1];
    RLS=[rLS(1);rLS(2);rLS(3)];
    %RIGHT SHOULDER
    rRS=T1*[-103.71252;0;0;1];
    RRS=[rRS(1);rRS(2);rRS(3)];
    %LEFT ARM UPPER LINK
    rAL2=AL2*D*[0;0;81;1];
    RAL2=[rAL2(1);rAL2(2);rAL2(3)];
    %LEFT ARM LOWER LINK
    rAL4=AL4*E*[0;0;76.26;1];
    RAL4=[rAL4(1);rAL4(2);rAL4(3)];
    %LEFT WRIST
    rAL6=AL6*J*[-92.75;0;0;1];
    RAL6=[rAL6(1);rAL6(2);rAL6(3)];
    %RIGHT ARM UPPER LINK
    rAR2=AR2*F*[0;0;81;1];
    RAR2=[rAR2(1);rAR2(2);rAR2(3)];
   %RIGHT ARM LOWER LINK
    rAR4=AR4*G*[0;0;76.26;1];
    RAR4=[rAR4(1);rAR4(2);rAR4(3)];
   %RIGHT WRIST
    rAR6=AR6*I*[-92.75;0;0;1];
    RAR6=[rAR6(1);rAR6(2);rAR6(3)];
   %HEAD
    rN1=N1*H*[198.24;0;0;1];
    RN1=[rN1(1);rN1(2);rN1(3)];
    %Plotting
    if(i==1)
        scatter3(0,RLL1(2),RLL1(3),'filled');
        hold on;
        text(0,RLL1(2),RLL1(3),'Left Leg Lower');
        plot3([rLL1(1),0],[rLL1(2),RLL1(2)],[rLL1(3),RLL1(3)],'--k');

        scatter3(0,RLL2(2),RLL2(3),'filled');
        text(0,RLL2(2),RLL2(3),'Left Leg Upper');
        plot3([rLL2(1),0],[rLL2(2),RLL2(2)],[rLL2(3),RLL2(3)],'--k');

         scatter3(0,RLR3(2),RLR3(3),'filled');
        text(0,RLR3(2),RLR3(3),'Right Leg Upper');
        plot3([rLR3(1),0],[rLR3(2),RLR3(2)],[rLR3(3),RLR3(3)],'--k');

        scatter3(0,RLR2(2),RLR2(3),'filled');
        text(0,RLR2(2),RLR2(3),'Right Leg Lower');
        plot3([rLR2(1),0],[rLR2(2),RLR2(2)],[rLR2(3),RLR2(3)],'--k');

        scatter3(0,RT(2),RT(3),'filled');
        text(0,RT(2),RT(3),'Torso');
        plot3([rT(1),0],[rT(2),RT(2)],[rT(3),RT(3)],'--k');

        scatter3(0,RLS(2),RLS(3),'filled');
        text(0,RLS(2),RLS(3),'Left Shoulder');
        plot3([rLS(1),0],[rLS(2),RLS(2)],[rLS(3),RLS(3)],'--k');

        scatter3(0,RRS(2),RRS(3),'filled');
        text(0,RRS(2),RRS(3),'Right Shoulder');
        plot3([rRS(1),0],[rRS(2),RRS(2)],[rRS(3),RRS(3)],'--k');

        scatter3(0,RAL2(2),RAL2(3),'filled');
        text(0,RAL2(2),RAL2(3),'Left Arm Upper');
        plot3([rAL2(1),0],[rAL2(2),RAL2(2)],[rAL2(3),RAL2(3)],'--k');

        scatter3(0,RAL4(2),RAL4(3),'filled');
        text(0,RAL4(2),RAL4(3),'Left Arm Lower');
        plot3([rAL4(1),0],[rAL4(2),RAL4(2)],[rAL4(3),RAL4(3)],'--k');

        scatter3(0,RAL6(2),RAL6(3),'filled');
        text(0,RAL6(2),RAL6(3),'Left Wrist');
        plot3([rAL6(1),0],[rAL6(2),RAL6(2)],[rAL6(3),RAL6(3)],'--k');

        scatter3(0,RAR2(2),RAR2(3),'filled');
        text(0,RAR2(2),RAR2(3),'Right Arm Upper');
        plot3([rAR2(1),0],[rAR2(2),RAR2(2)],[rAR2(3),RAR2(3)],'--k');

        scatter3(0,RAR4(2),RAR4(3),'filled');
        text(0,RAR4(2),RAR4(3),'Right Arm Lower');
        plot3([rAR4(1),0],[rAR4(2),RAR4(2)],[rAR4(3),RAR4(3)],'--k');
        
        scatter3(0,RAR6(2),RAR6(3),'filled');
        text(0,RAR6(2),RAR6(3),'Right Wrist');
        plot3([rAR6(1),0],[rAR6(2),RAR6(2)],[rAR6(3),RAR6(3)],'--k');
        
        scatter3(0,RN1(2),RN1(3),'filled');
        text(0,RN1(2),RN1(3),'Neck');
        plot3([rN1(1),0],[rN1(2),RN1(2)],[rN1(3),RN1(3)],'--k');
        
    end
    
    %Finding Static Balance Point in Y-axis
    
    pz=(mLL1*RLL1(3)+mLL2*RLL2(3)+mLR3*RLR3(3)+mLR2*RLR2(3)+mT*RT(3)+mLS*RLS(3)+mRS*RRS(3)+mAL2*RAL2(3)+mAL4*RAL4(3)+mAL6*RAL6(3)+mAR2*RAR2(3)+mAR4*RAR4(3)+mAR6*RAR6(3)+mN1*RN1(3))/mTotal;
    py=(mLL1*RLL1(2)+mLL2*RLL2(2)+mLR3*RLR3(2)+mLR2*RLR2(2)+mT*RT(2)+mLS*RLS(2)+mRS*RRS(2)+mAL2*RAL2(2)+mAL4*RAL4(2)+mAL6*RAL6(2)+mAR2*RAR2(2)+mAR4*RAR4(2)+mAR6*RAR6(2)+mN1*RN1(2))/mTotal;
    if(i==1)
    scatter3(0,py,pz,'filled');
    text(0,py,pz,'Static Balance Point');
    end
end
    
    
    
    
    