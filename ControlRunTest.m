%% ControlRunTest.m
% 4/12/19
% Thomas Kasl
clear
clc
n = 4;
zeta = 10; % the number of games in each level of dogfight between the winners
weightOfConsistency = 5;
control = 2;
switch control
    case 1
        tic
        [traits, winnersArray] = modifiedLdgameNEW(n,weightOfConsistency);
        toc
        levels = false;
    case 2
        tic
        [finalTraits,winnersDogfight,mostOftenWinner,bunchOfTraits] = dogfightNI(n,zeta,weightOfConsistency);
        toc
        levels = true;
        level = 2;
   case 2.1
        tic
        meanDogfightNI(n,zeta,weightOfConsistency)
        toc
        levels = true;
        level = 2;
    case 3
        tic
        [finalTraits,winnersDogfight,mostOftenWinner] = dogfight2NI(n,zeta,weightOfConsistency);
        toc
        levels = true;
        level = 3;
    case 3.1
        tic
        meanDogfight2NI(n,zeta,weightOfConsistency)
        toc
        levels = true;
        level = 3;
    case 4
        tic
        [finalTraits,winnersDogfight,mostOftenWinner] = dogfight3NI(n,zeta,weightOfConsistency);
        toc
        levels = true;
        level = 4;
    case 4.1
        tic
        [winner, bunchOfTraits] = meanDogfight3NI(n,zeta,weightOfConsistency);
        toc
        levels = true;
        level = 4;
    case 5
        tic
        [finalTraits,winnersDogfight,mostOftenWinner] = dogfight4NI(n,zeta,weightOfConsistency);
        toc
        levels = true;
        level = 5;
    case 5.1
        tic
        meanDogfight4NI(n,zeta,weightOfConsistency)
        toc
        levels = true;
        level = 5;
    case 6
        tic
        [finalTraits,winnersDogfight,mostOftenWinner] = dogfight5NI(n,zeta,weightOfConsistency);
        toc
        levels = true;
        level = 6;
    case 6.1
        tic
        meanDogfight5NI(n,zeta,weightOfConsistency)
        toc
        levels = true;
        level = 6;
end
% if levels
%     results = gamesInLevel(level,n,zeta);
% else
%     results = num2str(n);
% end

if control == 1
    disp(' ');
    disp(traits);
end
% disp(['Number of games: ', results]);

disp(' ');
if control == 1 || control == 2 || control == 3 || control == 4 || control == 5 || control == 6 
    if control == 1
        mostOftenWinner = 6;
        winnersDogfight = winnersArray;
    end
    [string1,string2] = calcWins(winnersDogfight,mostOftenWinner);
    disp(string1)
    disp(string2)
end
% load gong.mat; 
% sound(y);
% load handel.mat;
% sound(y, 2*Fs);
beep


if control == 2
    save('goodTraitsSave','bunchOfTraits');
end
