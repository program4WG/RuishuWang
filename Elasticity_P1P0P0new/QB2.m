function M=QB2(solution,P)%ע�������P��Ҫ�ǵ��򰴴�С���е�

B=[linear_inter_d2(solution,B1,P);linear_inter_d2(solution,B2,P)];
L=sqrt(sum((P(:,1)-P(:,2)).^2));
K=[1 0;...
    0 1]*L;
M=K\B;
end
function fun=B1
    fun=@(t)[1;0];
end
function fun=B2
    fun=@(t)[0;1];
end