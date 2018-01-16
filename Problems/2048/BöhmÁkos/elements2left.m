function R=elements2left(M)
for j=1:4
    for i=1:4
        if M(j,i)==0
            numzeros=sum(cumsum(M(j,i:end))==0);
            a=circshift(M(j,i:end),-numzeros,2);
            M(j,:)=[M(j,1:i-1),a];
            numzeros=0;
        end
    end
end
R=M;
end

