#include "..\..\script_macros.hpp"
/*
	File: fn_loadLoadout.sqf
	Author: Jason_000
*/
disableSerialization;
private["_txt","_handler","_price","_totalCost","_class"];
_txt = lbtext[4002,(lbCurSel 4002)];
if(_txt != '') then {

	//Save current gear
	[player, [profileNamespace, "temp"]] call BIS_fnc_saveInventory;

	[player, [profileNamespace, _txt]] call BIS_fnc_loadInventory;

	_configGuns = M_CONFIG(getArray,"WeaponShops","cop_basic","items");
	_configUniforms = M_CONFIG(getArray,"Clothing","copclothing","uniforms");
	_configVests = M_CONFIG(getArray,"Clothing","copclothing","vests");
	_configBackpacks = M_CONFIG(getArray,"Clothing","copclothing","backpacks");
	_configMisc = M_CONFIG(getArray,"WeaponShops","rpd_equipment","items");

	_uniformNew			    	= uniform player;
	_backpackNew				= backpack player;
	_primaryWeaponNew			= primaryWeapon player;
	_secondaryWeaponNew         = handgunWeapon player;
	_vestNew 					= vest player;
	_uniformItemsNew 			= uniformItems player;
	_vestItemsNew 				= vestItems player;
	_backpackItemsNew 			= backpackItems player;
	_totalCost = 0;

	_newGear 	= [];

	_newGear pushBack _uniformNew;
	if (_uniformNew != "") then {
    _price = 0;
		{
			_class = _x select 0;
			if (_class == _uniformNew) then {
				_price = _x select 2;
			};
		} forEach (_configUniforms);

	_totalCost = _totalCost + _price;
	};


	_newGear pushBack _vestNew;
	if (_vestNew != "") then {
    _price = 0;
		{
			_class = _x select 0;
			if (_class == _vestNew) then {
				_price = _x select 2;
			};
		} forEach (_configVests);

	_totalCost = _totalCost + _price;
	};


	_newGear pushBack _backpackNew;
	if (_backpackNew != "") then {
	_price = 0;
		{
			_class = _x select 0;
			if (_class == _backpackNew) then {
				_price = _x select 2;
			};
		} forEach (_configBackpacks);

	_totalCost = _totalCost + _price;
	};


	_newGear pushBack _primaryWeaponNew;
	if (_primaryWeaponNew != "") then {
    _price = 0;
		{
			_class = _x select 0;
			if (_class == _primaryWeaponNew) then {
				_price = _x select 2;
			};
		} forEach (_configGuns);

	if (_price isEqualTo 0) then {player removeWeaponGlobal _primaryWeaponNew;};
	_totalCost = _totalCost + _price;
	};

	_newGear pushBack _secondaryWeaponNew;
	if (_secondaryWeaponNew != "") then {
    _price = 0;
		{
			_class = _x select 0;
			if (_class == _secondaryWeaponNew) then {
				_price = _x select 2;
			};
		} forEach (_configGuns);

	if (_price isEqualTo 0) then {player removeWeaponGlobal _secondaryWeaponNew;};
	_totalCost = _totalCost + _price;
	};


	{ _newGear pushBack _x; _totalCost = _totalCost + 250;} forEach _uniformItemsNew; //250 per item
	{ _newGear pushBack _x; _totalCost = _totalCost + 250;} forEach _vestItemsNew; //250 per item
	{ _newGear pushBack _x; _totalCost = _totalCost + 250;} forEach _backpackItemsNew; //250 per item


	if(life_houseProtect < _totalCost) exitWith {
		hint parseText format["You didn't have $%1 to buy this loadout. You will get your gear back!", [_totalCost] call life_fnc_numberText];
		[player, [profileNamespace, "temp"]] call BIS_fnc_loadInventory;
	};

	life_houseProtect = life_houseProtect - _totalCost;
	hint parseText format["You've succesfully bought the loadout for $%1", [_totalCost] call life_fnc_numberText];

	[] call life_fnc_saveGear;
	[] call life_fnc_playerSkins;
};
