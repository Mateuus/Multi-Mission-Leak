/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray, ShadowRanger (Luke)

	Description:
	Loads a player's gear after they die and are revived
*/

private ["_deadBody","_dataArray","_bp","_load","_cfg"];

_deadBody = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_dataArray = [_this,1,[],[[]]] call BIS_fnc_param;
if(count _dataArray == 0) exitWith{};

//Load the player's gear
player setUnitLoadout _dataArray;

//Give the player's weapons back
if(!(DS_primaryWepItems isEqualTo []))then
	{
    _primaryWep = DS_primaryWepItems select 0;
    _primaryWepItems = DS_primaryWepItems select 1;
    _primaryWepMags = DS_primaryWepItems select 2;

	_groundWeapons = nearestObjects [_deadBody,["WeaponHolderSimulated"],5];
	_foundWeapon = objNull;
	_exit = false;

	//Check if the weapon hasn't been picked up by someone
	{
		_weaponType = ((getWeaponCargo _x) select 0) select 0;

		if(!isNil "_weaponType")then
			{
			if(_weaponType isEqualTo _primaryWep)exitwith
				{
				_foundWeapon = _x;
				_exit = true;
				};
			};

		if(_exit)exitwith{};
	}forEach _groundWeapons;

	//Give the player's weapon back
	if(!isNull _foundWeapon)then
		{
		//Make sure setUnitLoadout hasn't already given the player their weapon back
		if((primaryWeapon player) == "")then
			{
			if(!(_primaryWepMags isEqualTo []))then
				{
				{player addMagazine _x}forEach _primaryWepMags;
				};

			player addWeapon _primaryWep;

			if(!(_primaryWepItems isEqualTo []))then
				{
				{player addPrimaryWeaponItem _x}forEach _primaryWepItems;
				};
			};

		//Delete the weapon from the ground and then make the player holster their weapon
		deleteVehicle _foundWeapon;
		player action ["SwitchWeapon",player,player,100];
		};

	//Clear the primary weapons cache
	DS_primaryWepItems = [];
	};

if(!(DS_secondaryWepItems isEqualTo []))then
	{
    _secondaryWep = DS_secondaryWepItems select 0;
    _secondaryWepItems = DS_secondaryWepItems select 1;
    _secondaryWepMags = DS_secondaryWepItems select 2;

	_groundWeapons = nearestObjects [_deadBody,["WeaponHolderSimulated"],5];
	_foundWeapon = objNull;
	_exit = false;

	//Check if the weapon hasn't been picked up by someone
	{
		_weaponType = ((getWeaponCargo _x) select 0) select 0;

		if(!isNil "_weaponType")then
			{
			if(_weaponType isEqualTo _secondaryWep)exitwith
				{
				_foundWeapon = _x;
				_exit = true;
				};
			};

		if(_exit)exitwith{};
	}forEach _groundWeapons;

	//Give the player's weapon back
	if(!isNull _foundWeapon)then
		{
		//Make sure setUnitLoadout hasn't already given the player their weapon back
		if((secondaryWeapon player) == "")then
			{
			if(!(_secondaryWepMags isEqualTo []))then
				{
				{player addMagazine _x} forEach _secondaryWepMags;
				};

			player addWeapon _secondaryWep;

			if(!(_secondaryWepItems isEqualTo []))then
				{
				{player addSecondaryWeaponItem _x}forEach _secondaryWepItems;
				};
			};

		//Delete the weapon from the ground and then make the player holster their weapon
		deleteVehicle _foundWeapon;
		player action ["SwitchWeapon",player,player,100];
		};

	//Clear the secondary weapons cache
	DS_secondaryWepItems = [];
	};

//Update the player's backpack weight
[] spawn
{
	private["_bp","_load","_cfg"];
		while{true} do
		{
			waitUntil {backpack player != ""};
			_bp = backpack player;
			_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
			_load = round(_cfg / 8);
			DS_maxWeight = (24 + _load);
			if(!(playerSide isEqualTo civilian)) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
			if(playerSide isEqualTo west)then
				{
				if(DS_copLevel > 8)then{DS_maxWeight = DS_maxWeight + 20};
				};
			waitUntil {backpack player != _bp};
			if(backpack player == "") then
				{
				DS_maxWeight = 24;
				};
		};
};

[] call DS_fnc_copUniform;