function V=Q02(solution,P)
V=zeros(1,3);
B=zeros(3,1);
        TE=eye(3);
        TEM=[1 P(1,1),P(2,1);1 P(1,2) P(2,2);1 P(1,3),P(2,3)];
    for i=1:3
        TEMP=TEM\TE(:,i);
        fun2=@(x,y)TEMP(1)+TEMP(2)*x+TEMP(3)*y;
        B(i)=grade2(solution,fun2,P);
    end
    K=zeros(3);
for i=1:3
        TEMP=TEM\TE(:,i);
        fun1=@(x,y)TEMP(1)+TEMP(2)*x+TEMP(3)*y;
    for j=1:3        
        TEMP=TEM\TE(:,j);
        fun2=@(x,y)TEMP(1)+TEMP(2)*x+TEMP(3)*y;
        K(i,j)=grade2(fun1,fun2,P);
    end
end
V=K\B;
end
