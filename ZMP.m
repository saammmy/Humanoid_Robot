%For ZMP
%MOMENT OF INERTIA ?
%ANGULAR ACCELERATION  done
%MASS  done
%Z variation wrt time (z,z'')  done
%X variation wrt time (x,x'')   done
%Gravity done

function[ZMP]= ZMP(MOI,omega_dot,mass,x,z,x_doubledot,z_doubledot,p)
g=9.81*1000;
    
    ZMP=zeros(1,p);
    ZMP_upper=zeros(1,p);
    ZMP_lower=zeros(1,p);
    for i=1:p

        for j=1:14
            ZMP_upper(1,i)=ZMP_upper(1,i)+((MOI(j).*omega_dot{j}(i))+(mass(j,1).*x{j}(i)*(z_doubledot{j}(i)-g))-(mass(j,1).*x_doubledot{j}(i)*z{j}(i)));
            ZMP_lower(1,i)=ZMP_lower(1,i)+((mass(j,1)*(z_doubledot{j}(i)-g)));
        end
        ZMP(1,i)=ZMP_upper(1,i)/ZMP_lower(1,i);
    end
end