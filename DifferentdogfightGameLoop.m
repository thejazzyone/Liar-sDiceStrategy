function [finalTraits,winnersDogfight,mostOftenWinner,bunchOfTraits,bestPlayerNumber] = DifferentdogfightGameLoop(zeta)
% 4/11/19
% Thomas Kasl
winnersDogfight = [];

randomPlayerNumbers = randsample(6,6);
shortPlayerNumbers = zeros(1,5);
for i = 1:5
    shortPlayerNumbers(i) = randomPlayerNumbers(i);
end

bestPlayerNumber = randomPlayerNumbers(6);

for iC = 1:zeta
    % MODIFIED TRAITS SET
    for i = shortPlayerNumbers
        % Random values for honesty
        a = 0.5;
        b = 0.7;
        r1 = (b-a)*rand + a;
        
        % Random values for trust
        a = 0.4;
        b = 0.6;
        r2 = (b-a)*rand + a;
        
        % Random value for aggressive
        a = 0.7;
        b = 0.95;
        r3 = (b-a)*rand + a;
        
        % Random values for threshold
        a = 0.59;
        b = 0.61;
        r4 = (b-a)*rand + a;
        
        % Random values for shifty
        a = 0.5;
        b = 0.9;
        r5 = (b-a)*rand + a;
        
        % Random values for consideration
        a = 0.5;
        b = 0.9;
        r6 = (b-a)*rand + a;
        
        bunchOfTraits(i).honesty = r1;
        bunchOfTraits(i).trust = r2;
        bunchOfTraits(i).aggressive = r3;
        bunchOfTraits(i).threshold = r4;
        bunchOfTraits(i).shifty = r5;
        bunchOfTraits(i).consideration = r6;
    end
    % 
    %% THIS IS WHERE YOU MODIFY THE BEST PLAYER TRAITS
    bunchOfTraits(bestPlayerNumber).honesty = 0.4;
    bunchOfTraits(bestPlayerNumber).trust = 0.5;
    bunchOfTraits(bestPlayerNumber).aggressive = 0.6;
    bunchOfTraits(bestPlayerNumber).threshold = 0.6;
    bunchOfTraits(bestPlayerNumber).shifty = 0.4;
    bunchOfTraits(bestPlayerNumber).consideration = 0.8;
    
    traits = bunchOfTraits;
    % Initialize likelyBS
    likelyBS = [1 1 1 1 1 1];
    % Initialize perceived honesty array
    pHonestArray = [0.5,0.5,0.5,0.5,0.5,0.5];
    % number for each player to start with
    startDice = 5;
   
    % player dice number arrray
    nsDice = playerDiceArray(startDice);
    
    % randomly assigns one player to go first
    turn = randi(6);
    % logical variable to run rounds until a player wins
    win = false;
    % counter for number of rounds per game
    rounds = 0;
    % counter for number of lies and truths
    lies = zeros(1,6);
    truths = zeros(1,6);
    
    % runs a game
    [traits,winner] = dogfightRunGame(nsDice,win,turn,likelyBS,traits,pHonestArray,lies,truths);
    % stores game data in array
 
    winnersDogfight = [winnersDogfight, winner];
end
mostOftenWinner = mode(winnersDogfight);
x = mostOftenWinner;
finalTraits.honesty = traits(x).honesty;
finalTraits.trust = traits(x).trust;
finalTraits.aggressive = traits(x).aggressive;
finalTraits.threshold = traits(x).threshold;
finalTraits.shifty = traits(x).shifty;
finalTraits.consideration = traits(x).consideration;

bunchOfTraits = traits;