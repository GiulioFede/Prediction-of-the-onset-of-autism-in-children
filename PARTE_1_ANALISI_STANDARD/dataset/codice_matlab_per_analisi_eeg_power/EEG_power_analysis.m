
%Apro eeglab e carico (file-->load existing dataset->\...\LO0195_after_ica_applied.set) cosi da avere altre informazioni che mi torneranno utili


%carico le trial (es. quelle sociali sincrone)
load D:\Personal\Tesi_Magistrale\PARTE_1_ANALISI_STANDARD\dataset\LO0195\non_sociale_asincrono\non_sociale_asincrono.mat

trials = double(trials_non_sociale_asincrono); %cambiare nome al cambiare del dataset caricato nella riga precedente


sampling_rate = EEG.srate;
sampling_period = 1/sampling_rate; % spazio temporale tra un campione e un altro
single_trial_duration = 3000; %ms
size_trials_set = size(trials);
number_of_trials = size_trials_set(2) / single_trial_duration;


%mi riporto le trials nella forma NChannel x LunghezzaTrial x NumeroTrials
%con cui sono più a mio agio
trials = reshape(trials, 128, single_trial_duration, []);

%adesso divido il dataset in due parti: uno che utilizzerò per la baseline
%normalization, e il successivo per calcolare il Welch spectrum
baseline_dataset = zeros(128, 1000, number_of_trials);
baseline_dataset(:,:,:) = trials(:,1:1000,:); %copio solo i primi 1000 sample point di ogni trial

true_trials = zeros(128,2000,number_of_trials);
true_trials = trials(:,1001:end,:); %copio solo gli ultimi 2000 punti di ogni trial

%{
    ottengo la baseline 128xNumeroTrialx500 dove 500 son le frequenze
    analizzate. In praticaper ognuno dei 128 canali e per ciascuna trial
    esistono le baseline associate a 500 frequenze (0,1,2....,500)
%}
baseline = get_baseline_factors(baseline_dataset,sampling_rate);


%{

    Adesso per ogni canale voglio lo spettro medio considerando le 13
    trial.
    Lo spettro di ciascuna trial viene calcolato col metodo di Welch e
    normalizzato con la propria baseline calcolata al passo precedente.

%}

[average_spectrum_for_channel,list_of_frequencies] = get_average_spectrum_for_channel(true_trials, sampling_rate, baseline);


%{
    
    Adesso che per ognuno dei 128 canali ho il suo spettro (frutto della
    media dei 13 spettri (normalizzati con baseline) delle 13 trial,
    calcolo il Relative Power per ogni banda.
    
%}

relative_power_band_per_channel = get_relative_power_band_per_channel(average_spectrum_for_channel,list_of_frequencies);


%{

    Adesso che per ogni canale ho i 5 relative power di ogni banda, calcolo
    5 mappe, ossia ogni mappa contiene la media dei valori che una sola banda
    assume su particolari regioni dello scalpo.

%}

get_scalp_map_per_band(relative_power_band_per_channel, EEG.chanlocs);
























    
   


