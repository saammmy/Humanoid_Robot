% Make the Robot Walk
clc
clear
q=0;
[qLL1,qLL2,qLR2,qLR3,p]= Trajectory_walking2(1,0,0,10,q);
%qT=linspace(-5,5,p);%TORSO ANGLE
qT=linspace(0,0,p);
qLL=[0,0,0,0,90,0]; %Right Leg Joint Angle
qLR=[0,0,0,0,90,0]; %Right Leg Joint Angle
qAL1=linspace(-10,10,p);
qAR1=linspace(10,-10,p);
qAL=[90,90,-90,45,0,-90-45,0]; %LEFT Arm Joint Angles
qAR=[-45,90,-90,45,0,-90-45,0]; %RIGHT Arm Joint Angles
qN=[0,-90]; %Neck Joint Angles
LW=10; %LineWidth of Graph
Time=linspace(0,2,p);

RLL1x=zeros(1,p);
RLL1y=zeros(1,p);
RLL1z=zeros(1,p);
QLL1=zeros(1,p);

RLL2x=zeros(1,p);
RLL2y=zeros(1,p);
RLL2z=zeros(1,p);
QLL2=zeros(1,p);

RLR3x=zeros(1,p);
RLR3y=zeros(1,p);
RLR3z=zeros(1,p);
QLR3=zeros(1,p);

RLR2x=zeros(1,p);
RLR2y=zeros(1,p);
RLR2z=zeros(1,p);
QLR2=zeros(1,p);

RTx=zeros(1,p);
RTy=zeros(1,p);
RTz=zeros(1,p);
QT=zeros(1,p);

RLSx=zeros(1,p);
RLSy=zeros(1,p);
RLSz=zeros(1,p);
QLS=zeros(1,p);

RRSx=zeros(1,p);
RRSy=zeros(1,p);
RRSz=zeros(1,p);
QRS=zeros(1,p);

RAL2x=zeros(1,p);
RAL2y=zeros(1,p);
RAL2z=zeros(1,p);
QAL2=zeros(1,p);

RAL4x=zeros(1,p);
RAL4y=zeros(1,p);
RAL4z=zeros(1,p);
QAL4=zeros(1,p);

RAL6x=zeros(1,p);
RAL6y=zeros(1,p);
RAL6z=zeros(1,p);
QAL6=zeros(1,p);

RAR2x=zeros(1,p);
RAR2y=zeros(1,p);
RAR2z=zeros(1,p);
QAR2=zeros(1,p);

RAR4x=zeros(1,p);
RAR4y=zeros(1,p);
RAR4z=zeros(1,p);
QAR4=zeros(1,p);

RAR6x=zeros(1,p);
RAR6y=zeros(1,p);
RAR6z=zeros(1,p);
QAR6=zeros(1,p);

RN1x=zeros(1,p);
RN1y=zeros(1,p);
RN1z=zeros(1,p);
QN1=zeros(1,p);

figure('units','normalized','outerposition',[0 0 1 1])
for i=1:p
     qLL=[qLL1(i),0,-qLL2(i)+qLL1(i),q,90-qLL2(i)+qT(i),0];
     qLR=[0,0,-qLR3(i)+qLR2(i),q,90-qLR3(i)+qT(i),0];
%      [LL1,LL2,LL3,LL4,LL5,LL6,LLF]=Leg_Left(qLL(1),qLL(2),qLL(3),qLL(4),qLL(5),qLL(6),LW,0);
%      [LR5,LR4,LR3,LR2,LR1,LR0,LRF]=Leg_Right(qLR(1),qLR(2),qLR(3),qLR(4),qLR(5),qLR(6),LL6,LW,0);
%      qLL(6)=asind((LL6(2,4)-LR5(2,4))/186);
      [LL1,LL2,LL3,LL4,LL5,LL6,LLF]=Leg_Left(qLL(1),qLL(2),qLL(3),qLL(4),qLL(5),qLL(6),LW,1);
     xlabel('X-axis')
     ylabel('Y-axis')
     zlabel('Z-axis')
    %axis([0 1350 -200 500 -280 180])
    %axis([0 1700 -200 500 -320 140])
     axis([0 1800 -200 480 -310 130])
     [LR5,LR4,LR3,LR2,LR1,LR0,LRF]=Leg_Right(qLR(1),qLR(2),qLR(3),qLR(4),qLR(5),qLR(6),LL6,LW,1);
     [T0,T1]=TORSO(0,LL6,LW);
     [AL1,AL2,AL3,AL4,AL5,AL6,AL7]=Arm_Left(qAL1(i),qAL(2),qAL(3),qAL(4),qAL(5),qAL(6),qAL(7),T1,LW);
     [AR1,AR2,AR3,AR4,AR5,AR6,AR7]=Arm_Right(qAR1(i),qAR(2),qAR(3),qAR(4),qAR(5),qAR(6),qAR(7),T1,LW);
     [N1,N2]=NECK(qN(1),qN(2),T1,LW);
     [RLL1,RLL2,RLR3,RLR2,RT,RLS,RRS,RAL2,RAL4,RAL6,RAR2,RAR4,RAR6,RN1]=Static(LL1,LL2,LR3,LR2,T0,T1,AL2,AL4,AL6,AR2,AR4,AR6,N1,qLL(2),qLL(3),0,qAL(3),qAL(5),qAL(7),qAR(3),qAR(5),qAR(7),qN(2),0);
    %FOOT RECTANGLE
     fill3([0,0,0,0,0,0,0,0,0,0,0,0,0],[122.135,122.135,100,80,-80,-100,-122.135,-122.135,-100,-80,80,100,122.135],[44.45,-44.45,-62.75,-44.45,-44.45,-60.15,-60.15,60.15,60.15,44.45,44.45,62.75,44.45],[0.25, 0.25, 0.25]);
     fill3([LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4)],[LRF(2,4)+122.135,LRF(2,4)+122.135,LRF(2,4)+100,LRF(2,4)+80,LRF(2,4)-80,LRF(2,4)-100,LRF(2,4)-122.135,LRF(2,4)-122.135,LRF(2,4)-100,LRF(2,4)-80,LRF(2,4)+80,LRF(2,4)+100,LRF(2,4)+122.135],[LRF(3,4)+44.45,LRF(3,4)-44.45,LRF(3,4)-62.75,LRF(3,4)-44.45,LRF(3,4)-44.45,LRF(3,4)-60.15,LRF(3,4)-60.15,LRF(3,4)+60.15,LRF(3,4)+60.15,LRF(3,4)+44.45,LRF(3,4)+44.45,LRF(3,4)+62.75,LRF(3,4)+44.45],[0.25, 0.25, 0.25])
     %plot3([0,0,0,0,0,0,0,0,0,0,0,0,0],[122.135,122.135,100,80,-80,-100,-122.135,-122.135,-100,-80,80,100,122.135],[44.45,-44.45,-62.75,-44.45,-44.45,-60.15,-60.15,60.15,60.15,44.45,44.45,62.75,44.45],'Color',[0.25, 0.25, 0.25],'LineWidth',LW);
     %plot3([LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4)],[LRF(2,4)+122.135,LRF(2,4)+122.135,LRF(2,4)+100,LRF(2,4)+80,LRF(2,4)-80,LRF(2,4)-100,LRF(2,4)-122.135,LRF(2,4)-122.135,LRF(2,4)-100,LRF(2,4)-80,LRF(2,4)+80,LRF(2,4)+100,LRF(2,4)+122.135],[LRF(3,4)+44.45,LRF(3,4)-44.45,LRF(3,4)-62.75,LRF(3,4)-44.45,LRF(3,4)-44.45,LRF(3,4)-60.15,LRF(3,4)-60.15,LRF(3,4)+60.15,LRF(3,4)+60.15,LRF(3,4)+44.45,LRF(3,4)+44.45,LRF(3,4)+62.75,LRF(3,4)+44.45],'Color',[0.25, 0.25, 0.25],'LineWidth',LW);     
    %COLLECTING DATA OF EACH MOVING LINK (TRAJECTORY)
    
    %OUR FRONT VIEW IS THE XZ PLANE AND SIDE VIEW IS XY PLANE
     RLL1x(i)=RLL1(1);
     RLL1y(i)=RLL1(2);
     RLL1z(i)=RLL1(3);
     if(LL2(2,1)>0)
        QLL1(i)=-acosd(LL2(1,1));
     else
        QLL1(i)=acosd(LL2(1,1)); 
     end
     
     RLL2x(i)=RLL2(1);
     RLL2y(i)=RLL2(2);
     RLL2z(i)=RLL2(3);
     if(LL3(2,1)>0)
        QLL2(i)=-acosd(LL3(1,1));
     else
        QLL2(i)=acosd(LL3(1,1)); 
     end
     
     RLR3x(i)=RLR3(1);
     RLR3y(i)=RLR3(2);
     RLR3z(i)=RLR3(3);
     if(LR3(2,1)>0)
        QLR3(i)=-acosd(LR3(1,1));
     else
        QLR3(i)=acosd(LR3(1,1));
     end
     RLR2x(i)=RLR2(1);
     RLR2y(i)=RLR2(2);
     RLR2z(i)=RLR2(3);
     if(LR2(2,1)>0)
        QLR2(i)=-acosd(LR2(1,1));
     else
        QLR2(i)=acosd(LR2(1,1));
     end
     
     RTx(i)=RT(1);
     RTy(i)=RT(2);
     RTz(i)=RT(3);
     if(T1(2,3)>0)
        QT(i)=-acosd(T1(1,3));
     else
        QT(i)=acosd(T1(1,3));
     end
     
     RLSx(i)=RLS(1);
     RLSy(i)=RLS(2);
     RLSz(i)=RLS(3);
     if((T1(2,3)>0.01))
        QLS(i)=-acosd(T1(1,3));
     else
        QLS(i)=acosd(T1(1,3));
     end
     
     RRSx(i)=RRS(1);
     RRSy(i)=RRS(2);
     RRSz(i)=RRS(3);
     if(T1(2,3)>0.01)
        QRS(i)=-acosd(T1(1,3));
     else
        QRS(i)=acosd(T1(1,3));
     end
     
     RAL2x(i)=RAL2(1);
     RAL2y(i)=RAL2(2);
     RAL2z(i)=RAL2(3);
      if(AL3(2,2)>0)
        QAL2(i)=-acosd(AL3(1,2));
     else
        QAL2(i)=acosd(AL3(1,2));
     end
     
     RAL4x(i)=RAL4(1);
     RAL4y(i)=RAL4(2);
     RAL4z(i)=RAL4(3);
     if(AL5(2,2)>0)
        QAL4(i)=-acosd(AL5(1,2));
     else
        QAL4(i)=acosd(AL5(1,2));
     end
     
     
     RAL6x(i)=RAL6(1);
     RAL6y(i)=RAL6(2);
     RAL6z(i)=RAL6(3);
     if(AL7(2,1)>0)
        QAL6(i)=-acosd(AL7(1,1));
     else
        QAL6(i)=acosd(AL7(1,1));
     end
     
     RAR2x(i)=RAR2(1);
     RAR2y(i)=RAR2(2);
     RAR2z(i)=RAR2(3);
     if(AR3(2,2)>0)
        QAR2(i)=-acosd(AR3(1,2));
     else
        QAR2(i)=acosd(AR3(1,2));
     end
     
     RAR4x(i)=RAR4(1);
     RAR4y(i)=RAR4(2);
     RAR4z(i)=RAR4(3);
     if(AR5(2,2)>0)
        QAR4(i)=-acosd(AR5(1,2));
     else
        QAR4(i)=acosd(AR5(1,2));
     end
     
     RAR6x(i)=RAR6(1);
     RAR6y(i)=RAR6(2);
     RAR6z(i)=RAR6(3);
     if(AR7(2,1)>0)
        QAR6(i)=-acosd(AR7(1,1));
     else
        QAR6(i)=acosd(AR7(1,1));
     end
     
     RN1x(i)=RN1(1);
     RN1y(i)=RN1(2);
     RN1z(i)=RN1(3);
      if(N2(2,2)>0.01)
        QN1(i)=90-acosd(N2(1,2));
     else
        QN1(i)=90+acosd(N2(1,2));
     end
     
     
    %view(0,-90)
    view(-90,0)
    %view(0,90)
    %view(170,55)
    pause(0.1)
      
     if(i~=p)
     hold off
     end
end
fLL1x=Polynomial(Time',RLL1x',0,p-1);
[RLL1x_1,RLL1x_2]=differentiate(fLL1x,Time);
fLL1y=Polynomial(Time',RLL1y',0,p-1);
[RLL1y_1,RLL1y_2]=differentiate(fLL1y,Time);
fLL1z=Polynomial(Time',RLL1z',0,p-1);
[RLL1z_1,RLL1z_2]=differentiate(fLL1z,Time);
fQLL1=Polynomial(Time',QLL1',0,p-1);
[QLL1_1,QLL1_2]=differentiate(fQLL1,Time);
plot3(RLL1x,RLL1y,RLL1z);

fLL2x=Polynomial(Time',RLL2x',0,p-1);
[RLL2x_1,RLL2x_2]=differentiate(fLL2x,Time);
fLL2y=Polynomial(Time',RLL2y',0,p-1);
[RLL2y_1,RLL2y_2]=differentiate(fLL2y,Time);
fLL2z=Polynomial(Time',RLL2z',0,p-1);
[RLL2z_1,RLL2z_2]=differentiate(fLL2z,Time);
fQLL2=Polynomial(Time',QLL2',0,p-1);
[QLL2_1,QLL2_2]=differentiate(fQLL2,Time);
plot3(RLL2x,RLL2y,RLL2z);

fLR2x=Polynomial(Time',RLR2x',0,p-1);
[RLR2x_1,RLR2x_2]=differentiate(fLR2x,Time);
fLR2y=Polynomial(Time',RLR2y',0,p-1);
[RLR2y_1,RLR2y_2]=differentiate(fLR2y,Time);
fLR2z=Polynomial(Time',RLR2z',0,p-1);
[RLR2z_1,RLR2z_2]=differentiate(fLR2z,Time);
fQLR2=Polynomial(Time',QLR2',0,p-1);
[QLR2_1,QLR2_2]=differentiate(fQLR2,Time);
plot3(RLR2x,RLR2y,RLR2z);

fLR3x=Polynomial(Time',RLR3x',0,p-1);
[RLR3x_1,RLR3x_2]=differentiate(fLR3x,Time);
fLR3y=Polynomial(Time',RLR3y',0,p-1);
[RLR3y_1,RLR3y_2]=differentiate(fLR3y,Time);
fLR3z=Polynomial(Time',RLR3z',0,p-1);
[RLR3z_1,RLR3z_2]=differentiate(fLR3z,Time);
fQLR3=Polynomial(Time',QLR3',0,p-1);
[QLR3_1,QLR3_2]=differentiate(fQLR3,Time);
plot3(RLR3x,RLR3y,RLR3z);

fTx=Polynomial(Time',RTx',0,p-1);
[RTx_1,RTx_2]=differentiate(fTx,Time);
fTy=Polynomial(Time',RTy',0,p-1);
[RTy_1,RTy_2]=differentiate(fTy,Time);
fTz=Polynomial(Time',RTz',0,p-1);
[RTz_1,RTz_2]=differentiate(fTz,Time);
fQT=Polynomial(Time',QT',0,p-1);
[QT_1,QT_2]=differentiate(fQT,Time);
plot3(RTx,RTy,RTz);

fLSx=Polynomial(Time',RLSx',0,p-1);
[RLSx_1,RLSx_2]=differentiate(fLSx,Time);
fLSy=Polynomial(Time',RLSy',0,p-1);
[RLSy_1,RLSy_2]=differentiate(fLSy,Time);
fLSz=Polynomial(Time',RLSz',0,p-1);
[RLSz_1,RLSz_2]=differentiate(fLSz,Time);
fQLS=Polynomial(Time',QLS',0,2);
[QLS_1,QLS_2]=differentiate(fQLS,Time);
plot3(RLSx,RLSy,RLSz);

fRSx=Polynomial(Time',RRSx',0,p-1);
[RRSx_1,RRSx_2]=differentiate(fRSx,Time);
fRSy=Polynomial(Time',RRSy',0,p-1);
[RRSy_1,RRSy_2]=differentiate(fRSy,Time);
fRSz=Polynomial(Time',RRSz',0,p-1);
[RRSz_1,RRSz_2]=differentiate(fRSz,Time);
fQRS=Polynomial(Time',QRS',0,p-1);
[QRS_1,QRS_2]=differentiate(fQRS,Time);
plot3(RRSx,RRSy,RRSz);

fAL2x=Polynomial(Time',RAL2x',0,p-1);
[RAL2x_1,RAL2x_2]=differentiate(fAL2x,Time);
fAL2y=Polynomial(Time',RAL2y',0,p-1);
[RAL2y_1,RAL2y_2]=differentiate(fAL2y,Time);
fAL2z=Polynomial(Time',RAL2z',0,p-1);
[RAL2z_1,RAL2z_2]=differentiate(fAL2z,Time);
fQAL2=Polynomial(Time',QAL2',0,2);
[QAL2_1,QAL2_2]=differentiate(fQAL2,Time);
plot3(RAL2x,RAL2y,RAL2z);

fAL4x=Polynomial(Time',RAL4x',0,p-1);
[RAL4x_1,RAL4x_2]=differentiate(fAL4x,Time);
fAL4y=Polynomial(Time',RAL4y',0,p-1);
[RAL4y_1,RAL4y_2]=differentiate(fAL4y,Time);
fAL4z=Polynomial(Time',RAL4z',0,p-1);
[RAL4z_1,RAL4z_2]=differentiate(fAL4z,Time);
fQAL4=Polynomial(Time',QAL4',0,p-1);
[QAL4_1,QAL4_2]=differentiate(fQAL4,Time);
plot3(RAL4x,RAL4y,RAL4z);

fAL6x=Polynomial(Time',RAL6x',0,p-1);
[RAL6x_1,RAL6x_2]=differentiate(fAL6x,Time);
fAL6y=Polynomial(Time',RAL6y',0,p-1);
[RAL6y_1,RAL6y_2]=differentiate(fAL6y,Time);
fAL6z=Polynomial(Time',RAL6z',0,p-1);
[RAL6z_1,RAL6z_2]=differentiate(fAL6z,Time);
fQAL6=Polynomial(Time',QAL6',0,p-1);
[QAL6_1,QAL6_2]=differentiate(fQAL6,Time);
plot3(RAL6x,RAL6y,RAL6z);

fAR2x=Polynomial(Time',RAR2x',0,p-1);
[RAR2x_1,RAR2x_2]=differentiate(fAR2x,Time);
fAR2y=Polynomial(Time',RAR2y',0,p-1);
[RAR2y_1,RAR2y_2]=differentiate(fAR2y,Time);
fAR2z=Polynomial(Time',RAR2z',0,p-1);
[RAR2z_1,RAR2z_2]=differentiate(fAR2z,Time);
fQAR2=Polynomial(Time',QAR2',0,2);
[QAR2_1,QAR2_2]=differentiate(fQAR2,Time);
plot3(RAR2x,RAR2y,RAR2z);

fAR4x=Polynomial(Time',RAR4x',0,p-1);
[RAR4x_1,RAR4x_2]=differentiate(fAR4x,Time);
fAR4y=Polynomial(Time',RAR4y',0,p-1);
[RAR4y_1,RAR4y_2]=differentiate(fAR4y,Time);
fAR4z=Polynomial(Time',RAR4z',0,p-1);
[RAR4z_1,RAR4z_2]=differentiate(fAR4z,Time);
fQAR4=Polynomial(Time',QAR4',0,p-1);
[QAR4_1,QAR4_2]=differentiate(fQAR4,Time);
plot3(RAR4x,RAR4y,RAR4z);


fAR6x=Polynomial(Time',RAR6x',0,p-1);
[RAR6x_1,RAR6x_2]=differentiate(fAR6x,Time);
fAR6y=Polynomial(Time',RAR6y',0,p-1);
[RAR6y_1,RAR6y_2]=differentiate(fAR6y,Time);
fAR6z=Polynomial(Time',RAR6z',0,p-1);
[RAR6z_1,RAR6z_2]=differentiate(fAR6z,Time);
fQAR6=Polynomial(Time',QAR6',0,p-1);
[QAR6_1,QAR6_2]=differentiate(fQAR6,Time);
plot3(RAR6x,RAR6y,RAR6z);

fN1x=Polynomial(Time',RN1x',0,p-1);
[RN1x_1,RN1x_2]=differentiate(fN1x,Time);
fN1y=Polynomial(Time',RN1y',0,p-1);
[RN1y_1,RN1y_2]=differentiate(fN1y,Time);
fN1z=Polynomial(Time',RN1z',0,p-1);
[RN1z_1,RN1z_2]=differentiate(fN1z,Time);
fQN1=Polynomial(Time',QT',0,p-1);
[QN1_1,QN1_2]=differentiate(fQN1,Time);
plot3(RN1x,RN1y,RN1z);

 %MASS
    mLL1=6;
    mLL2=4;
    mLR3=4;
    mLR2=6;
    mT=11;
    mLS=0;
    mRS=0;
    mAL2=3.5;
    mAL4=2.5;
    mAL6=2;
    mAR2=3.5;
    mAR4=2.5;
    mAR6=2;
    mN1=2.5;
    
    MOI=[61745.045; 34961.33; 61745.045; 34961.33; 350291.186; 0; 0; 21644.011; 11154.226; 5935.041;21644.011;11154.226;5935.041;9333.33];

X={RLL1x;RLL2x;RLR2x;RLR3x;RTx;RLSx;RRSx;RAL2x;RAL4x;RAL6x;RAR2x;RAR4x;RAR6x;RN1x};
Y={RLL1y;RLL2y;RLR2y;RLR3y;RTy;RLSy;RRSy;RAL2y;RAL4y;RAL6y;RAR2y;RAR4y;RAR6y;RN1y};
Z={RLL1z;RLL2z;RLR2z;RLR3z;RTz;RLSz;RRSz;RAL2z;RAL4z;RAL6z;RAR2z;RAR4z;RAR6z;RN1z};
X_2={RLL1x_2;RLL2x_2;RLR2x_2;RLR3x_2;RTx_2;RLSx_2;RRSx_2;RAL2x_2;RAL4x_2;RAL6x_2;RAR2x_2;RAR4x_2;RAR6x_2;RN1x_2};
Y_2={RLL1y_2;RLL2y_2;RLR2y_2;RLR3y_2;RTy_2;RLSy_2;RRSy_2;RAL2y_2;RAL4y_2;RAL6y_2;RAR2y_2;RAR4y_2;RAR6y_2;RN1y_2};
Z_2={RLL1z_2;RLL2z_2;RLR2z_2;RLR3z_2;RTz_2;RLSz_2;RRSz_2;RAL2z_2;RAL4z_2;RAL6z_2;RAR2z_2;RAR4z_2;RAR6z_2;RN1z_2};
m=[mLL1;mLL2;mLR2;mLR3;mT;mLS;mRS;mAL2;mAL4;mAL6;mAR2;mAR4;mAR6;mN1];
OMEGA_DOT={QLL1_2;QLL2_2;QLR2_2;QLR3_2;QT_2;QLS_2;QRS_2;QAL2_2;QAL4_2;QAL6_2;QAR2_2;QAR4_2;QAR6_2;QN1_2};

[Z_ZMP]=ZMP(MOI,OMEGA_DOT,m,Z,X,Z_2,X_2,p);
[Y_ZMP]=ZMP(MOI,OMEGA_DOT,m,Y,X,Y_2,X_2,p);

X_ZMP=zeros(1,p);

plot3(X_ZMP,Y_ZMP,Z_ZMP);

figure(2)
plot(Time,Z_ZMP);
figure(3)
plot(Time,Y_ZMP);


