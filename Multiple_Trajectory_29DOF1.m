function [q2R,q3R,q2L,q3L]= Multiple_Trajectory_29DOF1(j,showTransition,plo)
% j=1;
% showTransition=1;
% plo=1;
for k=0:j-1
    %FOR LEFT
            K=k*50*2*2;
            syms L2 L3
            L2=254.3;
            L3=226.61;
            if(rem(k,2)==0)
                basexL=[-50 -38.89 -27.78 -16.67 -5.56 5.56 16.67 27.78 38.89 50].*4;
                basexL=basexL+K;
                baseyL=[0 8 14 18 20 20 18 14 8 0].*4;
            else
                basexL=zeros(1,10);
                basexL=basexL+K;
                baseyL=zeros(1,10);
            end
            pyL=zeros(1,10);
            pxL=zeros(1,10);
            siL=zeros(1,10);
            q2L=zeros(1,10);
            q3L=zeros(1,10);
            h1L=[450 450 450 450 450 450 450 450 450 450];
            l1L=[-25 -19.45 -13.9 -8.35 -2.8 2.8 8.35 13.9 19.45 25].*4;
            l1L=l1L+K;
            h1NL=h1L-baseyL;
            l1NL=l1L-basexL;
    %FOR RIGHT
            if(rem(k,2)==0)
                basexR=zeros(1,10);
                basexR=basexR+K;
                baseyR=zeros(1,10);
            else
                basexR=[-50 -38.89 -27.78 -16.67 -5.56 5.56 16.67 27.78 38.89 50].*4;
                basexR=basexR+K;
                baseyR=[0 8 14 18 20 20 18 14 8 0].*4;
            end
            pyR=zeros(1,10);
            pxR=zeros(1,10);
            siR=zeros(1,10);
            q2R=zeros(1,10);
            q3R=zeros(1,10);
            h1R=[450 450 450 450 450 450 450 450 450 450];
            l1R=[-25 -19.45 -13.9 -8.35 -2.8 2.8 8.35 13.9 19.45 25].*4;
            l1R=l1R+K;
            h1NR=h1R-baseyR;
            l1NR=l1R-basexR;
    for i=1:10
        %FOR LEFT
        siL(i)=acosd(((h1NL(i).^2)+(l1NL(i).^2)-(L2.^2)-(L3.^2))/(2.*L2.*L3));
        q2L(i)=asind((h1NL(i).*(L3.*sind(siL(i)))+(l1NL(i).*(L2+L3.*cosd(siL(i)))))/((L2+L3.*cosd(siL(i))).^(2)+(L3.*sind(siL(i))).^(2)));
        q3L(i)=q2L(i)-siL(i);
        pyL(i)=L2.*cosd(q2L(i))+baseyL(i);
        pxL(i)=L2.*sind(q2L(i))+basexL(i);
        if(((i==1)||((i==10)&&(k==j-1)))&&plo)
            
            plot([basexL(i),pxL(i)],[baseyL(i),pyL(i)],'-r','LineWidth',2);
            hold on
            plot([pxL(i),l1L(i)],[pyL(i),h1L(i)],'-g','LineWidth',2);
            axis([-418.5 418.5  -1 464])
        elseif (showTransition && plo)
            plot([basexL(i),pxL(i)],[baseyL(i),pyL(i)],'--r');
            plot([pxL(i),l1L(i)],[pyL(i),h1L(i)],'--g');
            hold on
        end
         if((i~=(1))&& plo)
                plot([basexL(i-1),basexL(i)],[baseyL(i-1),baseyL(i)],'-r');
        end      
         % FOR RIGHT
         siR(i)=acosd(((h1NR(i).^2)+(l1NR(i).^2)-(L2.^2)-(L3.^2))/(2.*L2.*L3));
         q2R(i)=asind((h1NR(i).*(L3.*sind(siR(i)))+(l1NR(i).*(L2+L3.*cosd(siR(i)))))/((L2+L3.*cosd(siR(i))).^(2)+(L3.*sind(siR(i))).^(2)));
         q3R(i)=q2R(i)-siR(i);
         pyR(i)=L2.*cosd(q2R(i))+baseyR(i);
         pxR(i)=L2.*sind(q2R(i))+basexR(i);
            if(((i==10)||((i==1)&&(k==0)))&&plo)
                plot([basexR(i),pxR(i)],[baseyR(i),pyR(i)],'-b','LineWidth',2);
                hold on
                plot([pxR(i),l1R(i)],[pyR(i),h1R(i)],'-m','LineWidth',2);
            elseif (showTransition&&plo)
                plot([basexR(i),pxR(i)],[baseyR(i),pyR(i)],'--b');
                hold on
                plot([pxR(i),l1R(i)],[pyR(i),h1R(i)],'--m');
            end
            if((i~=(1))&&plo)
                plot([basexR(i-1),basexR(i)],[baseyR(i-1),baseyR(i)],'-b');
            end
            pause(1)
    end
end