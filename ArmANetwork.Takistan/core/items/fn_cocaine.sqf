private["_dmg","_count"];

if(life_drugged_cocaine < 1) then { life_drugged_cocaine = 1; } else {life_drugged_cocaine = life_drugged_cocaine + 1;};

// Overdose
if ( life_drugged_cocaine > 2) then
{
    _dmg = (damage player) + 0.5;
    life_drugged_cocaine = life_drugged_cocaine - 1;

    if (_dmg < 1.0) then
    {
        hint "Your body has been harmed by the Overdose!";
        ["shortWeak"] spawn life_fnc_weaknessEffects;
        player setFatigue 1;
        player setDamage _dmg;
    } else {
        hint "You've died of an Overdose!";
        player setDamage 1;
    };
} else {
    sleep 5;
    ["hardDrugUse"] call life_fnc_weaknessEffects;
    titleText["You've Gained Superpowers for 10 minutes!","PLAIN"];
    player enableFatigue false;
    player setDamage 0;
    player setVariable["drug_cocaine",true,true];

    for [{_x=0},{_x < life_drugged_cocaine_duration * 4 && Alive player},{_x=_x+1}] do
    {
        if(_x % 4 == 0) then
        {
            life_hunger = life_hunger - 5;
            [] spawn life_fnc_hudUpdate;
        };
        sleep 15;
    };

    life_drugged_cocaine = life_drugged_cocaine - 1;

    _count = 0;
    while{life_drugged_cocaine < 1 && Alive player} do
    {
        player enableFatigue true;
        if(life_drugged_cocaine < 0 OR _count > 100) exitWith { life_drugged_cocaine = -1; hint "You are no longer addicted to Cocaine.";};

        if(_count < 1) then {hint "You are tired and are longing for another hit or smoke a Joint to feel better!";};

        if(_count % 10 == 0) then
        {
            player setFatigue 1;
            ["shortWeak"] spawn life_fnc_weaknessEffects;
            player setDamage (damage player) + 0.1;
            [] spawn life_fnc_hudUpdate;
        };

        _count = _count + 1;

        sleep 12;
    };

    if(life_drugged_cocaine < 0 || !Alive player) then { player setVariable["drug_cocaine",false,true]; life_drugged_cocaine = -1; };

};
