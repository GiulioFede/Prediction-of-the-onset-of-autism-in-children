




%{
    Questa funzione calcola per ogni canale i 13 spettri, dove ciascuno è
    calcolato secondo il metodo di Welch. Poi normalizza ciascuno dei 13 spettri con la relativa baseline. 
    Infine fa la media di tali spettri e
    questo costituisce l'average spectrum per quel canale.

    NB: 13 è un esempio del caso LO0195 sociale-sincrono
%}

function [average_spectrum_for_channel,hz] = get_average_spectrum_for_channel(true_trials, sampling_rate, baseline, do_baseline_normalization) %sarebbero gli ultimi 2000ms di ogni trial

    number_of_channels = size(true_trials,1);

    %creo una matrice 128x500, ossia contenente per ogni canale i 501
    %valori di potenza dello spettro medio ottenuto dalle sue 13 trial
    average_spectrum_for_channel = zeros(number_of_channels, 501);

    %per ogni canale...
    for channel_i=1:number_of_channels

        %calcolo i 13 spettri, ciascuno smussato con il metodo di Welch
        
        % number of FFT points (frequency resolution)
        nfft = sampling_rate;
        
        window_length = 2000*0.35; % 35% della lunghezza del segnale
        
        overlapping = window_length/2; % 50% di overlapping
        
        %avendo 13 trial e 501 frequenze, power sarà una matrice 501x13
        [power, hz] = pwelch(squeeze(true_trials(channel_i,:,:)), hamming(window_length), overlapping,nfft,sampling_rate, "power");
        
        %trasformo in potenza comprendibile graficamente
        power=(power*2);

        %Se si vuole fare la baseline normalization (versione vecchia)
        if do_baseline_normalization == true
            %normalizzo lo spettro di ogni trial con la propria baseline
            normalized_power = 10*log10(power ./ squeeze(baseline(channel_i,:,:))' );
            power = normalized_power;
            fprintf("Normalizzazione fatta.\n");
        else
            fprintf("Normalizzazione fatta in precedenza. Procedo direttamente al calcolo dello spettro medio per canale.\n");
        end
       

        %{
            power è una matrice 501x13, ossia ognuna delle 13 trial ha 501
            valori di potenza della relativa frequenza.
            Io voglio ottenere un unico spettro, che sarebbe la media tra
            tutti loro.
                trial1    trial2   trial2 ...
            f1:    10      12        5        --> voglio la media qui, per riga 
            f2:    4       8 ...
            f3
            ...
        %}
        average_power_spectrum_channel_i = mean(power,2);

        %lo salvo
        average_spectrum_for_channel(channel_i,:) = average_power_spectrum_channel_i;
        
    end
    

end
    