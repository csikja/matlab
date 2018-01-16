% this uses the symbolic capabilities of Matlab
%


filename='eqns.txt';
eqnsCell = importdata(filename, '\n');
eqnsSym = sym(zeros(1,length(eqnsCell)));

for k = 1:length(eqnsCell)
	eqnsSym(k) = eval(eqnsCell{k});
end

vars = symvar(eqnsSym);


[A, B] = equationsToMatrix(eqnsSym, vars);

A = double(A)
B = double(B)

A\B