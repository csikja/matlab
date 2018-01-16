function [I, E] = moransI(X, W)

x = X(:)-mean(X(:));
N = numel(x);

E = -1/(N-1);
I = N/sum(W(:)) * x'*W*x / sum(x.^2);

end