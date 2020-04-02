clc
%For Straight Body Arrangement

qLR=[0,0,0,0,90,0]; %Right Leg Joint Angles
qT=0;  %Torso Joint Angles
qLL=[60,60,0,0,90,0]; %Left Leg Joint Angles
qAR=[0,90,-90,0,0,-90,0]; %Right Arm Joint Angles
qAL=[0,90,-90,0,0,-90,0]; %Left Arm Joint Angles
qN=[0,-90]; %Neck Joint Angles
 LW=10;
% %For Running
% 
% qLL=[45,0,0,0,90-45,0]; %left Leg Joint Angles
% qT=0;  %Torso Joint Angles
% qLR=[45,0,90,0,90+45,0]; %Right Leg Joint Angles
% qAL=[90,90,-90,90,0,-90-45,0]; %Left Arm Joint Angles
% qAR=[-45,90,-90,90+25,0,-90-45,0]; %Right Arm Joint Angles
% qN=[0,-45]; %Neck Joint Angles

disp('Here the Right Leg is considered as Fixed coordinate and enter the joint angles below')
%for i=1:6
%qLR(i)=input('Enter the Left Leg Joint Angles one by one');
%end
[LL1,LL2,LL3,LL4,LL5,LL6,LLF]=Leg_Left2(qLL(1),qLL(2),qLL(3),qLL(4),qLL(5),qLL(6),LW,1,0,0,0,0);
%for i=1:6
%qLR(i)=input('Enter the Right Leg Joint Angles one by one');
%end
[LR5,LR4,LR3,LR2,LR1,LR0,LRF]=Leg_Right2(qLR(1),qLR(2),qLR(3),qLR(4),qLR(5),qLR(6),LL6,LW,1,0);
%qT=input('Enter the Torso Joint angle');
[T0,T1]=TORSO2(qT,LL6,LW,0);
%for i=1:7
%qAL(i)=input('Enter the Right Arm Joint Angles one by one');
%end
[AL1,AL2,AL3,AL4,AL5,AL6,AL7]=Arm_Left2(qAL(1),qAL(2),qAL(3),qAL(4),qAL(5),qAL(6),qAL(7),T1,LW,0);
%for i=1:7
%qAR(i)=input('Enter the Left Arm Joint Angles one by one');
%end
[AR1,AR2,AR3,AR4,AR5,AR6,AR7]=Arm_Right2(qAR(1),qAR(2),qAR(3),qAR(4),qAR(5),qAR(6),qAR(7),T1,LW,0);
[N1,N2]=NECK(qN(1),qN(2),T1,LW);
% disp('Left Leg End Position with joint angles ');
% qLR
% LR6
% disp('Right Leg Base Position with joint angles');
% qLL
% LL0
% disp('Torso End Position with joint angles');
% qT
% T1
% disp('Right Hand End Position with joint angles');
% qAR
% AR7
% disp('Left Hand End Position with joint angles');
% qAL
% AL7
% disp('Neck End Position');
% qN
% N2
[RLL1,RLL2,RLR3,RLR2,RT,RLS,RRS,RAL2,RAL4,RAL6,RAR2,RAR4,RAR6,RN1]=Static(LL1,LL2,LR3,LR2,T0,T1,AL2,AL4,AL6,AR2,AR4,AR6,N1,qLL(2),qLL(3),0,qAL(3),qAL(5),qAL(7),qAR(3),qAR(5),qAR(7),qN(2),0);
plot3([0,0,0,0,0,0,0,0,0,0,0,0,0],[122.135,122.135,100,80,-80,-100,-122.135,-122.135,-100,-80,80,100,122.135],[44.45,-44.45,-62.75,-44.45,-44.45,-60.15,-60.15,60.15,60.15,44.45,44.45,62.75,44.45]);
plot3([LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4)],[LRF(2,4)+122.135,LRF(2,4)+122.135,LRF(2,4)+100,LRF(2,4)+80,LRF(2,4)-80,LRF(2,4)-100,LRF(2,4)-122.135,LRF(2,4)-122.135,LRF(2,4)-100,LRF(2,4)-80,LRF(2,4)+80,LRF(2,4)+100,LRF(2,4)+122.135],[LRF(3,4)+44.45,LRF(3,4)-44.45,LRF(3,4)-62.75,LRF(3,4)-44.45,LRF(3,4)-44.45,LRF(3,4)-60.15,LRF(3,4)-60.15,LRF(3,4)+60.15,LRF(3,4)+60.15,LRF(3,4)+44.45,LRF(3,4)+44.45,LRF(3,4)+62.75,LRF(3,4)+44.45])     

axis([0 2000 -500 500 -450 50])
view(0,0)


hold off;