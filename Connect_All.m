clc
%For Straight Body Arrangement
qLL=[45,0,0,0,90-45,0]; %left Leg Joint Angles
qT=0;  %Torso Joint Angles
qLR=[45,0,90,0,90+45,0]; %Right Leg Joint Angles
qAL=[90,90,-90,90,0,-90-45,0]; %Left Arm Joint Angles
qAR=[-45,90,-90,90,0,-90-45,0]; %Right Arm Joint Angles
qN=[0,-45]; %Neck Joint Angles

% qLR=[0,0,0,0,90,0]; %Right Leg Joint Angles
% qT=0;  %Torso Joint Angles
% qLL=[0,0,0,0,90,0]; %Left Leg Joint Angles
% qAR=[0,90,-90,0,0,-90,0]; %Right Arm Joint Angles
% qAL=[0,90,-90,0,0,-90,0]; %Left Arm Joint Angles
% qN=[0,-90]; %Neck Joint Angles

%for i=1:7
%qLR(i)=input('Enter the Right Leg Joint Angles one by one');
%end
[LR1,LR2,LR3,LR4,LR5,LR6]=LEG_Right(qLR(1),qLR(2),qLR(3),qLR(4),qLR(5),qLR(6));
%qT=input('Enter the Torso Joint angle');
T1=TORSO(qT,LR6);
%for i=1:7
%qAR(i)=input('Enter the Right Arm Joint Angles one by one');
%end
[AR1,AR2,AR3,AR4,AR5,AR6,AR7]=ARM_Right(qAR(1),qAR(2),qAR(3),qAR(4),qAR(5),qAR(6),qAR(7),T1);
%for i=1:7
%qAL(i)=input('Enter the Left Arm Joint Angles one by one');
%end
[AL1,AL2,AL3,AL4,AL5,AL6,AL7]=ARM_Left(qAL(1),qAL(2),qAL(3),qAL(4),qAL(5),qAL(6),qAL(7),T1);
[LL6,LL5,LL4,LL3,LL2,LL1]=LEG_Left(qLL(1),qLL(2),qLL(3),qLL(4),qLL(5),qLL(6),LR6);
[N1,N2]=NECK(qN(1),qN(2),T1);
% disp('Right Leg End Position with joint angles ');
% qLR
% LR6
% disp('Torso End Position with joint angles');
% qT
% T1
% disp('Right Hand End Position with joint angles');
% qAR
% AR7
% disp('Left Hand End Position with joint angles');
% qAL
% AL7
% disp('Left Leg Base Position with joint angles');
% qLL
% LL0
% disp('Neck End Position');
% qN
% N2
hold off;





