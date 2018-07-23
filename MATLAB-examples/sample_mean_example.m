% Vzemimo populacijo z N = 4 enotami, ki imajo naslednje vrednosti
% spremenljivke X : 0, 1, 2, 3. Izracunajmo populacijsko pricakovano
% vrednost in varianco

function [res] = sample_mean_example()

	population_X = [0,1,2,3];
	
	% Izracunajmo populacijsko povprecje in varianco.
	population_mean = mean(population_X);
	population_variance = var(population_X, 1); % deli z N in ne z N - 1.
	
	% Tvorimo vse mozne vzorce velikosti n s ponavljanjem.
	samples = permn(population_X, 2);
	% Izracunajmo vzorcno povprecje vsakega vzorca.
	samples_mean = mean(samples, 2);

	% Pridobimo vsa unikatna vzorcna povprecja.
	unique_samples_mean = sort(unique(samples_mean));
	
	% Prestej pojavitev vsakega povprecja in izracunaj verjetnostno shemo
	% za slucajno spremenljivko vzorcno povprecje.
	sample_means_probabilities = arrayfun(@(x) nnz(samples_mean == x), unique_samples_mean);
	sample_means_probabilities = sample_means_probabilities ./ length(samples);

	% Prikaži histogram porazdelitve s.s. spremenljivke vzorčno povprečje.
	bar(unique_samples_mean, sample_means_probabilities);
	ylim([0, 0.3]);
	title('Histogram porazdelitve slučajne spremenljivke vzorčno povprečje');
	
	% Izracunajmo pricakovano vrednost vzorcnega povprecja.
	X_bar_E = unique_samples_mean' * sample_means_probabilities;
	
	% Izracunajmo varianco vzorcnega povprecja.
	X_var_D = vvar(unique_samples_mean, sample_means_probabilities);
	
	
end