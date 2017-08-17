
[player] joinSilent (createGroup civilian);

hint parseText "<t color='#ff0000' size='1.4' shadow='2' align='center'>!!! Roleplay Warning !!!</t><br/><br/>A player has just removed you communication device and GPS, you can now only communicate with the nearby players using direct or vehicle chat!";

waitUntil {!(player getVariable ["restrained", false])};

_grp = life_civGang;
if (_grp isEqualTo grpNull) exitWith {};
[player] joinSilent _grp;