qv=linspace(0.0001,0.09,7);
sv=linspace(1,90,50);
rhv=[1:50];
for j=1:5
for i=1:50
   q=qv(j);
   s=sv(i);
   rhv(i)=rhkritbz(q,s);
   hold on
   grid on
end
plot(sv,rhv,'-r')
axis([0 90 -1500 2000])
ylabel('R-H-kritérium értéke','FontSize',14)
xlabel('s paraméter','FontSize',14)
end