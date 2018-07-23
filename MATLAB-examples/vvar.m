% Compute variance of data given probabilities
function [res] = vvar(data, probabilities)
	% Initialize summation.
	res = 0;
	% Compute expected value.
	exp_val = data' * probabilities;
	% Sum.
	for k = 1:length(data)
		res = res + ((data(k) - exp_val)^2)*probabilities(k);
	end
	
end
		