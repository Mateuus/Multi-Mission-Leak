/*
	Author: DerOnkel & Cifon
	avanix-gaming.de | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Network Actions for Vehicles
*/
if(!hasInterface && isServer) exitWith {};
private ["_vehicle","_player","_mode"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehicle = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_modeBroadcast = [_this,3,1,[0]] call BIS_fnc_param;

switch (_mode) do
{
	case 0:	//Parkout Vehicles
	{
		uisleep 1;
		_player moveInAny _vehicle;
		uisleep 1;
		if(!(_vehicle isKindOf "Air")) then {_vehicle engineOn true};
		uisleep 1.5;
		cutText ["","BLACK IN", 1.5];
		eM_action_inUse = false;
	};
	case 1:	//Buy & Rent
	{
		uisleep 2.5;
		_player moveInAny _vehicle;
		uisleep 1;
		if(!(_vehicle isKindOf "Air")) then {_vehicle engineOn true};
		uisleep 2.5;
		cutText ["","BLACK IN", 2.5];
		_vehInfos = [typeOf _vehicle] call EMonkeys_fnc_fetchVehInfo;
		switch (_modeBroadcast) do
		{
			case 0: {["Händler Information",["Du hast dir erfolgreich",format["ein(e) %1 gekauft",_vehInfos select 3]],"#0090ff"] call EMonkeys_fnc_specialText};
			case 1: {["Händler Information",["Du hast dir erfolgreich",format["ein(e) %1 gemietet",_vehInfos select 3]],"#0090ff"] call EMonkeys_fnc_specialText};
		};
		eM_action_inUse = false;
	};
	case 2: //Parkout Box
	{
		cutText ["","BLACK IN", 1];
		eM_action_inUse = false;
	};
	case 3:	//Spawnpoint Error
	{
		cutText ["","BLACK IN", 2.5];
		["Händler Information",["Es sind momentan","alle Spawnpunkte besetzt"],"#0090ff"] call EMonkeys_fnc_specialText;
		eM_action_inUse = false;
	};
};