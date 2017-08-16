While{true} do 
{
    "dynamicBlur" ppEffectEnable true; // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0]; // enables normal vision
    "dynamicBlur" ppEffectCommit 10; // time it takes to normal
    resetCamShake; // resets the shake
    20 fadeSound 1;     //fades the sound back to normal

	/*
    waituntil{
    ((nearestObject [getpos player, "G_40mm_SmokeOrange"]) distance player < 4)
    and
    (getpos (nearestObject [getpos player, "G_40mm_SmokeOrange"]) select 2 < 0.5)
    };
	*/
	
	waituntil
	{
		((nearestObject [getpos player, "G_40mm_SmokeOrange"]) distance player < 7) 
		and 
		((abs(((getposASL player) select 2) - (getposASL (nearestObject [getpos player, "G_40mm_SmokeOrange"]) select 2))) <= 2)
	};

    if (goggles player != "Mask_M50") then
    {
		sleep 0.1;
        "dynamicBlur" ppEffectEnable true; // enables ppeffect
        "dynamicBlur" ppEffectAdjust [20]; // intensity of blur
        "dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
        enableCamShake true;     // enables camera shake
        addCamShake [10, 45, 10];    // sets shakevalues
        //player setFatigue 1; // sets the fatigue to 100%
        5 fadeSound 0.1;     // fades the sound to 10% in 5 seconds

    };
    
    sleep 1;
};