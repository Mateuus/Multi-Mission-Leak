
if((headgear player) in ["H_CrewHelmetHeli_B","H_CrewHelmetHeli_I"])exitwith{};

[[player,"cough"],"DS_fnc_playSounds"] spawn DS_fnc_MP;

player setDamage ((damage player) + 0.2);

hint "You're taking damage because of some toxins in the air nearby";