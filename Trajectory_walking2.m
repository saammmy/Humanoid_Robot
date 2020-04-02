 function [q2R,q3R,q2L,q3L,p]= Trajectory_walking2(j,showTransition,plo,p,q)
% j=1;
% showTransition=1;
% plo=1;
% p=10;
if(plo==1)
    figure('units','normalized','outerposition',[0 0 1 1])
    %plot([100,100,60,100,100,200,200,160,200,200,300,300,260,300,300,400,400,360,400,400],[0,100,80,60,0,0,100,80,60,0,0,100,80,60,0,0,100,80,60,0],'Color','k','LineWidth',3);
    axis([-300 1000 0 600])
    hold on;
end   
%CURVE FITTING FOR LEG
x=[-100 0 100]';
y=[0 40 0]';
f=Polynomial(x,y,0,2);
BASEy=zeros(1,p);
BASEx=linspace(-100,100,p);
for i=1:p
    BASEy(i)=f(BASEx(i));
end
%CURVE FITTING FOR HIP
x=[-50 0 50]';
y=[500 500 500]';
f=Polynomial(x,y,0,2);
H=zeros(1,p);
L=linspace(-50,50,p);
for i=1:p
    H(i)=f(L(i));
end
for k=j-1:j-1
    %FOR LEFT
            K=k*100;
            Ky=k*0;
            syms L2 L3
            L2=349.70;
            L3=322.0;
            if(rem(k,2)==0)
                basexL=BASEx;
                basexL=basexL+K;
                baseyL=BASEy;
                baseyL=baseyL+Ky;
                h1L=H+240*sind(q)+Ky;
            else
                basexL=zeros(1,p);
                basexL=basexL+K;
                baseyL=zeros(1,p);
                baseyL=baseyL+Ky;
                h1L=H+Ky;
            end
            pyL=zeros(1,p);
            pxL=zeros(1,p);
            siL=zeros(1,p);
            q2L=zeros(1,p);
            q3L=zeros(1,p);
            
            l1L=L;
            l1L=l1L+K;
            h1NL=h1L-baseyL;
            l1NL=l1L-basexL;
    %FOR RIGHT
            if(rem(k,2)==0)
                basexR=zeros(1,p);
                basexR=basexR+K;
                baseyR=zeros(1,p);
                baseyR=baseyR+Ky;
                h1R=H+Ky;
            else
                basexR=BASEx;
                basexR=basexR+K;
                baseyR=BASEy;
                baseyR=baseyR+Ky;
                h1R=H+240*sind(q)+Ky;
              
            end
            pyR=zeros(1,p);
            pxR=zeros(1,p);
            siR=zeros(1,p);
            q2R=zeros(1,p);
            q3R=zeros(1,p);
            %h1R=H+Ky;
            l1R=L;
            l1R=l1R+K;
            h1NR=h1R-baseyR;
            l1NR=l1R-basexR;
    for i=1:p
        %FOR LEFT
        siL(i)=acosd(((h1NL(i).^2)+(l1NL(i).^2)-(L2.^2)-(L3.^2))/(2.*L2.*L3));
        q2L(i)=asind((h1NL(i).*(L3.*sind(siL(i)))+(l1NL(i).*(L2+L3.*cosd(siL(i)))))/((L2+L3.*cosd(siL(i))).^(2)+(L3.*sind(siL(i))).^(2)));
        q3L(i)=q2L(i)-siL(i);
        pyL(i)=L2.*cosd(q2L(i))+baseyL(i);
        pxL(i)=L2.*sind(q2L(i))+basexL(i);
        if(((i==1)||((i==p)&&(k==j-1)))&&plo)
            
            plot([basexL(i),pxL(i)],[baseyL(i),pyL(i)],'-r','LineWidth',2);
            hold on
            plot([pxL(i),l1L(i)],[pyL(i),h1L(i)],'-g','LineWidth',2);
            
%             axis([-418.5 418.5  -1 464])
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
            if(((i==p)||((i==1)&&(k==0)))&&plo)
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
            if(plo==1)
                if(i==1)
                    pause
                else
                    pause(0.01)
                end
            end
    end
    if(k==(j-1))
        txt='YAAAAAY';
        text(500,500,txt);
    end

end