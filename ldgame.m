function [winners,fullnTurnsStore,fullTotalBets,fullTotalDice] = ldgame(n)
% plays n games of liar's dice with 6 players starting with 5 dice each and
% starting with a random player.
%   INPUT
%    n - number of games to be played
%   OUTPUTS
%    winners - a 1 x n array of the numbers corresponding to the winning
%              players
%    fullnTurnsStore - a cell array with two rows, the first row is the
%                      game number and the second row contains an array
%                      with the first row being the round number and the
%                      second row being the total # of turns in that round
%    fullTotalBets - a cell array with two rows, the first row is the game
%                    number and the second row contains a cell array with
%                    all of the bets from each round of that game and the
%                    total number of dice in the corresponding round
%    fullTotalDice - a cell array with two rows, the first row containing
%                    the game number and the second row containing a cell
%                    array with the dice rolls for each player and each
%                    round
%    fullPlayerData - a cell array with two rows, the first row is game
%                     number, and the second row contains a cell array with
%                     the round playerWhoLost and playerWhoBSed data
%
% 3/19/19
% Thomas Kasl

% preallocates the array to store the numbers of the winners
winners = zeros(1,1);
% cell array to store an array with number of turns for each round for each
% game
fullnTurnsStore = {}; % row 1 is game number, row 2 is array with round numbers and # of turns
% cell array to store the bets from each round for each game
fullTotalBets = {};
% cell array to store the dice from each round for each game
fullTotalDice = {};
% cell array to store the player who lost and player who bsed for each
% round for each game
fullPlayerData = {};
%% loop that runs the game as many times as specified
for iC = 1:n
    % Calls the generate traits function to generate traits structure for
    % each game
    traits = generateTraits(n);
    % Initialize likelyBS
    likelyBS = ones(6);
    % Initialize perceived honesty array
    pHonestArray = ones(6);
    % cell array to store the bets from each round
    totalBets = {};
    % cell array to store the dice each player had for each round
    totalDice = {};
    % cell array to store the players who lost a die in each round and the
    % player who called BS in each round
    playerData = {};
    % number for each player to start with
    startDice = 5;
    % player dice number array intitialize
    nsDice = zeros(6);
    % player dice number arrray
    for i = 1:6
        nsDice(i) = startDice;
    end
    % randomly assigns one player to go first
    turn = randi(6);
    % logical variable to run rounds until a player wins
    win = false;
    % counter for number of rounds per game
    rounds = 0;
    % store total turns in each round
    nTurnsStore = {};
    % runs a game
    while ~win
        % runs ldround function reducing the total number of die by 1 each
        % round
        [nsDice,turn,totalTurns,likelyBS,nDice,bets,dice,playerWhoLost,playerWhoBSed] =...
        ldround(nsDice,turn,likelyBS,traits,pHonestArray);
        % increments number of rounds counter
        rounds = rounds+1;
        % stores total turns in round in nTurnsStore array
        nTurnsStore(1,rounds) = rounds;
        nTurnsStore(2,rounds) = totalTurns;
        % stores all the bets from the round in the total bets array
        %    the first row is the round number
        %    the second row is the cell array with all the bets from that
        %       round
        %    the third row is the total number of dice from that round
        totalBets(1,rounds) = rounds;
        totalBets(2,rounds) = bets;
        totalBets(3,rounds) = nDice;
        % stores the dice array from each round
        totalDice(1,rounds) = rounds;
        totalDice(2,rounds) = dice;
        % stores the player data from each round
        playerData(1,rounds) = rounds;
        playerData(2,rounds) = playerWhoLost;
        playerData(3,rounds) = playerWhoBSed;
        % a counting variable to check how many players have zero dice
        numZs = 0;
        % loop to check for a winner
        for iT = 1:6
            if nsDice(iT) == 0 % if player iT has 0 dice then increment counter by 1
                numZs = numZs+1; % increment counter
            elseif nsDice(iT) ~= 0 % if player does not have zero dice then winner
                winner = iT;
            end
            if numZs == 5 % if 5 players have 0 dice
                win = true; % then logical variable win is true and while loop
                            % stops
                winners(1,iC) = winner; % the player who one is notated
            end
        end
    end
    
    fullnTurnsStore{1,iC} = iC;
    fullnTurnsStore{2,iC} = nTurnsStore;
    fullTotalBets{1,iC} = iC;
    fullTotalBets{2,iC} = totalBets;
    fullTotalDice{1,iC} = iC;
    fullTotalDice{2,iC} = totalDice;
    fullPlayerData{1,iC} = iC;
    fullPlayerData{2,iC} = playerData;
end