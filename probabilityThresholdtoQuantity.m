function quantThreshold = probabilityThresholdtoQuantity(nDice,traits,turn)
% Takes an input of the threshold percentage (in the traits structure) and
% the total number of dice along with the turn number and outputs the
% threshold quantity for player(turn) corresponding to his threshold
% percentage.
%   INPUTS
%    nDice - see above
%    traits - see above
%    turn - see above
%   OUTPUTS
%    quantThreshold - the threshold quantity for the given number of dice
%                     and the persons's percentage threshold

% Number of dice is nDice

% Bins structure stores lower and uppper bounds of probability bins for
% each quantity, the largest bin is the average, the smallest bins exist in
% the on the extremes. Note that for 30 dice the difference between the
% probability of 13 and 14 is much smaller than the difference between the
% difference in the probabilities of 9 and 10. This could be important
% later for weighting the average change of the "smart" or average player.

bins(1).lower = 0;
bins(1).upper = binocdf(0,nDice,(1/3));
bins(1).quantity = 1-1;

for i = 2:nDice
    bins(i).quantity = i-1;
    bins(i).lower = bins(i-1).upper;
    bins(i).upper = binocdf((i-1),nDice,(1/3));
end

threshold = traits(turn).threshold;
upperBound = bins(1).upper;
iCount = 1;

while upperBound <= threshold
    iCount = iCount+1;
    upperBound = bins(iCount).upper;
end

quantThreshold = bins(iCount).quantity;