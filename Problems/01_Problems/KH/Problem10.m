clc
a = mod(repmat([1:4]', [1, 6])+repmat([1:6], [4,1]),2)

b = diag(2*ones(6,1),0)+diag(7*ones(5,1),-1)+diag(5*ones(5,1),1)

c = repmat([1:4]', [1, 4])

d = reshape(cat(1,(1:12), zeros(1,12)),6,4)

e = zeros(4,7);
e(2:3,3:5) = 1

f = zeros(6,7);
f (3:4,1:3) = 2;
f (:,4:5) = 3;
f (1:3,6:end) = 1;
f (4:end,6:end) = 5