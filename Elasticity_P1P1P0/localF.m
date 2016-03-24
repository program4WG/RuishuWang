function l=localF(p,t)
        fun1=@ff;
        fun11=@ff1;
% function l=localF
%        p=[0 1 1; 0 0 1];
%        t=[1;2;3;1;2;3];
%        s=[2,1,1;3,3,2];
%         fun1=@(x,y)1;
%        fun11=@(x,y)0;
%         

        %设\xi=a+bx+cy,带入（x_i,y_i）=0 或 1可得：
        l=zeros(6,1);
        TE=eye(3);
        TEM=[1 p(1,1),p(2,1);1 p(1,2) p(2,2);1 p(1,3),p(2,3)];
    for i=1:3
        TEMP=TEM\TE(:,i);
        fun2=@(x,y)TEMP(1)+TEMP(2)*x+TEMP(3)*y;
        l(i)=grade2(fun1,fun2,p);
    end
    M1=zeros(3,1);
    TE=eye(3);
    TEM=[1 p(1,1),p(2,1);1 p(1,2) p(2,2);1 p(1,3),p(2,3)];
    for i=1:3
        TEMP=TEM\TE(:,i);
        fun2=@(x,y)TEMP(1)+TEMP(2)*x+TEMP(3)*y;
        l(i+3)=grade2(fun11,fun2,p);
    end
 
end