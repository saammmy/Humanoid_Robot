
% Make the Robot Walk 2
clc
clear
save=1;
n=1;
START=1;
ZMP_Plot=1; %ZMP WILL BE PLOTTED AT EVERY STEP (PROVIDED YOU SUPPLY INPUT AS 1)
figure('units','normalized','outerposition',[0 0 1 1]) %FOR FULL SCREEN PLOT
p=10;
q=linspace(15,15,p);% BODY TILT (SIDEWAYS)
VIEW=2; % 2 FOR SIDE VIEW, 1 FOR 3D

for j=START:n % THIS LOP IS FOR NUMBER OF STEPS TO CLIMB
    
    %THESE BELOW VALUES ARE TO BE USED TO SHIFT THE INTIAL POSITION OF THE
    %STATIONARY FOOR
    a=(j-1)*0;
    b=(j-1)*100;
    
    % FOR TRAJECTORY OF STAIRCASE
    if(rem(j,2)==0)
        [qLR2,qLR3,qLL1,qLL2,p]= Trajectory_walking2(j,0,0,p,q);
        hold on;
    else
        [qLL1,qLL2,qLR2,qLR3,p]= Trajectory_walking2(j,0,0,p,q);
        hold on;
    end
    
    %JOINT ANGLES
    qT=linspace(0,0,p); %TORSO(FRONT BEND AND BACK BEND)
    
    %LEG
    qLL=[0,0,0,0,90,0]; %Right Leg Joint Angles
    qLR=[0,0,0,0,90,0]; %Right Leg Joint Angles
    
    %ARM
    qAL1=linspace(-10,10,p); %1ST JOINT ANGLE OF LEFT ARM
    qAR1=linspace(10,-10,p); %1ST JOINT ANGLE OF RIGHT ARM
    qAL=[90,90,-90,45,0,-90-45,0]; %LEFT Arm Joint Angles
    qAR=[-45,90,-90,45,0,-90-45,0]; %RIGHT Arm Joint Angles
    qN=[0,-90]; %NECK JOINT ANGLES
    LW=10; %LINEWIDTH OF THE BODY (PREFERABLY SET IT TO 10)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %TIME
    Time=linspace(0,2,p); 
    
    %DEFINING POSITION OF CENTER OF MASS FROM ORIGIN
    
    %LEFT LEG 
    
        %SHIN
        RLL1x=zeros(1,p);
        RLL1y=zeros(1,p);
        RLL1z=zeros(1,p);
        QLL1=zeros(1,p); %ANGLE WITH RESPECT TO VERTICAL

        %THIGH
        RLL2x=zeros(1,p);
        RLL2y=zeros(1,p);
        RLL2z=zeros(1,p);
        QLL2=zeros(1,p); %ANGLE WITH RESPECT TO VERTICAL
    
    %RIGHT LEG
    
        %THIGH
        RLR3x=zeros(1,p);
        RLR3y=zeros(1,p);
        RLR3z=zeros(1,p);
        QLR3=zeros(1,p); %ANGLE WITH RESPECT TO VERTICAL

        %SHIN
        RLR2x=zeros(1,p);
        RLR2y=zeros(1,p);
        RLR2z=zeros(1,p);
        QLR2=zeros(1,p); %ANGLE WITH RESPECT TO VERTICAL
    %TORSO

        RTx=zeros(1,p);
        RTy=zeros(1,p);
        RTz=zeros(1,p);
        % QT=zeros(1,p);
        QT=-q; %ANGLE WITH RESPECT TO VERTICAL

    %RIGHT SHOULDER
     
        RLSx=zeros(1,p);
        RLSy=zeros(1,p);
        RLSz=zeros(1,p);
        QLS=zeros(1,p);
    
    %LEFT SHOULDER
        
        RRSx=zeros(1,p);
        RRSy=zeros(1,p);
        RRSz=zeros(1,p);
        QRS=zeros(1,p);
    
    %LEFT ARM
    
        %BICEPS
        RAL2x=zeros(1,p);
        RAL2y=zeros(1,p);
        RAL2z=zeros(1,p);
        QAL2=zeros(1,p);

        %FOREARM
        RAL4x=zeros(1,p);
        RAL4y=zeros(1,p);
        RAL4z=zeros(1,p);
        QAL4=zeros(1,p);
    
        %WRIST+HAND
        RAL6x=zeros(1,p);
        RAL6y=zeros(1,p);
        RAL6z=zeros(1,p);
        QAL6=zeros(1,p);

    %RIGHT ARM

        %BICEPS
        RAR2x=zeros(1,p);
        RAR2y=zeros(1,p);
        RAR2z=zeros(1,p);
        QAR2=zeros(1,p);

        %FOREARM
        RAR4x=zeros(1,p);
        RAR4y=zeros(1,p);
        RAR4z=zeros(1,p);
        QAR4=zeros(1,p);

        %WRIST+HAND
        RAR6x=zeros(1,p);
        RAR6y=zeros(1,p);
        RAR6z=zeros(1,p);
        QAR6=zeros(1,p);

    %NECK
    
        RN1x=zeros(1,p);
        RN1y=zeros(1,p);
        RN1z=zeros(1,p);
        QN1=zeros(1,p);

%THE BELOW LOOP CONTAINS THE CALCULATION OF TRANSFORMATION MATRIX, PLOTTING THEM FOR THE GIVEN NO OF ITERATION (p)
% IT ALSO CONTAINS THE CALCULATION OF STATIC BALANCE AND ZMP
        
    for i=1:p
        
        %PLOTTING OF THE WALKING PATH
               
                fill3([-1,-1,-1,-1,-1],[-500 1200 1200 -500 -500],[-340 -340 100 100 -340],[0.25 0.25 0.25]);
                hold on;
                fill3([-0.5 -0.5 -0.5 -0.5 -0.5],[-400 -100 -100 -400 -400],[-140 -140 -100 -100 -140],[1 1 1]);
                fill3([-0.5 -0.5 -0.5 -0.5 -0.5],[0 300 300 0 0],[-140 -140 -100 -100 -140],[1 1 1]);
                fill3([-0.5 -0.5 -0.5 -0.5 -0.5],[400 700 700 400 400],[-140 -140 -100 -100 -140],[1 1 1]);
                fill3([-0.5 -0.5 -0.5 -0.5 -0.5],[800 1100 1100 800 800],[-140 -140 -100 -100 -140],[1 1 1]);
                
                for c=1:n
                    cy=100*c;
                    if(rem(c,2)~=0)
                        plot3([0,200,160,120],[cy,cy,cy-80,cy],[-340 -340 -340 -340],'Color','k','LineWidth',1);
                    else
                        plot3([0,200,160,120],[cy,cy,cy-80,cy],[100 100 100 100],'Color','k','LineWidth',1);
                    end
                end
    
                
                xlabel('X-axis')
                ylabel('Y-axis')
                zlabel('Z-axis')
                
                if(VIEW==1)
                    axis([-200 4000 -500 1200 -500 250])
                    view(170,55) 
                else
                    axis([-200 3000 -500 1200 -500 250])
                    view(0,-90)
                end

                %view(0,-90)
                %view(-90,0)
                %view(0,90)
                
                  for c=2:j
                     cx=(c-2)*0;
                     cy=(c-2)*100;
                     if(rem(c,2)~=0)
                     fill3([200,160,120,200],[100+cy,20+cy,100+cy,100+cy],[100 100 100 100],[0 0.6 0.3])
                     else
                     fill3([200,160,120,200],[100+cy,20+cy,100+cy,100+cy],[-340 -340 -340 -340],[0 0.6 0.3])
                     end
                  end
                  
                  if((j==n)&&(i==10))
                      cy=(n-1)*100;
                     if(rem(n,2)~=0)
                     fill3([200,160,120,200],[100+cy,20+cy,100+cy,100+cy],[-340 -340 -340 -340],[0 0.6 0.3])
                     else
                     fill3([200,160,120,200],[100+cy,20+cy,100+cy,100+cy],[100 100 100 100],[0 0.6 0.3])
                     end
                  end
                      
                  
        Q_ALL(i,1:6,1)=[qLL1(i),0,-qLL2(i)+qLL1(i),qLL2(i)-qT(i),90+q(i),0];
        Q_ALL(i,1:6,2)=[0,0,-qLR3(i)+qLR2(i),qLR3(i)-qT(i),90+q(i),0];
        Q_ALL(i,1,3)=0;
        Q_ALL(i,1:7,4)=[qAL1(i),qAL(2),qAL(3),qAL(4),qAL(5),qAL(6),qAL(7)];
        Q_ALL(i,1:7,5)=[qAR1(i),qAR(2),qAR(3),qAR(4),qAR(5),qAR(6),qAR(7)];
        Q_ALL(i,1:2,6)=[qN(1),qN(2)];
        
        if(rem(j,2)~=0)
         qLL=[qLL1(i),0,-qLL2(i)+qLL1(i),qLL2(i)-qT(i),90+q(i),0];
         qLR=[0,0,-qLR3(i)+qLR2(i),qLR3(i)-qT(i),90+q(i),0];
        else
         qLL=[qLL1(i),0,-qLL2(i)+qLL1(i),qLL2(i)-qT(i),90-q(i),0];
         qLR=[0,0,-qLR3(i)+qLR2(i),qLR3(i)-qT(i),90-q(i),0];
        end
         %      [LL1,LL2,LL3,LL4,LL5,LL6,LLF]=Leg_Left(qLL(1),qLL(2),qLL(3),qLL(4),qLL(5),qLL(6),LW,0);
    %      [LR5,LR4,LR3,LR2,LR1,LR0,LRF]=Leg_Right(qLR(1),qLR(2),qLR(3),qLR(4),qLR(5),qLR(6),LL6,LW,0);
    %      qLL(6)=asind((LL6(2,4)-LR5(2,4))/186);
    
          [LL1,LL2,LL3,LL4,LL5,LL6,LLF]=Leg_Left2(qLL(1),qLL(2),qLL(3),qLL(4),qLL(5),qLL(6),LW,1,j-1,a,b,q(i));
         [LR5,LR4,LR3,LR2,LR1,LR0,LRF]=Leg_Right2(qLR(1),qLR(2),qLR(3),qLR(4),qLR(5),qLR(6),LL6,LW,1,j-1);
         [T0,T1]=TORSO2(0,LL6,LW,j-1);
         [AL1,AL2,AL3,AL4,AL5,AL6,AL7]=Arm_Left2(qAL1(i),qAL(2),qAL(3),qAL(4),qAL(5),qAL(6),qAL(7),T1,LW,j-1);
         [AR1,AR2,AR3,AR4,AR5,AR6,AR7]=Arm_Right2(qAR1(i),qAR(2),qAR(3),qAR(4),qAR(5),qAR(6),qAR(7),T1,LW,j-1);
         [N1,N2]=NECK(qN(1),qN(2),T1,LW);
         [RLL1,RLL2,RLR3,RLR2,RT,RLS,RRS,RAL2,RAL4,RAL6,RAR2,RAR4,RAR6,RN1]=Static(LL1,LL2,LR3,LR2,T0,T1,AL2,AL4,AL6,AR2,AR4,AR6,N1,qLL(2),qLL(3),0,qAL(3),qAL(5),qAL(7),qAR(3),qAR(5),qAR(7),qN(2),0);
        %FOOT RECTANGLE
         fill3([LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4),LLF(1,4)],[LLF(2,4)+122.135,LLF(2,4)+122.135,LLF(2,4)+100,LLF(2,4)+80,LLF(2,4)-80,LLF(2,4)-100,LLF(2,4)-122.135,LLF(2,4)-122.135,LLF(2,4)-100,LLF(2,4)-80,LLF(2,4)+80,LLF(2,4)+100,LLF(2,4)+122.135],[LLF(3,4)+44.45,LLF(3,4)-44.45,LLF(3,4)-62.75,LLF(3,4)-44.45,LLF(3,4)-44.45,LLF(3,4)-60.15,LLF(3,4)-60.15,LLF(3,4)+60.15,LLF(3,4)+60.15,LLF(3,4)+44.45,LLF(3,4)+44.45,LLF(3,4)+62.75,LLF(3,4)+44.45],[0.8 0.8 0.8])
         fill3([LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4),LRF(1,4)],[LRF(2,4)+122.135,LRF(2,4)+122.135,LRF(2,4)+100,LRF(2,4)+80,LRF(2,4)-80,LRF(2,4)-100,LRF(2,4)-122.135,LRF(2,4)-122.135,LRF(2,4)-100,LRF(2,4)-80,LRF(2,4)+80,LRF(2,4)+100,LRF(2,4)+122.135],[LRF(3,4)+44.45,LRF(3,4)-44.45,LRF(3,4)-62.75,LRF(3,4)-44.45,LRF(3,4)-44.45,LRF(3,4)-60.15,LRF(3,4)-60.15,LRF(3,4)+60.15,LRF(3,4)+60.15,LRF(3,4)+44.45,LRF(3,4)+44.45,LRF(3,4)+62.75,LRF(3,4)+44.45],[0.8 0.8 0.8])
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
    %      if(T1(2,3)>0.0001)
    %         QT(i)=-acosd(T1(1,3));
    %      else
    %         QT(i)=acosd(T1(1,3));
    %      end


         RLSx(i)=RLS(1);
         RLSy(i)=RLS(2);
         RLSz(i)=RLS(3);
         if((T1(2,3)>0.0001))
            QLS(i)=-acosd(0.999999*T1(1,3));
         else
            QLS(i)=acosd(0.999999*T1(1,3));
         end

         RRSx(i)=RRS(1);
         RRSy(i)=RRS(2);
         RRSz(i)=RRS(3);
         if(T1(2,3)>0.0001)
            QRS(i)=-acosd(0.999999*T1(1,3));
         else
            QRS(i)=acosd(0.999999*T1(1,3));
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
          if(N2(2,2)>0.0001)
            QN1(i)=90-acosd(N2(1,2));
         else
            QN1(i)=90+acosd(N2(1,2));
         end


        
        pause(0.001)

         if(i~=p)
         hold off
         end
    end

    if(ZMP_Plot==1)

    fLL1x=Polynomial(Time',RLL1x',0,4);
    [RLL1x_1,RLL1x_2]=differentiate(fLL1x,Time);
    fLL1y=Polynomial(Time',RLL1y',0,4);
    [RLL1y_1,RLL1y_2]=differentiate(fLL1y,Time);
    fLL1z=Polynomial(Time',RLL1z',0,4);
    [RLL1z_1,RLL1z_2]=differentiate(fLL1z,Time);
    fQLL1=Polynomial(Time',QLL1',0,4);
    [QLL1_1,QLL1_2]=differentiate(fQLL1,Time);
    plot3(RLL1x,RLL1y,RLL1z);

    fLL2x=Polynomial(Time',RLL2x',0,4);
    [RLL2x_1,RLL2x_2]=differentiate(fLL2x,Time);
    fLL2y=Polynomial(Time',RLL2y',0,4);
    [RLL2y_1,RLL2y_2]=differentiate(fLL2y,Time);
    fLL2z=Polynomial(Time',RLL2z',0,4);
    [RLL2z_1,RLL2z_2]=differentiate(fLL2z,Time);
    fQLL2=Polynomial(Time',QLL2',0,4);
    [QLL2_1,QLL2_2]=differentiate(fQLL2,Time);
    plot3(RLL2x,RLL2y,RLL2z);

    fLR2x=Polynomial(Time',RLR2x',0,4);
    [RLR2x_1,RLR2x_2]=differentiate(fLR2x,Time);
    fLR2y=Polynomial(Time',RLR2y',0,4);
    [RLR2y_1,RLR2y_2]=differentiate(fLR2y,Time);
    fLR2z=Polynomial(Time',RLR2z',0,4);
    [RLR2z_1,RLR2z_2]=differentiate(fLR2z,Time);
    fQLR2=Polynomial(Time',QLR2',0,4);
    [QLR2_1,QLR2_2]=differentiate(fQLR2,Time);
    plot3(RLR2x,RLR2y,RLR2z);

    fLR3x=Polynomial(Time',RLR3x',0,4);
    [RLR3x_1,RLR3x_2]=differentiate(fLR3x,Time);
    fLR3y=Polynomial(Time',RLR3y',0,4);
    [RLR3y_1,RLR3y_2]=differentiate(fLR3y,Time);
    fLR3z=Polynomial(Time',RLR3z',0,4);
    [RLR3z_1,RLR3z_2]=differentiate(fLR3z,Time);
    fQLR3=Polynomial(Time',QLR3',0,4);
    [QLR3_1,QLR3_2]=differentiate(fQLR3,Time);
    plot3(RLR3x,RLR3y,RLR3z);

    fTx=Polynomial(Time',RTx',0,4);
    [RTx_1,RTx_2]=differentiate(fTx,Time);
    fTy=Polynomial(Time',RTy',0,4);
    [RTy_1,RTy_2]=differentiate(fTy,Time);
    fTz=Polynomial(Time',RTz',0,4);
    [RTz_1,RTz_2]=differentiate(fTz,Time);
    fQT=Polynomial(Time',QT',0,4);
    [QT_1,QT_2]=differentiate(fQT,Time);
    plot3(RTx,RTy,RTz);

    fLSx=Polynomial(Time',RLSx',0,4);
    [RLSx_1,RLSx_2]=differentiate(fLSx,Time);
    fLSy=Polynomial(Time',RLSy',0,4);
    [RLSy_1,RLSy_2]=differentiate(fLSy,Time);
    fLSz=Polynomial(Time',RLSz',0,4);
    [RLSz_1,RLSz_2]=differentiate(fLSz,Time);
    fQLS=Polynomial(Time',QLS',0,2);
    [QLS_1,QLS_2]=differentiate(fQLS,Time);
    plot3(RLSx,RLSy,RLSz);

    fRSx=Polynomial(Time',RRSx',0,4);
    [RRSx_1,RRSx_2]=differentiate(fRSx,Time);
    fRSy=Polynomial(Time',RRSy',0,4);
    [RRSy_1,RRSy_2]=differentiate(fRSy,Time);
    fRSz=Polynomial(Time',RRSz',0,4);
    [RRSz_1,RRSz_2]=differentiate(fRSz,Time);
    fQRS=Polynomial(Time',QRS',0,4);
    [QRS_1,QRS_2]=differentiate(fQRS,Time);
    plot3(RRSx,RRSy,RRSz);

    fAL2x=Polynomial(Time',RAL2x',0,4);
    [RAL2x_1,RAL2x_2]=differentiate(fAL2x,Time);
    fAL2y=Polynomial(Time',RAL2y',0,4);
    [RAL2y_1,RAL2y_2]=differentiate(fAL2y,Time);
    fAL2z=Polynomial(Time',RAL2z',0,4);
    [RAL2z_1,RAL2z_2]=differentiate(fAL2z,Time);
    fQAL2=Polynomial(Time',QAL2',0,2);
    [QAL2_1,QAL2_2]=differentiate(fQAL2,Time);
    plot3(RAL2x,RAL2y,RAL2z);

    fAL4x=Polynomial(Time',RAL4x',0,4);
    [RAL4x_1,RAL4x_2]=differentiate(fAL4x,Time);
    fAL4y=Polynomial(Time',RAL4y',0,4);
    [RAL4y_1,RAL4y_2]=differentiate(fAL4y,Time);
    fAL4z=Polynomial(Time',RAL4z',0,4);
    [RAL4z_1,RAL4z_2]=differentiate(fAL4z,Time);
    fQAL4=Polynomial(Time',QAL4',0,4);
    [QAL4_1,QAL4_2]=differentiate(fQAL4,Time);
    plot3(RAL4x,RAL4y,RAL4z);

    fAL6x=Polynomial(Time',RAL6x',0,4);
    [RAL6x_1,RAL6x_2]=differentiate(fAL6x,Time);
    fAL6y=Polynomial(Time',RAL6y',0,4);
    [RAL6y_1,RAL6y_2]=differentiate(fAL6y,Time);
    fAL6z=Polynomial(Time',RAL6z',0,4);
    [RAL6z_1,RAL6z_2]=differentiate(fAL6z,Time);
    fQAL6=Polynomial(Time',QAL6',0,4);
    [QAL6_1,QAL6_2]=differentiate(fQAL6,Time);
    plot3(RAL6x,RAL6y,RAL6z);

    fAR2x=Polynomial(Time',RAR2x',0,4);
    [RAR2x_1,RAR2x_2]=differentiate(fAR2x,Time);
    fAR2y=Polynomial(Time',RAR2y',0,4);
    [RAR2y_1,RAR2y_2]=differentiate(fAR2y,Time);
    fAR2z=Polynomial(Time',RAR2z',0,4);
    [RAR2z_1,RAR2z_2]=differentiate(fAR2z,Time);
    fQAR2=Polynomial(Time',QAR2',0,2);
    [QAR2_1,QAR2_2]=differentiate(fQAR2,Time);
    plot3(RAR2x,RAR2y,RAR2z);

    fAR4x=Polynomial(Time',RAR4x',0,4);
    [RAR4x_1,RAR4x_2]=differentiate(fAR4x,Time);
    fAR4y=Polynomial(Time',RAR4y',0,4);
    [RAR4y_1,RAR4y_2]=differentiate(fAR4y,Time);
    fAR4z=Polynomial(Time',RAR4z',0,4);
    [RAR4z_1,RAR4z_2]=differentiate(fAR4z,Time);
    fQAR4=Polynomial(Time',QAR4',0,4);
    [QAR4_1,QAR4_2]=differentiate(fQAR4,Time);
    plot3(RAR4x,RAR4y,RAR4z);


    fAR6x=Polynomial(Time',RAR6x',0,4);
    [RAR6x_1,RAR6x_2]=differentiate(fAR6x,Time);
    fAR6y=Polynomial(Time',RAR6y',0,4);
    [RAR6y_1,RAR6y_2]=differentiate(fAR6y,Time);
    fAR6z=Polynomial(Time',RAR6z',0,4);
    [RAR6z_1,RAR6z_2]=differentiate(fAR6z,Time);
    fQAR6=Polynomial(Time',QAR6',0,4);
    [QAR6_1,QAR6_2]=differentiate(fQAR6,Time);
    plot3(RAR6x,RAR6y,RAR6z);

    fN1x=Polynomial(Time',RN1x',0,4);
    [RN1x_1,RN1x_2]=differentiate(fN1x,Time);
    fN1y=Polynomial(Time',RN1y',0,4);
    [RN1y_1,RN1y_2]=differentiate(fN1y,Time);
    fN1z=Polynomial(Time',RN1z',0,4);
    [RN1z_1,RN1z_2]=differentiate(fN1z,Time);
    fQN1=Polynomial(Time',QN1',0,4);
    [QN1_1,QN1_2]=differentiate(fQN1,Time);
    plot3(RN1x,RN1y,RN1z);

     %MASS
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

        MOI=[61745.045; 34961.33; 61745.045; 34961.33; 350291.186; 0; 0; 21644.011; 11154.226; 5935.041;21644.011;11154.226;5935.041;9333.33];

        %MOI=[36422.21596; 15091.509; 36422.21596; 15091.509; 350291.186; 0; 0; 21644.011; 11154.226; 5935.041;21644.011;11154.226;5935.041;9333.33];
    
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

        X_ZMP=zeros(1,p)+a;


        plot3(X_ZMP,Y_ZMP,Z_ZMP,'LineWidth',2);
        pause

%         figure(2)
%         plot(Time,Z_ZMP);
%         figure(3)
%         plot(Time,Y_ZMP);
    end
    % INVERSE DYNAMICS

    %TORQUE(i)= (SUM{c=1 to n}(D{i}{c}*q_2{c}))+ (SUM{c=1 to n}(SUM{d=1 to n}(h{i}{c}{d}*q_1{c}*q_1{d})))+ C{i}

    % D{i}{c}= SUM{j=max(i,c) to n}( Trans(U{j}{c}*J{j}*U{j}{i}Transpose)
    % h{i}{c}{d}= SUM{j=max(i,c,d) to n}(nnnnn Trans(U{j}{c}{d}*J{j}*U{j}{i}Transpose)
    % C{i}= SUM{j=i to n}(-m{j}*g*U{j}{i}*r(j to j)

    % JLL1=[
    % JLL2
    % JLR2
    % JLR3
    % JT
    % JAL2
    % JAL4
    % JAL6
    % JAR2
    % JAR4`
    % JAR6
    % JN1
 hold off;  
end
if(save==1)
    T=table(Q_ALL);
        filename='JOINT_ANGLES_WALK.xls';
        writetable(T,filename);
end