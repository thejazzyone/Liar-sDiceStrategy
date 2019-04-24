function [finalFinalFinalTraits,finalFinalTraits] = meanDogfight3NI(n,zeta,weightOfConsistency)
% Number of levels: 4
% Total games: 1597
% Estimated Run Time: 964.45 sec. (Thomas)
% 4/12/19
% Thomas Kasl
level = 4;
gamma = zeta;
epsilon = zeta;

for i = 1:5
    traits = meanDogfight2NI(n,zeta,weightOfConsistency);
    finalFinalTraits(i).honesty = traits.honesty;
    finalFinalTraits(i).trust = traits.trust;
    finalFinalTraits(i).aggressive = traits.aggressive;
    finalFinalTraits(i).threshold = traits.threshold;
    finalFinalTraits(i).shifty = traits.shifty;
    finalFinalTraits(i).consideration = traits.consideration;
end

testingVariable = true;

finalFinalFinalTraits = modifiedDogfightGameLoop(gamma,finalFinalTraits,testingVariable);

string = gamesInLevel(level,n,zeta);

disp(string);