/*
	File: fn_onPut.sqf
	Author: Mario2002
	
	Description:
	gets called when a player put something into a container
*/

private["_item", "_container", "_unit", "_house", "_owner"];

_unit = [_this,0] call GTA_fnc_param;
_container = [_this,1] call GTA_fnc_param;
_item = [_this,2,"",[""]] call GTA_fnc_param;
_house = nearestObject [position player, "House_F"];
_owner = _container getVariable ["owner", ""];

if(_owner == "") exitWith {
	_handle = [] spawn GTA_fnc_updatePlayer;
};

if(typeOf _container in ["B_supplyCrate_F","Land_Box_AmmoOld_F"]) then {
	_wc = getWeaponCargo _container;
	_mc = getMagazineCargo _container;
	_ic = getItemCargo _container;
	_bc = getBackpackCargo _container;

	//hint format ["put %1 %2 %3 %4 %5 %6 %7", _unit, _wc, _mc, _ic, _bc, _item, _owner];	
	//sleep 0.5;
	[[_house, typeOf _container,[_wc, _mc, _ic, _bc]],"BRUUUDIS_fnc_updateHouseWeaponStorage",false,false] call GTA_fnc_remoteExec;
};
_handle = [] spawn GTA_fnc_updatePlayer;