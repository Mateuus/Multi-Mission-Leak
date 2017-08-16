/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Plays the siren from the player rather than the vehicle (On the server)
*/

private["_vehicle","_turnOff","_sleep","_siren","_targets"];

_turnOff  = [_this,0,false,[false]] call BIS_fnc_param;
_vehicle = (vehicle player);

if(((typeOf _vehicle) == "B_Heli_Light_01_armed_F")&&(playerside isEqualTo west))exitwith{};

_sleep = 0;
if(player getVariable ["medic",false])then {
	_sleep = 4.55;
	_siren = "medicSiren";
} else {
	_sleep = 4.8;
	_siren = "sirenLong";
};

if(isNull _vehicle) exitWith {};
DS_usedSiren = true;
[_sleep] spawn {
	sleep (_this select 0);
	DS_usedSiren = false;
};
while{true}do {
	if(!(_vehicle getVariable ["siren",false]))exitwith{};
	if(!alive player)exitwith{_vehicle setVariable ["siren",false,true]};
	if(_turnOff)exitwith{_vehicle setVariable ["siren",false,true]};
	if((vehicle player) != _vehicle)exitwith{_vehicle setVariable ["siren",false,true]};
	if(_vehicle isKindOf "Man")exitwith{_vehicle setVariable ["siren",false,true]};

	_targets = allPlayers select {(_x distance player) < 1000};
	[_vehicle,_siren,true] remoteExecCall ["DS_fnc_playSounds",_targets];

	sleep _sleep;
};