function M=QB2(solution,P)%注意这里的P序要是点序按大小排列的
M=zeros(1,2);
rp=[P(2,2)-P(2,1);P(1,1)-P(1,2)];
B=[linear_inter_d2(solution,B1,P);linear_inter_d2(solution,B2,P);linear_inter_d2(solution,B3(rp),P)];
L=sqrt(sum((P(:,1)-P(:,2)).^2));
K=[1 0 rp(1)/2;...
    0 1 rp(2)/2;...
    rp(1)/2 rp(2)/2 (rp(1)^2+rp(2)^2)/3]*L;
M=K\B;
end
function fun=B1
    fun=@(t)[1;0];
end
function fun=B2
    fun=@(t)[0;1];
end
function fun=B3(rp)
    fun=@(t)[rp(1)*t;rp(2)*t];
end