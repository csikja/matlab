clear all
fv=linspace(0.5,2.5,40);
ev=linspace(0.001,1,40);
rhv=[1:40];
o=zeros(40,1);
rhv(1)=rhkrit(fv(1),ev(1));
for j=2:40
for i=2:40
   f=fv(i);
   e=ev(j);
   rhv(i)=rhkrit(f,e);
   if rhv(i)*rhv(i-1)<0
       it=fv(i-1);
       maxit=it+0.05;
       u=rhv(i-1);
       while abs(u)>1e-6 & it<maxit
           it=it+0.001;
           u=rhkrit(it,e);
           o(j)=it;
       end
   end
   hold on
   grid on
   plot(e,o(j),'mx')
end
%axis([0.9 3.5 0 200])
end
%plot(ev,o,'-k')
o