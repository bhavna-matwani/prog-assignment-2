%Function Call
%PA = [0;1];
%PB = [4,1,-3; 4,0,1];
%ForceMatrix(PA,PB)

function F=ForceMatrix(PA,PB)
[~,cols] = size(PB);
F = zeros(2,cols);
    for i = 1:cols
        pb = PB(:,i);
        F(:,i) = (PA - pb)/(norm(PA-pb))^3;
    end
end
