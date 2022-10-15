Q=Q.'
[Found,P]=InvertMidpoints(Q);
Found
P.'

function [Found,P]=InvertMidpoints(Q)
    Found=true;
    [rowx_size,colx_size]=size(Q);
    N=rowx_size;
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
        d=C;
        d(1,:)=[];
        t=Q;
        t(1,:)=[];
        P(:,1)=d\t(:,1);
        P(:,2)=d\t(:,2);
        x=(P(1,1)+P(2,1))/2;
        y=(P(1,2)+P(2,2))/2;
        ex=abs(x-Q(1,1));
        ey=abs(y-Q(1,2));
        if(ex>10^-8 | ey>10^-8)
            Found=false;
            P=zeros(N,2);
        end
    end
end
