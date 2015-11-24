function error = pct_error(candidate, actual)
% Calculates the percent error between candidate value and actual value
error = abs((candidate - actual) ./ actual);
end