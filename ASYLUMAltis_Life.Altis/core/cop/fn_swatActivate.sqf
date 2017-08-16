/*
	File: fn_swatActivate.sqf
	Author: John "Paratus" VanderZwet
	
	Description: Reporting in for activate SWAT duty!
*/

private ["_oldPos","_oldGroup"];

if (!life_summonedSWAT) exitWith {};

life_summonedSWAT = false;
life_activeSWAT = true;

_oldPos = getPos player;

[[player],"ASY_fnc_swatRegistered",false,false] spawn BIS_fnc_MP;

cutText ["", "BLACK OUT", 2];
sleep 2;
playSound "GearSWAT";
cutText["Gearing up for SWAT deployment.","BLACK FADED"];
0 cutFadeOut 999999;
player setPos (getMarkerPos "sky_dive");

_oldGroup = group player;

waitUntil { !life_activeSWAT || !isNil "life_roleSWAT" };

_role = switch (life_roleSWAT) do
{
	case 1: { "recon" };
	case 2: { "team leader" };
	default { "an assaulter" };
};

cutText[format["Deploying with SWAT team as %1.", _role],"BLACK FADED"];
0 cutFadeOut 999999;

if (life_activeSWAT) then
{
	if (life_roleSWAT == 2) then
	{
		sleep 1;
		cutText[format["As team leader, select an entry point."],"BLACK FADED"];
		0 cutFadeOut 999999;
		sleep 1;
		[] spawn life_fnc_swatSpawnMenu;
	};
	
	waitUntil { count life_deploySWAT > 0 };
	waitUntil { player distance life_deploySWAT < 50 };
	
	[] call life_fnc_saveGear;
	[life_roleSWAT, surfaceIsWater life_deploySWAT] call life_fnc_swatGear;
	cutText ["", "BLACK IN", 0.75];
	
	while { life_activeSWAT && alive player } do
	{
		if (player distance life_swatPos > 2500) exitWith
		{
			if (life_roleSWAT == 2) then
			{
				[] call life_fnc_swatDeactivate;
			};
		};
	};
};

if (vehicle player != player) then { player action ["Eject", vehicle player]; };
sleep 3;
player setPos _oldPos;
[] spawn life_fnc_loadGear;
life_activeSWAT = false;
life_roleSWAT = nil;
life_inv_ladder = 0;