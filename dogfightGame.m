function [finalTraits,winnersDogfight,mostOftenWinner,bunchOfTraits] = dogfightGame(zeta,goodTraits)
% 4/11/19
% Thomas Kasl

rng shuffle
%% loop that runs the game as many times as specified

[finalTraits,winnersDogfight,mostOftenWinner,bunchOfTraits] = dogfightGameLoop(zeta,goodTraits);

%% Call output best traits function
% finalTraits = dogfightOutputTraitsStructure(traits,traitsWinner);
% don't need this for now