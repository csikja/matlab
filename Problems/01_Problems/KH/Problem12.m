%% Problem 12

X = floor(rand(5,6)*51);

%%
clc
X
a = max(X)

b = min(X')'

c = sum(X')'

d = sum(sum(X(:,2:2:end)))

e = sum(sum(X(:,[1,end])))

f = X(mod(X,2)==0)'

g = length(X(X==50))

h = max(max(X))

i1 = sort(reshape(X,1,numel(X)));
i = i1(1:3)

