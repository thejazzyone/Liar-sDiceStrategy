function finalTraits = modifiedDogfightGame(zeta,goodTraits,testingVariable)
% 4/11/19
% Thomas Kasl

rng shuffle
%% loop that runs the game as many times as specified

finalTraits = modifiedDogfightGameLoop(zeta,goodTraits,testingVariable);

%% Call output best traits function
% finalTraits = dogfightOutputTraitsStructure(traits,traitsWinner);
% don't need this for now