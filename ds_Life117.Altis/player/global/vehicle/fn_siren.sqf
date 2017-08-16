/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Plays the siren from the player rather than the vehicle (On the server)
*/

private["_vehicle","_turnOff","_sleep","_siren"];

_turnOff  = [_this,0,false,[false]] call BIS_fnc_param;
_vehicle = (vehicle player);
_sleep = 0;
if(player getVariable ["medic",false])then
	{
	_sleep = 4.55;
	_siren = "SirenLongCiv";
	}
	else
	{
	_sleep = 4.8;
	_siren = "sirenlong";
	};

if(isNull _vehicle) exitWith {};
DS_usedSiren = true;
[_sleep] spawn
	{
	sleep (_this select 0);
	DS_usedSiren = false;
	};
while{true}do
	{
	if(!(_vehicle getVariable ["siren",false]))exitwith{};
	if(!alive player)exitwith{_vehicle setVariable ["siren",false,true]};
	if(_turnOff)exitwith{_vehicle setVariable ["siren",false,true]};
	if((vehicle player) != _vehicle)exitwith{_vehicle setVariable ["siren",false,true]};
	if(_vehicle isKindOf "Man")exitwith{_vehicle setVariable ["siren",false,true]};
		{
		if(_x distance _vehicle < 1000)then
			{
			[[_vehicle,_siren,true],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
			};
		}forEach playableUnits;
	sleep _sleep;
	};