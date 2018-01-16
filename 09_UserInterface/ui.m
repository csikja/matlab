%%
%
% UI - User Interface
%
% GUI - Graphical User Interface
%

%% Beépített párbeszéd ablakok
%
% üres
out = dialog('WindowStyle', 'normal', 'Name', 'Ez egy ablak');

% hiba
errordlg('File not found');

% segítség
helpdlg('Itt egy kis segítség: ...');

% figyelmeztetés
warndlg('Hello World!')

%% Szöveges bevitel
% 
%
s = {'Név', 'Kor'};
s_def = {'Írd be a neved', 'Írd be a korod'};
t = 'Adatbevitel';
options.Resize='on';            % így kell extra opciókat megadni
options.WindowStyle='normal';

x = inputdlg(s, t, 1, s_def, options)   % az eredmény egy cellában van

%% Lista 
% Csak egy elem jelölhetõ ki
%
str = {'alma', 'körte', 'barack', 'szilva', 'szõlõ'};
listdlg(...
    'PromptString', 'Válassz egy gyümölcsöt:',...
    'SelectionMode', 'single',...,
    'OKString', 'Ezt választom',...
    'CancelString', 'NEEEEEM',...
    'ListString', str)

%%
% Egyszerre több elem is kijelölhetõ
str = {'alma', 'körte', 'barack', 'szilva', 'szõlõ'};
listdlg(...
    'PromptString', 'Válassz egy gyümölcsöt:',...
    'SelectionMode', 'multiple',...
    'ListString', str)
%% Quest
% 
% 2 vagy 3 gomb lehet
% Az utolsó argumentumban pedig mindig az 'alap' gombot kell megadni,
% aminek mindig egyeznie kell valamelyik gomb szövegével
%

choice = questdlg(...
    'Szeretnél kapni bármit?',...
    'Az ablak címe: ez egy kérdése',...
    'Igen szeretnék',...
    'Nem szeretném',...
    'Akármit',...
    'Igen szeretnék')


%% Szín, betûtípus
str = inputdlg('Add meg a szöveget', 'A szöveg', 1, {'Hello World!'}, options)
fnt = uisetfont;
clr = uisetcolor;
figure()
axes('XLim', [-1,1], 'YLim', [-1,1])
t = text('String', str, 'HorizontalAlignment', 'center');
set(t,fnt)
set(t, 'Color', clr)


%%
figure()
axes('XLim', [-1,1], 'YLim', [-1, 1]);
r = rectangle('Position', [0.1, 0.1, 0.5, 0.5]);
opt.FaceColor = [1, 0, 0];
opt.EdgeColor = [1, 1, 0];
opt.LineWidth = 5;
set(r, opt)

%% Könyvtár kiválasztás
d = uigetdir

%% Állomány kiválasztása
[f, p] = uigetfile

%% Állomány megnyitása
%
uiopen

%% Mentés
uisave
uiputfile


%% Bevitel egér kattintásával
figure()
axes('XLim', [-1,1], 'YLim', [-1, 1]);
x = ginput(3)

%%
figure()
axes('XLim', [-2,2], 'YLim', [-2,2])
for i=1:3
    pos = ginput(1)
    rectangle('Position', [pos, 0.2, 0.2], 'FaceColor', [0,0,0])
end

%% UI Objektumok

%% menu
%
menu('Válassz egy gyümölcsöt', 'Alma', 'Körte', 'Barack', 'Szilva')

%% uipanel
%
figure('MenuBar', 'none', 'Position', [300, 200, 800, 400])
uipanel(...
    'Position', [.1, .1, .6, .6],...
    'BorderWidth', 2,...
    'Title', 'Ez egy panel',...
    'FontSize', 18,...
    'TitlePosition', 'centertop')

%% uitable
%
f = figure('Position',[200 200 400 150]);
dat = rand(3); 
cnames = {'Adat1','Adat2','Adat3'};
rnames = {'Elsõ','Második','Harmadik'};

t = uitable('Parent', f,...
            'Data', dat,...
            'ColumnName',cnames,... 
            'RowName',rnames,...
            'ColumnEditable', logical([1, 0, 1]),...
            'Position',[20 20 360 100]);

csvwrite('tabla_out.csv', get(t, 'Data'))
%% uicontrol
%
%% pushbutton

button_Plus = @(obj, evnt) set(findobj('Tag', 'counter'), 'String',num2str(str2double(get(findobj('Tag', 'counter'),'String'))+1));
button_Minus = @(obj, evnt) set(findobj('Tag', 'counter'),'String',num2str(str2double(get(findobj('Tag', 'counter'),'String'))-1));
button_Reset = @(obj, evnt) set(findobj('Tag', 'counter'),'String','0');

f = figure('MenuBar', 'none', 'Position', [300, 200, 800, 400])

b_name = {'Reset', 'Minus', 'Plus'};
button_callbacks = {button_Reset, button_Minus, button_Plus};
g = zeros(1,3);

for i = 1:3
g(i) = uicontrol('Style', 'pushbutton',...
          'String', b_name{i},...
          'Position', [100, 100, 150, 50],...
          'FontSize', 18,...
          'CallBack', button_callbacks{i});
end

align(g, 'HorizontalAlignment', 'Fixed', 20)
axes('Position', [0.4,0.2,0.5,0.6], 'Visible', 'off')
t = text('String', '0',...
     'Position', [0.5, 0.5],...
     'HorizontalAlignment', 'center',...
     'FontSize', 40,...
     'Color', [0, 0, 0],...
     'Tag', 'counter')


%% togglebutton



%% radiobutton
clc
set_buttons = @(obj, evnt) disp(get(obj, 'Value'))
f = figure('Position', [300, 200, 800, 400],...
           'Color', 0.94*[1, 1, 1])
b_name = {'Alma', 'Körte', 'Barack'};
g = zeros(1,3);

for i = 1:3
g(i) = uicontrol('Style', 'radiobutton',...
          'String', b_name{i},...
          'Position', [100, 100, 100, 35],...
          'Callback', set_buttons,...
          'FontSize', 14);
end
align(g, 'HorizontalAlignment', 'Fixed', -5)


%% radiobuttongroup

clc
set_buttons = @(obj, evnt) disp(get(obj, 'Value'))
f = figure('Position', [300, 200, 800, 400],...
           'Color', 0.94*[1, 1, 1])
b_name = {'Alma', 'Körte', 'Barack'};

g = zeros(1,3);
h = uibuttongroup('Visible', 'on',...
                  'Position', [0, 0, 1, 1]);

for i = 1:3
g(i) = uicontrol('Style', 'radiobutton',...
          'String', b_name{i},...
          'Position', [100, 100, 100, 35],...
          'Parent', h,...
          'FontSize', 14);
end
align(g, 'HorizontalAlignment', 'Fixed', -5)

%% checkbox

clc
set_buttons = @(obj, evnt) disp(get(obj, 'Value'))
f = figure('Position', [300, 200, 800, 400],...
           'Color', 0.94*[1, 1, 1])
b_name = {'Alma', 'Körte', 'Barack'};

g = zeros(1,3);

for i = 1:3
g(i) = uicontrol('Style', 'checkbox',...
          'String', b_name{i},...
          'Position', [100, 100, 100, 35],...
          'FontSize', 14);
end
align(g, 'HorizontalAlignment', 'Fixed', -5)


%% edit
clc
f = figure('Position', [300, 200, 800, 400],...
           'Color', 0.94*[1, 1, 1])
       
g = uicontrol('Style', 'edit',...
          'String', 'Ez egy szöveg...',...
          'Position', [100, 200, 300, 150],...
          'FontSize', 14)


%% text

clc
f = figure('Position', [300, 200, 800, 400],...
           'Color', 0.94*[1, 1, 1])
       
g = uicontrol('Style', 'text',...
          'String', 'Ez egy szöveg...',...
          'Position', [100, 200, 300, 150],...
          'FontSize', 18)

%% slider

clc
f = figure('Position', [300, 200, 800, 400],...
           'Color', 0.94*[1, 1, 1])
       
g = uicontrol('Style', 'slider',...
          'Position', [100, 200, 300, 20],...
          'FontSize', 18,...
          'Callback', @(obj, evnt) set(findobj('Tag', 'txt'), 'String', num2str(get(obj, 'Value'))))

txt = uicontrol('Style', 'text',...
          'String', '0',...
          'Position', [100, 300, 200, 40],...
          'FontSize', 20,...
          'Tag', 'txt')
%% listbox

%% popmenu
