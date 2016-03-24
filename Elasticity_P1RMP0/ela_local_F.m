function M=ela_local_F(p,t)
%        
%         fun1=@(x,y)[1,1];
%         p=[0,1,0;0,0,1];
        fun1=f;

        %设\xi=a+bx+cy,带入（x_i,y_i）=0 或 1可得：
        M=zeros(6,1);
        TE=eye(3);
        TEM=[1 p(1,1),p(2,1);1 p(1,2) p(2,2);1 p(1,3),p(2,3)];
    for i=1:3
        TEMP=TEM\TE(:,i);
        fun2=@(x,y)[TEMP(1)+TEMP(2)*x+TEMP(3)*y;0];
        M(i)=inter_2d(fun1,fun2,p);
    end
    for i=1:3
        TEMP=TEM\TE(:,i);
        fun2=@(x,y)[0;TEMP(1)+TEMP(2)*x+TEMP(3)*y];
        M(i+3)=inter_2d(fun1,fun2,p);
    end
 
end