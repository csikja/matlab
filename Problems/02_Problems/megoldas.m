%% 1. feladat

names = {'Kovács Gabriella',...
         'Papp Tamás',...
         'Szabó András',...
         'Tóth Virág',...
         'Varga Emese',...
         'Zombori Anna'};
ages = {34, 40, 27, 17, 18, 65};
heights = {173, 169, 195, 162, 156, 170};
weights = {78, 90, 103, 45, 40, 52};


Subject = struct('Name', names,...
                 'Age', ages,...
                 'Height', heights,...
                 'Weight', weights);
             
%% 3 legidősebb neve
clc
[s, id] = sort([Subject(:).Age]);
{Subject(id((end-2):end)).Name}

%% 30 év alattiak neve
clc
{Subject([Subject.Age] < 30).Name}

%% legalább 160cm és legfeljebb 60kg
clc
{Subject([Subject.Height]>=160 & [Subject.Weight]<=60).Name}

%% átlag életkor
clc
mean([Subject.Age])

%% súlyok átlaga és szórása
clc
mean([Subject(:).Weight])
std([Subject(:).Weight])

%% magasságok átlaga és szórása
clc
mean([Subject(:).Height])
std([Subject(:).Height])

%% átlagon felülien magasak neve:
{Subject([Subject(:).Height] > mean([Subject(:).Height])).Name}

%% a legfiatalabb magassága
clc
[s, id] = sort([Subject(:).Age]);
Subject(id(1)).Height



%% Subject feltöltés

if exist('Subject', 'var') == 1
    clc
    disp('Az adatbázis már be van töltve...')
    pause(2)
    n = length(Subject);
    clc
elseif exist('Subject.mat', 'file') == 2
    clc
    load('Subject.mat')
    disp('Az adatbázis betöltése...')
    n = length(Subject);
    pause(2)
    clc
else
    n = 0;
end

exitMenu = false;

while ~exitMenu
    clc
    disp('1. Új adat bevitele')
    disp('2. Adat törlése')
    disp('3. Adat lekérdezése')
    disp('4. Kilépés')
    
    switch input('Válassz menüpontot: ')
        case 1
           clc
           disp('Új adat bevitele.')
           disp('-----------------')
           Subject(n+1).Name = input('Név: ', 's');
           Subject(n+1).Age = input('Kor: ');
           Subject(n+1).Height = input('Magasság: ');
           Subject(n+1).Weight = input('Súly: ');
           disp('Sikeres adatbevitel...')
           pause(1)
        case 2
           clc
           n = length(Subject);
           if n > 0
               for i = 1:n
                   disp([num2str(i), '. ', Subject(i).Name])
               end
               k = input('Adja meg a törölni kívánt rekord sorszámát: ');
               Subject(k) = [];
           end
        case 3
            clc
            for i = input('Sorszám: ')
                   disp([num2str(i), '. ', Subject(i).Name])
            end
            pause
        case 4
            exitMenu = true;
            clc
            if strcmpi((input('Mentsük az adatokat? [i/n] ', 's')), 'i')
                clc
                disp('Adatok mentése...')
                save('Subject', 'Subject')
                pause(2)
                disp('Adatok elmentve. Nyomj egy billentyűt a folytatáshoz.')
                pause
                clc
            end
    end
end


%% cella
clc
A = {'a', 'b', 'c'};
B = num2cell(1:5);
S = cell(5, 3);
for i = 1:3
    for j = 1:5
        S{j, i} = {A{i}, B{j}};
    end
end
S = reshape(S, 1, []);

S{2}
randsample(S, 5)




%%
clc
for a = 1:12
    for b = 1:a
        if a^3 + b^3 == 1729
            disp([num2str(a), '^3 + ', num2str(b), '^3 = 1729'])
        end
    end
end

%%
clc
n = 100;
for a = 1:n
    for b = 1:a
        for c = 1:floor(sqrt(2)*a)
            if a^2 + b^2 == c^2
                disp([num2str(a), '^2 + ', num2str(b), '^2 = ', num2str(c), '^2'])
            end
        end
    end
end

%%
clc
x = randi([1, 100]);
y = 0;
n = 1;

tic
while x ~= y
   
    y = input('Tippelj egy számra: ');
    if x < y
        disp('Kisebbre gondoltam.')
        n = n + 1;
    elseif x > y
        disp('Nagyobbra gondoltam.')
        n = n + 1;
    else
        disp('Eltaláltad!')
        t = toc;
        disp(['A játék ', num2str(t), ' ideig tartott.'])
        disp(['Ennyi próbálkozásra volt szükség: ', num2str(n)])
    end
        
end



