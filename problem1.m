Q=Q.'
[Found,P]=InvertMidpoints(Q)
Found
P.'
function [Found,P]=InvertMidpoints(Q)
    Found=true;
    [rowx_size,colx_size]=size(Q);
    size(Q)
    N=rowx_size
    
    C=zeros(N:N);
    cnt=1;
    while(cnt<=N)
        if(cnt==N)
           C(cnt,cnt)=0.5;
           C(cnt,1)=0.5;
           break;
        end
        C(cnt,cnt)=0.5;
        C(cnt,cnt+1)=0.5; 
        cnt=cnt+1;
    end
    
    if(rem(rowx_size,2))
        P(:,1)=C\Q(:,1);
        P(:,2)=C\Q(:,2);
    else
        flag=0;
        i=0;
        while(i<N)
            d=C;
            d(N-i,:)=[];
            t=Q;
            t(N-i,:)=[];
            P(:,1)=d\t(:,1);
            P(:,2)=d\t(:,2);
            Q1(:,1)=C*P(:,1);
            Q1(:,2)=C*P(:,2);
            j=1;
            while(j<=N)
                ex=abs(Q(j,1)-Q1(j,1))/Q(j,1);
                ey=abs(Q(j,2)-Q1(j,2))/Q(j,2);
                if(ex>10^(-8)| ey>10^(-8))
                    Found=false;
                    P=zeros(N,2);
                    flag=1;
                    break;
                end
                j=j+1;
            end
            if(flag==0)
                break;
            end
            i=i+1;
        end   
        
    end
endv
