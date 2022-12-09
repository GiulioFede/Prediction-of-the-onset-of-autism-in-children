

%Apro eeglab e carico (file-->load existing dataset->\...\LO0195_after_ica_applied.set) cosi da avere altre informazioni che mi torneranno utili

%carico le trial (es. quelle sociali sincrone)
load D:\Personal\Tesi_Magistrale\PARTE_1_ANALISI_STANDARD\dataset\LO0195\sociale_sincrono\sociale_sincrono.mat

trials = double(trials_sociale_sincrono); %cambiare nome al cambiare del dataset caricato nella riga precedente


sampling_rate = EEG.srate;
sampling_period = 1/sampling_rate; % spazio temporale tra un campione e un altro
single_trial_duration = 3000; %ms
size_trials_set = size(trials);
number_of_trials = size_trials_set(2) / single_trial_duration;

%mi riporto le trials nella forma NChannel x LunghezzaTrial x NumeroTrials
%con cui sono più a mio agio
trials = reshape(trials, 128, single_trial_duration, []);

[number_of_channels, length_of_single_trial, number_of_trials] = size(trials);

%come trials considero solo quella parte che comprende solo gli ultimi 2000ms
%true_trials = zeros(128,2000,number_of_trials);
%true_trials = trials(:,1001:end,:); %copio solo gli ultimi 2000 punti di ogni trial









%{

    Adesso applico a tutte le trials (con stimolo fermo + stimolo movimento) il filtro Laplaciano al fine di
    rimuovere la volume conduction

%}

%channel_trials_without_volume_conduction = remove_volume_conduction(trials, EEG.chanlocs);


%{

 Adesso che ho rimosso la volume conduction posso calcolare le N all-to-all
 connectivity matrix usando l'ISPC dove N sono le frequenze di interesse.

%}

%get_all_to_all_connectivity(channel_trials_without_volume_conduction, sampling_rate); 


%{

 Senza necessità di rimuovere la volume conduction posso calcolare la
 stessa matrice ma utilizzando l'Imaginary Coherence.

%}

imaginary_coherence_matrix = get_all_to_all_imaginary_coherence_connectivity(trials, sampling_rate);
