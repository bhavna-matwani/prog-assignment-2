[~,cols] = size(PB);
[~,n] = size(PA);
TF = zeros(2,n);
for i = 1:n
    TF(:,i)=TotalForce(PA(:,i),PB,Qb);
end

C = FindCharges(PA,PB,TF)
function C=FindCharges(PA,PB,TF)
A = ForceMatrix(PA(:,1),PB);
B = TF(:,1);
[~,n] = size(PA);
for i = 2:n
    F=ForceMatrix(PA(:,i),PB);
    A = [A;F];
    B = [B;TF(:,2)];
end
    C = A\B;
end
