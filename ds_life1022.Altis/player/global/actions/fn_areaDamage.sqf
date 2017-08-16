private ["_targets"];

if((headgear player) in ["H_CrewHelmetHeli_B","H_CrewHelmetHeli_I"])exitwith{};

_targets = allPlayers select {(_x distance player) < 50};
[player,"cough"] remoteExecCall ["DS_fnc_playSounds",_targets];

player setDamage ((damage player) + 0.2);

hint "You're taking damage because of some toxins in the air nearby";