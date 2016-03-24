function bio_partition(N)
global p t s %刨分点 三角形 边
global NT NE %三角形个数 边个数

% p=[-1,0,1,0;...
%     0,0,0,1];
% s=[1,2,3,1,2;...
%     2,3,4,4,4;...
%     1,2,2,1,1;...
%     -1,-1,-2,-3,2];
% t=[1,2;...
%     2,3;...
%     4,4;...
%     5,3;...
%     4,5;...
%     1,2];
% H=4;
p=[0,1,1,0;...
    0,0,1,1];
s=[1,2,3,1,2;...
    2,3,4,4,4;...
    1,2,2,1,1;...
    -1,-2,-3,-4,2];
t=[1,2;...
    2,3;...
    4,4;...
    5,3;...
    4,5;...
    1,2];
 H=4;
% p=[0,1,0;...
%     0,0,1];
% s=[1,2,1;...
%     2,3,3;...
%     1,1,1;...
%     -1,-2,-3];
% t=[1;2;3;2;3;1];
% H=3;
for l=1:N
   [a,NP]=size(p(1,:));
   [a,NS]=size(s(1,:));
   [a,NT]=size(t(1,:));
    P=p(:,1:NP);
    S=s(:,1:NS);
    T=t(:,1:NT);
 %%%%生成新的P
    pp=zeros(2,NS);
    for i=1:NS
        pp(:,i)=[(P(1,S(1,i))+P(1,S(2,i)))/2;(P(2,S(1,i))+P(2,S(2,i)))/2];
    end
p=[p,pp];
%%%%生成了新的p由上一层的s决定

%%%%%生成新的s
s1=zeros(4,2*NS);
for i=1:NS
    s1(1,2*i-1)=S(1,i);
    s1(2,2*i)=S(2,i);
    s1(2,2*i-1)=NP+i;
    s1(1,2*i)=NP+i;
    s1(3,2*i-1)=S(3,i);
    s1(3,2*i)=S(3,i);
    s1(4,2*i-1)=S(4,i);
    s1(4,2*i)=S(4,i);
end
%%%%生成了s的第一部分s1%%%由上一层的s和上一层的p决定
s2=zeros(4,3*NT);
for i=1:NT
    s2(1,3*i-2)=T(4,i)+NP;
    s2(2,3*i-2)=T(5,i)+NP;
    s2(1,3*i-1)=T(5,i)+NP;
    s2(2,3*i-1)=T(6,i)+NP;
    s2(1,3*i)=T(6,i)+NP;
    s2(2,3*i)=T(4,i)+NP;
    s2(3:4,3*i-2:3*i)=i;
end
%%%%生成了新的s的第二部分s2
s=[s1,s2];
k=2*NS+3*NT;
temp=0;
for i=1:k
    if s(1,i)>s(2,i)
        temp=s(1,i);
        s(1,i)=s(2,i);
        s(2,i)=temp;
    end
end
%%%%生成了新的s
%%%%生成新的t
t1=zeros(6,4*NT);
for i=1:NT
    t1(1:3,4*i-3)=[T(1,i);T(6,i)+NP;T(5,i)+NP];
    t1(1:3,4*i-2)=[T(6,i)+NP;T(2,i);T(4,i)+NP];
    t1(1:3,4*i-1)=[T(5,i)+NP;T(4,i)+NP;T(3,i)];
    t1(1:3,4*i)=[T(5,i)+NP;T(6,i)+NP;T(4,i)+NP];
    t1(4,4*i-3)=2*NS+3*i-1;
    t1(5,4*i-2)=2*NS+3*i;
    t1(6,4*i-1)=2*NS+3*i-2;
    t1(4:6,4*i)=[2*NS+3*i;2*NS+3*i-2;2*NS+3*i-1];
    if T(1,i)<T(3,i)
        t1(5,4*i-3)=2*T(5,i)-1;
        t1(5,4*i-1)=2*T(5,i);
    else
        t1(5,4*i-3)=2*T(5,i);
        t1(5,4*i-1)=2*T(5,i)-1;
    end
    if T(1,i)<T(2,i)
        t1(6,4*i-3)=2*T(6,i)-1;
        t1(6,4*i-2)=2*T(6,i);
    else
        t1(6,4*i-3)=2*T(6,i);
        t1(6,4*i-2)=2*T(6,i)-1;
    end
    if T(2,i)<T(3,i)
        t1(4,4*i-2)=2*T(4,i)-1;
        t1(4,4*i-1)=2*T(4,i);
    else
        t1(4,4*i-2)=2*T(4,i);
        t1(4,4*i-1)=2*T(4,i)-1;
    end
end
t=t1;

[a,nt]=size(t(1,:));
[a,ns]=size(s(1,:));
tr=ones(1,ns);
for i=1:nt
    for j=4:6
        if t(j,i)<=(l+1)*H
            s(3,t(j,i))=i;
        else
            if tr(t(j,i))>0
                s(3,t(j,i))=i;
                tr(t(j,i))=-1;
            else
                s(4,t(j,i))=i;
            end
        end
    end
end
end
% p
%s
% t
NT=size(t,2); 

NE=size(s,2);
end