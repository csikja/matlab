%ennek ki kellene sz�molni Moran's I-t

%innen van a k�plet:
%https://en.wikipedia.org/wiki/Moran's_I

%bemenet
%"a" 6x6-os vektor az adatokkal
%"w" 36x36-os vektor az �sszehasonl�t�sok t�rbeli s�lyaival

load a.mat
load w.mat

%els� k�rben egy 6x6-os mtx-on pr�b�lom ki

K=numel(a);
%�tlag
atl=sum(sum(a))/numel(a);
%�tlagt�l val� elt�r�s
b=a-atl;
b2=b.^2;
%leend� sz�ml�l�
d=zeros(K,K);

for i=1:K
    
    %d1=0;
    for j=1:K
        %d1=d1+w(i,j)*b(i)*b(j);
        d(i,j)=w(i,j)*b(i)*b(j);
    end
    %d(i)=d1;
end

%Moran's I
I=(numel(a)/sum(sum(w)))*(sum(sum(d))/sum(sum(b2)));
%expected value
E=-1/(numel(a)-1);


fprintf('Observed value: %f\n', I)
fprintf('Expected value: %f\n', E)

%% 
load a.mat
load w.mat
[I,E] = moransI(a, w);


fprintf('Observed value: %f\n', I)
fprintf('Expected value: %f\n', E)
 
 
% new data
clc
 
body = [4.090434 3.61092 2.37024 2.02815 -1.46968];
a = body;
 
w =  [ 0         0         0         0   0;
       2.3809525 0         0         0   0;
       1.0204081 1.0204082 0         0   0;
       0.8064516 0.8064516 0.8064516 0   0;
       0.5       0.5       0.5       0.5 0];
w = w+w';

[I,E] = moransI(a, w);


fprintf('Observed value: %f\n', I)
fprintf('Expected value: %f\n', E)

 
 

 
 
 
 
 