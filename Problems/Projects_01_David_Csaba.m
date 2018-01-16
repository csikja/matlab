%% Game of life

%iter�ci�k sz�ma
it=30;

sejtszam=zeros(it);
%�lett�r nagys�ga
n=300;
%elso generacio
g1=randi(2,n)-1;        % itt a 30 helyett n-et kell írni
g2=zeros(n);            % detto
szom=zeros(n);          %

screen = get(0, 'ScreenSize');
screen(1:2) = [];
fx=0.9.*screen(1)./2;
fy=0.9.*screen(2)./2;
fs=min([fx,fy])

fg1=figure(...
    'Position',[10,fy,fs,fs],...
    'MenuBar', 'none',...
    'Name', 'Generation 1',...
    'NumberTitle', 'off')
spy(g1)
fg2=figure(...
    'Position',[fs+30,fy,fs,fs],...
    'MenuBar', 'none',...
    'Name', 'Generation 2',...
    'NumberTitle', 'off')
spy(g2)
%innent�l lehet a gener�ci�k ciklusa

for iter=1:it

    
%szom=zeros(30);
g2=zeros(30);
szom=zeros(30);

for s=1:n
    for o=1:n
        if s==1 
            sorv=[s,s+1];
        elseif s==n
            sorv=[s-1,s];
        else
            sorv=[s-1,s,s+1];
        end
        
        if o==1
            oszv=[o, o+1];
        elseif o==n
            oszv=[o-1, o];
        else
            oszv=[o-1, o, o+1];
        end
        %kisz�molja a szomsz�dok sz�m�t
        szom(s,o)=numel(g1(g1(sorv,oszv)==1)>0)-g1(s,o);
       
    end
end

%kisz�molja a m�sodik gener�ci�t
for s=1:n
    for o=1:n
%ha kevesebb, mint 2 szomsz�dja van, meghal
%ha 2 vagy 3 szimja van, t�l�l
%ha t�bb, mint 3 szomija van, elpusztul
%�res sejtb�l �l� lesz, ha pontosan 3 szomija van

        switch szom(s,o)
            case 3
                g2(s,o)=[1];
            case 2
                if g1(s,o)==1
                    g2(s, o)=[1];
                else
                    g2(s,o)=[0];
                end
            otherwise
                g2(s,o)=[0];
        end
    end
end

figure(fg1)
spy(g1)
figure(fg2)

spy(g2)

%pause (0.5)

g1=g2;
%g2=zeros(30);
%szom=zeros(30);

%print
end


%% Random walk in 2D

n=500;

screen = get(0, 'ScreenSize');
screen(1:2) = [];
fx=0.6.*screen(1);
fy=0.6.*screen(2);
fs=min([fx,fy]);

rwX=zeros(1,n);
rwY=rwX;

for s=2:n
  r=randi(4,1);
  switch r
      case 1
          rwX(1,s)=rwX(1,s-1)+1;
          rwY(1,s)=rwY(1,s-1);          
      case 2
          rwX(1,s)=rwX(1,s-1)-1;
          rwY(1,s)=rwY(1,s-1);
      case 3
          rwX(1,s)=rwX(1,s-1);
          rwY(1,s)=rwY(1,s-1)+1;
      otherwise
          rwX(1,s)=rwX(1,s-1);
          rwY(1,s)=rwY(1,s-1)-1;
  end
end



fg3=figure(...
    'Position',[10,screen(2)-fs-50,fs,fs],...
    'Color',[1 1 1],...
    'MenuBar', 'none',...
   'Name', 'Random walk',...
   'NumberTitle', 'off');
plot(rwX,rwY)
%axis ([-30 30 -30 30]) 
axis off
