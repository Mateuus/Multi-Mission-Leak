#include <macro.h>

/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
closeDialog 0;
life_use_atm = true;
life_hunger = 5000;
life_thirst = 5000;
1 fadeSound 1;
[false,1205] call life_fnc_spunadruc;
life_carryWeight = call life_fnc_virtualInventoryWeight;
[an_cash,0,1] call life_fnc_sewawruk;
life_respawned = false;
if(life_BrokenLeg) then {[false] call life_fnc_mlehleproexieb;};
player playMove "amovpercmstpsnonwnondnon";
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["timeofdeath",nil,true];
profileNamespace setVariable["swuyecamar",nil];
player setVariable ["tf_voiceVolume", 1, true];
saveProfileNamespace;

life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

switch (playerSide) do
{
	case west:
	{
		call life_fnc_janadawr;
	};
	case civilian:
	{
		call life_fnc_gukuxeku;
	};
	case independent:
	{
		call life_fnc_spedesaw;
	};
};
//breakout "DeathLoop";
call life_fnc_kecedretr;
//deleteVehicle life_corpse;
life_corpse = nil;
