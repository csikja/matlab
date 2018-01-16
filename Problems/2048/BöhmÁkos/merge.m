function Puj = merge(P)

P = elements2left(P);

for j = 1:3
    
    X = [P(:,j),P(:,j+1)];
    
    for i = 1:4
        
        if X(i,1) == X(i,2)
            
            if X(i,1)>0
                X(i,1) = X(i,1)+1;
                X(i,2) = 0;
                P(:,j:j+1) = X;
            end
            
        end
        
    end 
    
end

Puj=elements2left(P);

end

function B = elements2left(A)

for j = 1:4
    
    for i = 1:4
        
        if A(j,i) == 0
            numzeros = sum(cumsum(A(j,i:end)) == 0);
            a = circshift(A(j,i:end),[-numzeros,2]);
            A(j,:) = [A(j,1:i-1),a];
            numzeros = 0;
        end
        
    end
    
end

B = A;

end