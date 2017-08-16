/*
	File: fn_bountyArrest.sqf
	Author: stuffz - CheapSuit Inc
	
	Desc:
	Bounty arrest
*/

private["_unit","_id"];

_unit = [_this,0,ObjNull,[ObjNull]] call GTA_fnc_param;

// Error checking
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid

if(isNil "life_arrestspam") then {life_arrestspam = false;};

if(life_arrestspam) exitWith { hint "Stop spamming the button."; };

[] spawn
{
	life_arrestspam = true;
	sleep 10;
	life_arrestspam = false;
};


[[_unit,player,false],"life_fnc_wantedBountyHunter",false,false] call GTA_fnc_remoteExec;