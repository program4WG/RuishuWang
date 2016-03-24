function ela_main(N)
N=4;
global lambda
lambda=1;
tb=zeros(1,N);
l2=zeros(1,N);
l2b=zeros(1,N);
tborder=zeros(1,N-1);
l2order=zeros(1,N-1);
l2border=zeros(1,N-1);
for n=1:N
    bio_partition(n);%剖分
    Global_stiffness_A;%总纲
    ela_global_F;%右端
    ela_boundary;%边界处理
    ela_Solve2;%解
    [tb(n),l2(n),l2b(n)]=ela_error2;%误差
end

for i=1:N-1
    tborder(i)=log2(tb(i)/tb(i+1));
    l2order(i)=log2(l2(i)/l2(i+1));
    l2border(i)=log2(l2b(i)/l2b(i+1));
end
[l2(1),0,l2b(1),0,tb(1),0]
%【L2误差，L2误差阶，边界误差，边界误差阶，三杠范数误差，三缸范数误差阶】
for k=1:N-1
    [l2(k+1),l2order(k),l2b(k+1),l2border(k),tb(k+1),tborder(k)]   
end
    

end