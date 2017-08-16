While{true} do {
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 15;
resetCamShake;
20 fadeSound 1;

SmokePlayer = false;


waituntil{
((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 15) 
and 
(getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 0.5)
or 
(((nearestObject [getpos player, "G_40mm_SmokeGreen"]) distance player < 15) and (getpos (nearestObject [getpos player, "G_40mm_SmokeGreen"]) select 2 < 0.5)) 
};


    if (headgear player != "H_CrewHelmetHeli_B") then
    {

		SmokePlayer = true;

        "dynamicBlur" ppEffectEnable true;
        "dynamicBlur" ppEffectAdjust [20];
        "dynamicBlur" ppEffectCommit 2;
        enableCamShake true;
        addCamShake [10, 45, 10];
        player setFatigue 1;
        5 fadeSound 0.1;

    };
    
    sleep 5;
};
