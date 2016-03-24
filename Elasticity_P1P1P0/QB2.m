function M=QB2(solution,P)
M=zeros(1,2);
B=[gradebo2(solution,B1,P);gradebo2(solution,B2,P)];
L=sqrt(sum((P(:,1)-P(:,2)).^2));
K=[1/3 1/6;1/6 1/3]*L;
M=K\B;
end
function fun=B1
    fun=@(t)1-t;
end
function fun=B2
    fun=@(t)t;
end