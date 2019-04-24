function finalFinalFinalFinalTraits = meanDogfight4NI(n,zeta,weightOfConsistency)
% Number of levels: 5
% Total games: 9589
% Estimated Run Time:  (Thomas)
% 4/12/19
% Thomas Kasl
level = 5;
iota = zeta;
gamma = zeta;
epsilon = zeta;


for i = 1:5
    traits = meanDogfight3NI(n,zeta,weightOfConsistency);
    finalFinalFinalTraits(i).honesty = traits.honesty;
    finalFinalFinalTraits(i).trust = traits.trust;
    finalFinalFinalTraits(i).aggressive = traits.aggressive;
    finalFinalFinalTraits(i).threshold = traits.threshold;
    finalFinalFinalTraits(i).shifty = traits.shifty;
    finalFinalFinalTraits(i).consideration = traits.consideration;
end


finalFinalFinalFinalTraits = modifiedDogfightGame(iota,finalFinalFinalTraits);

string = gamesInLevel(level,n,zeta);

disp(string);