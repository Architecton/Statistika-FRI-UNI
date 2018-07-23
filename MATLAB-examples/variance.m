% function [var] = variance(data)
% Compute variance of data vector

function [var] = variance(data)
	% Compute mean of data
	mean = sum(data)/length(data);
	
	% Compute commulative sum of square differences of data from mean.
	var = 0;
	for k = 1:length(data)
		var = var + (data(k) - mean)^2;
	end
	
	% Divide commulative sum with N - 1
	var = var/(length(data) - 1);
end