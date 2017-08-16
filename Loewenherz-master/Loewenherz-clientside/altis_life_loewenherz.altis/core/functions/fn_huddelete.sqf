/*
    Author: H4SHK3KS (ofpectag:PoA)
    File: fn_hudDelete.sqf

    Description:
    Deletes the hud

    Parameters:
    None

    Returns:
    Nothing
*/
2 cutFadeOut 0.5;

if(!isNil "hud_lhmHealth") then {
	terminate hud_lhmHealth;
};
if(!isNil "hud_lhmWeight") then {
	terminate hud_lhmWeight;
};
if(!isNil "hud_lhmStamina") then {
	terminate hud_lhmStamina;
};
if(!isNil "hud_lhmRun") then {
	terminate hud_lhmRun;
};
if(!isNil "hud_lhmAlcohol") then {
	terminate hud_lhmAlcohol;
};
if(!isNil "hud_lhmBuffs") then {
	terminate hud_lhmBuffs;
};

hud_lhmHealth = scriptNull;
hud_lhmWeight = scriptNull;
hud_lhmStamina = scriptNull;
hud_lhmRun = scriptNull;
hud_lhmAlcohol = scriptNull;
hud_lhmBuffs = scriptNull;