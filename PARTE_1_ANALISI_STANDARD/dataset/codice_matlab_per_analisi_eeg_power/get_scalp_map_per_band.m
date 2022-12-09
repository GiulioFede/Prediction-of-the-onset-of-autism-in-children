%{
    
    Definiamo le seguenti regioni di interesse sullo scalpo:
 left frontopolar (LFP), right frontopolar (RFP), left frontal (LF), 
 right frontal (RF), left parietal (LP), right parietal (RP), left temporal (LT), 
 right temporal (RT), left occipital (LO), and right occipital (RO)

Calcoleremo 5 mappe, una per ogni banda, avendo cura di fare la media del
valore che quella banda assume in ogni elettrodo per regione.
    
%}

function get_scalp_map_per_band(relative_power_band_per_channel, chanlocs) 

    %abbiamo 5 bande, quindi 5 mappe
    num_maps = 5;

    %definisco gli indici degli elettrodi che fanno parte di ogni regione
    LFP = [21,22,18,19,23,26,25,32];
    RFP = [14,10,4,9,3,8,2,1];
    LF  = [33,27,28,24,29,20,30,13,12,7];
    RF  = [5,106,112,118,105,124,111,117,123,122];
    LT  = [34,40,46,51,58,50,45,39];
    LP  = [35,41,47,52,42,36,60,53,37,61,54,31];
    RP  = [80,79,78,87,86,85,92,93,104,98,103,110];
    RT  = [116,109,102,97,96,101,108,115];
    LO  = [59,67,71,66,65,70];
    RO  = [77,76,84,83,91,90];

    %{

        Di seguito stampo le 5 mappe dove mostro il relative power per OGNI
        ELETTRODO.

    %}

    figure(5), clf
    sgtitle("Relative Power Topographical Map for each band (each electrode shows its own RP value)")
    subplot(2,3,1);
    topoplotIndie(relative_power_band_per_channel(:,1), chanlocs, 'electrodes','labels','numcontour',0);
    title("Relative Power of delta band for each channel");
    colorbar
    colormap jet

    subplot(2,3,2);
    topoplotIndie(relative_power_band_per_channel(:,2), chanlocs, 'electrodes','labels','numcontour',0);
    title("Relative Power of theta band for each channel");
    colorbar
    colormap jet

    subplot(2,3,3);
    topoplotIndie(relative_power_band_per_channel(:,3), chanlocs, 'electrodes','labels','numcontour',0);
    title("Relative Power of alpha band for each channel");
    colorbar
    colormap jet

    subplot(2,3,4);
    topoplotIndie(relative_power_band_per_channel(:,4), chanlocs, 'electrodes','labels','numcontour',0);
    title("Relative Power of beta band for each channel");
    colorbar
    colormap jet

    subplot(2,3,5);
    topoplotIndie(relative_power_band_per_channel(:,5), chanlocs, 'electrodes','labels','numcontour',0);
    title("Relative Power of low gamma band for each channel");
    colorbar
    colormap jet


   %{

        Di seguito invece stampo le 5 mappe dove mostro il relative power per OGNI
        REGIONE.

   %}

    %prendo la percentuale di rp massima per avere un plotting con limiti
    %comparabili
    max_rp_delta = max(relative_power_band_per_channel(:,1));
    max_rp_theta = max(relative_power_band_per_channel(:,2));
    max_rp_alpha = max(relative_power_band_per_channel(:,3));
    max_rp_beta = max(relative_power_band_per_channel(:,4));
    max_rp_low_gamma = max(relative_power_band_per_channel(:,5));

    %mappa per la banda delta
    LFP_mean_rp = get_region_value(LFP,relative_power_band_per_channel(:,1));
    RFP_mean_rp = get_region_value(RFP,relative_power_band_per_channel(:,1));
    LF_mean_rp = get_region_value(LF,relative_power_band_per_channel(:,1));
    RF_mean_rp = get_region_value(RF,relative_power_band_per_channel(:,1));
    LT_mean_rp = get_region_value(LT,relative_power_band_per_channel(:,1));
    LP_mean_rp = get_region_value(LP,relative_power_band_per_channel(:,1));
    RP_mean_rp = get_region_value(RP,relative_power_band_per_channel(:,1));
    RT_mean_rp = get_region_value(RT,relative_power_band_per_channel(:,1));
    LO_mean_rp = get_region_value(LO,relative_power_band_per_channel(:,1));
    RO_mean_rp = get_region_value(RO,relative_power_band_per_channel(:,1));
    createTopoplotForRegion(LFP_mean_rp,RFP_mean_rp,LF_mean_rp,RF_mean_rp,LT_mean_rp,LP_mean_rp,RP_mean_rp,RT_mean_rp,LO_mean_rp,RO_mean_rp, ...
                            LFP,        RFP,        LF,        RF,        LT,        LP,        RP,        RT,        LO,        RO, ...
                            "delta", chanlocs,7);

    %mappa per la banda theta
    LFP_mean_rp = get_region_value(LFP,relative_power_band_per_channel(:,2));
    RFP_mean_rp = get_region_value(RFP,relative_power_band_per_channel(:,2));
    LF_mean_rp = get_region_value(LF,relative_power_band_per_channel(:,2));
    RF_mean_rp = get_region_value(RF,relative_power_band_per_channel(:,2));
    LT_mean_rp = get_region_value(LT,relative_power_band_per_channel(:,2));
    LP_mean_rp = get_region_value(LP,relative_power_band_per_channel(:,2));
    RP_mean_rp = get_region_value(RP,relative_power_band_per_channel(:,2));
    RT_mean_rp = get_region_value(RT,relative_power_band_per_channel(:,2));
    LO_mean_rp = get_region_value(LO,relative_power_band_per_channel(:,2));
    RO_mean_rp = get_region_value(RO,relative_power_band_per_channel(:,2));
    createTopoplotForRegion(LFP_mean_rp,RFP_mean_rp,LF_mean_rp,RF_mean_rp,LT_mean_rp,LP_mean_rp,RP_mean_rp,RT_mean_rp,LO_mean_rp,RO_mean_rp, ...
                            LFP,        RFP,        LF,        RF,        LT,        LP,        RP,        RT,        LO,        RO, ...
                            "theta", chanlocs,8);
 
    %mappa per la banda alpha
    LFP_mean_rp = get_region_value(LFP,relative_power_band_per_channel(:,3));
    RFP_mean_rp = get_region_value(RFP,relative_power_band_per_channel(:,3));
    LF_mean_rp = get_region_value(LF,relative_power_band_per_channel(:,3));
    RF_mean_rp = get_region_value(RF,relative_power_band_per_channel(:,3));
    LT_mean_rp = get_region_value(LT,relative_power_band_per_channel(:,3));
    LP_mean_rp = get_region_value(LP,relative_power_band_per_channel(:,3));
    RP_mean_rp = get_region_value(RP,relative_power_band_per_channel(:,3));
    RT_mean_rp = get_region_value(RT,relative_power_band_per_channel(:,3));
    LO_mean_rp = get_region_value(LO,relative_power_band_per_channel(:,3));
    RO_mean_rp = get_region_value(RO,relative_power_band_per_channel(:,3));
    createTopoplotForRegion(LFP_mean_rp,RFP_mean_rp,LF_mean_rp,RF_mean_rp,LT_mean_rp,LP_mean_rp,RP_mean_rp,RT_mean_rp,LO_mean_rp,RO_mean_rp, ...
                            LFP,        RFP,        LF,        RF,        LT,        LP,        RP,        RT,        LO,        RO, ...
                            "alpha", chanlocs,9);

    %mappa per la banda beta
    LFP_mean_rp = get_region_value(LFP,relative_power_band_per_channel(:,4));
    RFP_mean_rp = get_region_value(RFP,relative_power_band_per_channel(:,4));
    LF_mean_rp = get_region_value(LF,relative_power_band_per_channel(:,4));
    RF_mean_rp = get_region_value(RF,relative_power_band_per_channel(:,4));
    LT_mean_rp = get_region_value(LT,relative_power_band_per_channel(:,4));
    LP_mean_rp = get_region_value(LP,relative_power_band_per_channel(:,4));
    RP_mean_rp = get_region_value(RP,relative_power_band_per_channel(:,4));
    RT_mean_rp = get_region_value(RT,relative_power_band_per_channel(:,4));
    LO_mean_rp = get_region_value(LO,relative_power_band_per_channel(:,4));
    RO_mean_rp = get_region_value(RO,relative_power_band_per_channel(:,4));
    createTopoplotForRegion(LFP_mean_rp,RFP_mean_rp,LF_mean_rp,RF_mean_rp,LT_mean_rp,LP_mean_rp,RP_mean_rp,RT_mean_rp,LO_mean_rp,RO_mean_rp, ...
                            LFP,        RFP,        LF,        RF,        LT,        LP,        RP,        RT,        LO,        RO, ...
                            "beta", chanlocs,10);

    %mappa per la banda low gamma
    LFP_mean_rp = get_region_value(LFP,relative_power_band_per_channel(:,5));
    RFP_mean_rp = get_region_value(RFP,relative_power_band_per_channel(:,5));
    LF_mean_rp = get_region_value(LF,relative_power_band_per_channel(:,5));
    RF_mean_rp = get_region_value(RF,relative_power_band_per_channel(:,5));
    LT_mean_rp = get_region_value(LT,relative_power_band_per_channel(:,5));
    LP_mean_rp = get_region_value(LP,relative_power_band_per_channel(:,5));
    RP_mean_rp = get_region_value(RP,relative_power_band_per_channel(:,5));
    RT_mean_rp = get_region_value(RT,relative_power_band_per_channel(:,5));
    LO_mean_rp = get_region_value(LO,relative_power_band_per_channel(:,5));
    RO_mean_rp = get_region_value(RO,relative_power_band_per_channel(:,5));
    createTopoplotForRegion(LFP_mean_rp,RFP_mean_rp,LF_mean_rp,RF_mean_rp,LT_mean_rp,LP_mean_rp,RP_mean_rp,RT_mean_rp,LO_mean_rp,RO_mean_rp, ...
                            LFP,        RFP,        LF,        RF,        LT,        LP,        RP,        RT,        LO,        RO, ...
                            "low gamma", chanlocs,11);

    
end



%ottengo il valore di relative power medio per una regione e per una banda
%particolare
function region_mean_rp = get_region_value(region, relative_power_band_of_interest) 
    
    % estraggo del vettore relative_power_band_of_interest solo i valori
    % relativi agli elettrodi che definiscono la regione
    rps_of_region = relative_power_band_of_interest(region);

    region_mean_rp = mean(rps_of_region);
    
    fprintf("%s \n",num2str(region_mean_rp));

end

function createTopoplotForRegion(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10, a1,a2,a3,a4,a5,a6,a7,a8,a9,a10, name_of_band, chanlocs, nf) 
    
    value_of_map = zeros(1,128);

    value_of_map(a1) = v1;
    value_of_map(a2) = v2;
    value_of_map(a3) = v3;
    value_of_map(a4) = v4;
    value_of_map(a5) = v5;
    value_of_map(a6) = v6;
    value_of_map(a7) = v7;
    value_of_map(a8) = v8;
    value_of_map(a9) = v9;
    value_of_map(a10) = v10;

    figure(nf)
    topoplotIndie(value_of_map, chanlocs, 'electrodes','labels','numcontour',0);
    title(sprintf("Relative Power of %s band for each region",name_of_band));
    colorbar
   %caxis([0 1])
    colormap jet

end