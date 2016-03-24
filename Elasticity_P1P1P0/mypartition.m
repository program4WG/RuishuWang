function mypartition(n,a1,a2,b1,b2)

      m=1;
      q=1;
      N=(n+1)^2;
      p=zeros(2,N);
      p(1,m)=a1;
      p(2,m)=b1;
      m=m+1;
      q=-q;
      for k=1:2*n
         
          if k<n+1
              if q<0
                  for i=0:k
                      
                      p(2,m)=((b2-b1)/n)*i+b1;
                      p(1,m)=((a2-a1)/n)*(k-i)+a1;
                      m=m+1;
                      p;
                      
                  end
                  q=-q;
              else
                  for i=0:k
                     
                      p(1,m)=((a2-a1)/n)*i+a1;
                      p(2,m)=((b2-b1)/n)*(k-i)+b1;
                      m=m+1;
                      p;
                      
                  end
                  q=-q;
              end
          else
              
                  if q>0
                      
                      for i=k-n:n
                          
                          p(2,m)=((b2-b1)/n)*(k-i)+b1;
                          p(1,m)=((a2-a1)/n)*(i)+a1;
                          m=m+1;
                          p;
                          
                      end
                      q=-q;
                  else
                      
                      for i=k-n:n
                          
                          p(1,m)=((a2-a1)/n)*(k-i)+a1;
                          p(2,m)=((b2-b1)/n)*(i)+b1;
                          m=m+1;
                          p;
                          
                      end
                      q=-q;
                  end
              
          end
          p
          N

      end
