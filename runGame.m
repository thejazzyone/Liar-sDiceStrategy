function [rounds,nTurnsStore,totalBets,totalDice,playerData,winners] = runGame(rounds,nsDice,win,turn,likelyBS,traits,pHonestArray,nTurnsStore)
% runs rounds until one player wins
%
% Zach Kreft and Zach Safford
% April 7, 2019

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
    