/*
	File: fn_storeVehicleGarage.sqf
	Author: Skalicon
	
	Description:
	Handles everything that happens when you store a vehicle in the garage.
*/
private["_nearVehicle","_near","_uid"];
_nearVehicle = objNull;

_unit = cursorTarget;
if (isNull _unit) then { _unit = _this select 0; };

if ((player distance _unit) > 10) exitWith {hint"You are too far away to use this NPC."};
if (vehicle player != player) exitWith {hint"You cannot use this npc while in a vehicle."};
_near = nearestObjects[(getPos (_this select 0)),["Car","Ship","Air"],200];
{
	_uid = _x getVariable["dbInfo",[""]] select 0;
	if (_uid == getPlayerUID player) exitWith {_nearVehicle = _x;};
} foreach _near;

if(isNull _nearVehicle) exitWith{hint "You don't own any nearby vehicles.";};
if(!alive _nearVehicle) exitWith {hint "You cannot store a vehicle which has been destroyed"};

_vehItem = getItemCargo _nearVehicle;
_vehWeapon = getWeaponCargo _nearVehicle;
_vehAmmo = getMagazineCargo _nearVehicle;
_vehBackpack = getBackpackCargo _nearVehicle;
_countWeapons1 = count (_vehWeapon select 0);
_countAmmo1 = count (_vehAmmo select 0);
_exit = false;
{if(_x != "ToolKit") exitWith {_exit = true}} forEach (_vehItem select 0);
if(_countWeapons1 != 0 || _countAmmo1 != 0 || (_nearVehicle getVariable["Trunk",[[],0]]) select 1 > 0) then {_exit = true};

{if(!(["Parachute",_x] call BIS_fnc_inString) && _x != "B_AssaultPack_cbr") exitWith {_exit = true}} forEach (_vehBackpack select 0);

if(_exit) exitWith {
	_nearVehicle spawn {
		_action = ["It appears you have some items in the physical vehicle cargo which will be removed upon storing. Continue anyway?","Cargo Alert","Yes","No"] call BIS_fnc_GUIMessage;
		if(_action) then {
			[[_this,false,player],"ASY_fnc_vehicleStore",false,false] spawn life_fnc_MP;
			hint "The server is trying to store the vehicle please wait....";
			life_garage_store = true;
		};
	};

};

[[_nearVehicle,false,player],"ASY_fnc_vehicleStore",false,false] spawn life_fnc_MP;
hint "The server is trying to store the vehicle please wait....";
life_garage_store = true;