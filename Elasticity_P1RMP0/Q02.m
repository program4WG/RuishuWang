function V=Q02(solution,P)
V=zeros(6,1);
B=zeros(6,1);
        TE=eye(3);
        TEM=[1 P(1,1),P(2,1);1 P(1,2) P(2,2);1 P(1,3),P(2,3)];
    for i=1:3
        TEMP=TEM\TE(:,i);
        fun2=@(x,y)[TEMP(1)+TEMP(2)*x+TEMP(3)*y;0];
        B(i)=inter_2d(solution,fun2,P);
    end
    for i=1:3
        TEMP=TEM\TE(:,i);
        fun2=@(x,y)[0;TEMP(1)+TEMP(2)*x+TEMP(3)*y];
        B(i+3)=inter_2d(solution,fun2,P);
    end
    K=zeros(3);
for i=1:3
        TEMP=TEM\TE(:,i);
        fun1=@(x,y)[TEMP(1)+TEMP(2)*x+TEMP(3)*y;0];
    for j=1:3        
        TEMP=TEM\TE(:,j);
        fun2=@(x,y)[TEMP(1)+TEMP(2)*x+TEMP(3)*y;0];
        K(i,j)=inter_2d(fun1,fun2,P);
        K(i+3,j+3)=inter_2d(fun1,fun2,P);
    end
end
V=K\B;
end