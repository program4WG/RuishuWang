function A=local_stiffness_matrix(p,ps)
% function local_stiffness_matrix
%       p=[0 1 0; 0 0 1];
%       ps=[1 0 0 0 0 1;0 1 0 1 0 0];
      global lambda
     T=(1/2)*abs(det([[1 1 1];p(1,:);p(2,:)]));
     L=[p(:,[3 1 2])-p(:,[2 3 1])];
     N=[L(2,:);-L(1,:)];
     l=zeros(3,1);     
     for i=1:3
         l(i)=sqrt(L(1,i)^2+L(2,i)^2);
     end
     h=0.5*prod(l)/T;
     rp=[ps(2,2)-ps(2,1),ps(2,4)-ps(2,3),ps(2,6)-ps(2,5);...
         ps(1,1)-ps(1,2),ps(1,3)-ps(1,4),ps(1,5)-ps(1,6)];
     A=zeros(15);
     A1=zeros(15);
     A2=zeros(15);
     A3=zeros(15);
     for i=1:3%A1take A2take
         for j=1:3
             A1(4+3*i,4+3*j)=N(1,i)*N(1,j)/T+N(2,i)*N(2,j)/(2*T);
             A1(5+3*i,4+3*j)=N(2,j)*N(1,i)/(2*T);
             A1(4+3*i,5+3*j)=N(2,i)*N(1,j)/(2*T);
             A1(4+3*i,6+3*j)=N(1,i)*N(1,j)*rp(1,j)/(2*T)+N(2,i)*(N(2,j)*rp(1,j)+N(1,j)*rp(2,j))/(4*T);
             A1(6+3*i,4+3*j)=N(1,j)*N(1,i)*rp(1,i)/(2*T)+N(2,j)*(N(2,i)*rp(1,i)+N(1,i)*rp(2,i))/(4*T);
             A1(5+3*i,5+3*j)=N(1,i)*N(1,j)/(2*T)+N(2,i)*N(2,j)/T;
             A1(5+3*i,6+3*j)=N(2,i)*N(2,j)*rp(2,j)/(2*T)+N(1,i)*(N(2,j)*rp(1,j)+N(1,j)*rp(2,j))/(4*T);
             A1(6+3*i,5+3*j)=N(2,j)*N(2,i)*rp(2,i)/(2*T)+N(1,j)*(N(2,i)*rp(1,i)+N(1,i)*rp(2,i))/(4*T);
             A1(6+3*i,6+3*j)=N(1,i)*rp(1,i)*N(1,j)*rp(1,j)/(4*T)+(N(2,i)*rp(1,i)+N(1,i)*rp(2,i))*(N(2,j)*rp(1,j)+N(1,j)*rp(2,j))/(8*T)+N(2,i)*rp(2,i)*N(2,j)*rp(2,j)/(4*T);
             A2(4+3*i,4+3*j)=N(1,i)*N(1,j)/T;
             A2(5+3*i,4+3*j)=N(1,j)*N(2,i)/T;
             A2(4+3*i,5+3*j)=N(1,i)*N(2,j)/T;
             A2(4+3*i,6+3*j)=N(1,i)*N(1,j)*rp(1,j)/(2*T)+N(1,i)*N(2,j)*rp(2,j)/(2*T);
             A2(6+3*i,4+3*j)=N(1,j)*N(1,i)*rp(1,i)/(2*T)+N(1,j)*N(2,i)*rp(2,i)/(2*T);
             A2(5+3*i,5+3*j)=N(2,i)*N(2,j)/T;
             A2(5+3*i,6+3*j)=N(2,i)*N(1,j)*rp(1,j)/(2*T)+N(2,i)*N(2,j)*rp(2,j)/(2*T);
             A2(6+3*i,5+3*j)=N(2,j)*N(1,i)*rp(1,i)/(2*T)+N(2,j)*N(2,i)*rp(2,i)/(2*T);
             A2(6+3*i,6+3*j)=(N(1,i)*rp(1,i)+N(2,i)*rp(2,i))*(N(1,j)*rp(1,j)+N(2,j)*rp(2,j))/(4*T);
         end
     end
     %%内部内部稳定项
     TE=eye(3);
     TEM=[1 p(1,1),p(2,1);1 p(1,2) p(2,2);1 p(1,3),p(2,3)];
     for k=1:3
         K=[1 0 rp(1,k)/2;...
            0 1 rp(2,k)/2;...
            rp(1,k)/2 rp(2,k)/2 (rp(1,k)^2+rp(2,k)^2)/3]*l(k);
        pk=ps(:,[2*k-1,2*k]);
        for i=1:3
            TEMP=TEM\TE(:,i);
            fun2=@(x,y)[TEMP(1)+TEMP(2)*x+TEMP(3)*y;0];%当(x,y)=(x_i,y_i)时方程为1，其他两点为0，
            b=QB2(fun2,pk);%QB2带入的是pk，当pk端点有(x_i,y_i)时方程在这点值为1，不是则为0，所以在求QB时，方程与P的端点顺序无关
            for j=1:3
                TEMP=TEM\TE(:,j);
                fun1=@(x,y)[TEMP(1)+TEMP(2)*x+TEMP(3)*y;0];
                a=QB2(fun1,pk);
                A3(i,j)=A3(i,j)+a'*K*b;
            end
        end
        
     end
     %%内部内部稳定项
     for k=1:3
         K=[1 0 rp(1,k)/2;...
            0 1 rp(2,k)/2;...
            rp(1,k)/2 rp(2,k)/2 (rp(1,k)^2+rp(2,k)^2)/3]*l(k);
        pk=ps(:,[2*k-1,2*k]);
        for i=1:3
            TEMP=TEM\TE(:,i);
            fun2=@(x,y)[TEMP(1)+TEMP(2)*x+TEMP(3)*y;0];%当(x,y)=(x_i,y_i)时方程为1，其他两点为0，
            b=QB2(fun2,pk);%QB2带入的是pk，当pk端点有(x_i,y_i)时方程在这点值为1，不是则为0，所以在求QB时，方程与P的端点顺序无关
            for j=1:3
                TEMP=TEM\TE(:,j);
                fun1=@(x,y)[0;TEMP(1)+TEMP(2)*x+TEMP(3)*y];
                a=QB2(fun1,pk);
                A3(i,j+3)=A3(i,j+3)+a'*K*b;
            end
        end
        
     end
     %%内部N内部稳定项
     for k=1:3
         K=[1 0 rp(1,k)/2;...
            0 1 rp(2,k)/2;...
            rp(1,k)/2 rp(2,k)/2 (rp(1,k)^2+rp(2,k)^2)/3]*l(k);
        pk=ps(:,[2*k-1,2*k]);
        for i=1:3
            TEMP=TEM\TE(:,i);
            fun2=@(x,y)[0;TEMP(1)+TEMP(2)*x+TEMP(3)*y];%当(x,y)=(x_i,y_i)时方程为1，其他两点为0，
            b=QB2(fun2,pk);%QB2带入的是pk，当pk端点有(x_i,y_i)时方程在这点值为1，不是则为0，所以在求QB时，方程与P的端点顺序无关
            for j=1:3
                TEMP=TEM\TE(:,j);
                fun1=@(x,y)[TEMP(1)+TEMP(2)*x+TEMP(3)*y;0];
                a=QB2(fun1,pk);
                A3(i+3,j)=A3(i+3,j)+a'*K*b;
            end
        end
        
     end
     %内部内部
     for k=1:3
         K=[1 0 rp(1,k)/2;...
            0 1 rp(2,k)/2;...
            rp(1,k)/2 rp(2,k)/2 (rp(1,k)^2+rp(2,k)^2)/3]*l(k);
        pk=ps(:,[2*k-1,2*k]);
        for i=1:3
            TEMP=TEM\TE(:,i);
            fun2=@(x,y)[0;TEMP(1)+TEMP(2)*x+TEMP(3)*y];%当(x,y)=(x_i,y_i)时方程为1，其他两点为0，
            b=QB2(fun2,pk);%QB2带入的是pk，当pk端点有(x_i,y_i)时方程在这点值为1，不是则为0，所以在求QB时，方程与P的端点顺序无关
            for j=1:3
                TEMP=TEM\TE(:,j);
                fun1=@(x,y)[0;TEMP(1)+TEMP(2)*x+TEMP(3)*y];
                a=QB2(fun1,pk);
                A3(i+3,j+3)=A3(i+3,j+3)+a'*K*b;
            end
        end
        
     end
     %%边界内部稳定项-take
     for k=1:3
         K=[1 0 rp(1,k)/2;...
            0 1 rp(2,k)/2;...
            rp(1,k)/2 rp(2,k)/2 (rp(1,k)^2+rp(2,k)^2)/3]*l(k);
        pk=ps(:,[2*k-1,2*k]);
        for i=1:3
            TEMP=TEM\TE(:,i);
            fun2=@(x,y)[TEMP(1)+TEMP(2)*x+TEMP(3)*y;0];%当(x,y)=(x_i,y_i)时方程为1，其他两点为0，
            b=QB2(fun2,pk);%QB2带入的是pk，当pk端点有(x_i,y_i)时方程在这点值为1，不是则为0，所以在求QB时，方程与P的端点顺序无关
            A3(i,3*k+4:3*k+6)=-b'*K;
            A3(3*k+4:3*k+6,i)=-K*b;
            fun1=@(x,y)[0;TEMP(1)+TEMP(2)*x+TEMP(3)*y];
            b=QB2(fun1,pk);
            A3(i+3,3*k+4:3*k+6)=-b'*K;
            A3(3*k+4:3*k+6,i+3)=-K*b;
        end
        %%%边界边界
        A3(3*k+4:3*k+6,3*k+4:3*k+6)=K;
        
     end
     A3=A3*(1/h);
     A=A1+lambda*A2+A3;
%      %%测试
%      f1=@(x,y)[1,0];
%      f2=@(x,y)[0,1];
%      f3=@(x,y)[x,0];
%      f4=@(x,y)[0,x];
%      f5=@(x,y)[y,0];
%      f6=@(x,y)[0,y]; 
%      f7=@(x,y)[x+y,x-y];
%      F=f7;
%      G=zeros(15,1);
%      G(1:6)=Q02(F,p);
%      for k=1:3
%          pk=ps(:,[2*k-1,2*k]);
%          G(3*k+4:3*k+6)=QB2(F,pk);
%      end
%      G'*A*G
       
end