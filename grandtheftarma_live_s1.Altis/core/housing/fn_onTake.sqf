/*
	File: fn_onTake.sqf
	Author: Mario2002
	
	Description:
	gets called when a player is taking something out of container
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
// quick'n dirty
if(_owner != getPlayerUID _unit && side _unit != west) exitWith {
	
	private ["_mags", "_weapons", "_items", "_backpack"];
	_weapons = weapons _unit;
	_mags = magazines _unit;
	_items = items _unit;
	_backpack = backpack _unit;
	
	if(_item in _weapons) then {
		_unit removeWeapon _item;
		_container addWeaponCargoGlobal [_item, 1];
	};
	if(_item in _mags) then {
		_unit removeMagazine _item;
		_container addMagazineCargoGlobal [_item, 1];
	};
	if(_item in _items) then {
		_unit unassignItem _item;
		_unit removeItem _item;
		_unit removeItemFromUniform _item;
		_unit removeItemFromVest _item;
		_unit removeItemFromBackpack _item;
		_container addItemCargoGlobal [_item, 1];
	};
	if(_item == _backpack) then {
		removeBackpack _unit;
		_container addBackpackCargoGlobal [_item, 1];
	};
	
	removeAllWeapons player;
	removeAllItems player;
	removeBackpack _unit;
	removeVest _unit;
	
	hint "You are not allowed to take stuff from this ammobox! You have lost all items!";
	disableSerialization;
	_gearDisplay = displayNull;
	waitUntil {
		_gearDisplay = findDisplay 602;
		!isNull _gearDisplay;
	};
	//waitUntil {!(isNull (findDisplay 602))};
	_gearDisplay closeDisplay 0;
	_handle = [] spawn GTA_fnc_updatePlayer;
};

if(typeOf _container in ["B_supplyCrate_F","Land_Box_AmmoOld_F"]) then {
	
	_wc = getWeaponCargo _container;
	_mc = getMagazineCargo _container;
	_ic = getItemCargo _container;
	_bc = getBackpackCargo _container;

	//hint format ["take %1 %2 %3 %4 %5 %6 %7", _unit, _wc, _mc, _ic, _bc, _item, _owner];
	//hint format ["%1", typeOf _item];
	///[false,_item,1] call life_fnc_handleInv;
	
	//sleep 0.5;

	[[_house, typeOf _container, [_wc, _mc, _ic, _bc]],"BRUUUDIS_fnc_updateHouseWeaponStorage",false,false] call GTA_fnc_remoteExec;
};
_handle = [] spawn GTA_fnc_updatePlayer;