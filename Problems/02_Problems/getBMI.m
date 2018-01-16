function varargout = getBMI(S)

nargoutchk(0,2)
bmi = S.Weight./((S.Height/100).^2);

switch nargout
    case 0        
        c = classifyBMI(bmi);
        clc
        disp(['Név: ', S.Name])
        disp(['BMI: ', num2str(bmi)])
        disp(['Osztályozás: ', c{2}])
    case 1
        varargout = {bmi};
    case 2
        c = classifyBMI(bmi);
        varargout = {bmi, c{1}};
end


end


function c = classifyBMI(bmi)

if 0 <= bmi && bmi < 16
    c = {-3, 'Súlyos soványság'};
elseif 16 <= bmi && bmi < 17
    c = {-2, 'Mérsékelt soványság'};
elseif 17 <= bmi && bmi < 18.5
    c = {-1, 'Enyhe soványság'};
elseif 18.5 <= bmi && bmi < 25
    c = {0, 'Normál testsúly'};
elseif 25 <= bmi && bmi < 30
    c = {1, 'túlsúlyos'};
elseif 30 <= bmi && bmi < 35
    c = {2, 'I. fokú elhízás'};
elseif 35 <= bmi && bmi < 40
    c = {3, 'II. fokú elhízás'};
else
    c = {4, 'III. Fokú elhízás'};
end

end