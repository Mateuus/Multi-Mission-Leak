/*
	File: fn_getBounty.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Requests a bounty from the server.
*/
private ["_max"];

if (!license_civ_bounty && !(playerSide == west && (life_coprole in ["warrant","all"]))) exitWith {};
if (time - life_last_bounty < 10) exitWith { hint "You must wait 10 seconds to request another bounty."; };

_max = switch (true) do
{
	case (126 in life_talents || (playerSide == west && (life_coprole in ["warrant","all"]))): { 2000000 };
	case (3 in life_talents): { 100000 };
	case (2 in life_talents): { 50000 };
	default { 25000 };
};

life_last_bounty = time;
_maxBounties = switch (true) do
{
	case (9 in life_talents): { 4 };
	case (playerSide == civilian): { 2 };
	case (playerSide == west && (life_coprole in ["warrant","all"])): { 1 };
	default { 0 };
};

[[player,_max,life_bounty_uid,_maxBounties], "life_fnc_wantedGetBounty", false, false] call life_fnc_MP;