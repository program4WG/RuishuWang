function mainpro(N)
N=3;
global lambda
lambda=1;
tb=zeros(1,N);
l2=zeros(1,N);
l2b=zeros(1,N);
tborder=zeros(1,N-1);
l2order=zeros(1,N-1);
l2border=zeros(1,N-1);
for n=1:N
    mypartition3(n);
    GlobalA;
    GlobalF;
    boundary2;
    Solve2;
   show;
    [tb(n),l2(n),l2b(n)]=error2;
end

for i=1:N-1
    tborder(i)=log2(tb(i)/tb(i+1));
    l2order(i)=log2(l2(i)/l2(i+1));
    l2border(i)=log2(l2b(i)/l2b(i+1));
end
[l2(1),0,l2b(1),0,tb(1),0]
for k=1:N-1
    [l2(k+1),l2order(k),l2b(k+1),l2border(k),tb(k+1),tborder(k)]   
end
end