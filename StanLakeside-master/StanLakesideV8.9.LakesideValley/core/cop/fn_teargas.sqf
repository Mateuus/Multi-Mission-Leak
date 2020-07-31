While{!isNull _this} do 
{
    "dynamicBlur" ppEffectEnable true; /* enables ppeffect */
    "dynamicBlur" ppEffectAdjust [0]; /* enables normal vision */
    "dynamicBlur" ppEffectCommit 5; /* time it takes to normal */
    resetCamShake; /* resets the shake */
    1 fadeSound 1;     /* fades the sound back to normal */

    waitUntil{(nearestObject [getPos player, "SmokeShellYellow"]) distance player < 12};
    if (!(goggles player IN ["Mask_M40", "Mask_M40_OD", "Mask_M50"]) || side player == civilian || side player == east) then
    {
        "dynamicBlur" ppEffectEnable true; /* enables ppeffect */
        "dynamicBlur" ppEffectAdjust [12]; /* intensity of blur */
        "dynamicBlur" ppEffectCommit 1; /* time till vision is fully blurred */
        enableCamShake true;     /* enables camera shake */
        addCamShake [1, 25, 1];    /* sets shakevalues */
        1 fadeSound 0.1;     /* fades the sound to 10% in 5 seconds */
    }; 
    uisleep 0.5;
};


    "dynamicBlur" ppEffectEnable true; /* enables ppeffect */
    "dynamicBlur" ppEffectAdjust [0]; /* enables normal vision */
    "dynamicBlur" ppEffectCommit 5; /* time it takes to normal */
    resetCamShake; /* resets the shake */
    1 fadeSound 1;     /* fades the sound back to normal */



