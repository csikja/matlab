n = 500;

A = logical(randi([0,1],n,n));



downA = circshift(A, [1, 0]);
downA(1,:) = 0;

upA = circshift(A, [-1, 0]);
upA(end,:) = 0;

rightA = circshift(A, [0, 1]);
rightA(:,1) = 0;
rightDownA = circshift(rightA, [1, 0]);
rightDownA(1,:) = 0;
rightUpA = circshift(rightA, [-1, 0]);
rightUpA(end,:) = 0;

leftA = circshift(A, [0, -1]);
leftA(:,end) = 0;
leftDownA = circshift(leftA, [1, 0]);
leftDownA(1, :) = 0;
leftUpA = circshift(leftA, [-1, 0]);
leftUpA(end,:) = 0;

neighbours = downA + upA + leftA + leftDownA + leftUpA + rightA + rightDownA + rightUpA;

nextGenA = (neighbours == 3 ) | ((neighbours == 2) & A);