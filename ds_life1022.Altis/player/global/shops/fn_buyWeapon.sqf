/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Buys a weapon
*/

private ["_tokenBuy","_className","_price","_type","_config","_fail"];

disableSerialization;

_className = DS_className;
_price = DS_price;
_tokenBuy = _this select 0;
if(isNil "_tokenBuy")then{_tokenBuy = false;};
_fail = false;

DS_doingStuff = false;

if(_price < 0)exitWith{};

if((_price isEqualTo 666)&&(DS_adminLevel isEqualTo 0))then {
	_price = 300000;
};

if(_tokenBuy)then {
	if(_price > (DS_realEstateArray select 6))exitWith{_fail = true;};
	_tempTokens = (DS_realEstateArray select 6);
	_tempTokens = _tempTokens - _price;
	DS_realEstateArray set[6,_tempTokens];
} else {
	if([_price,false] call DS_fnc_checkMoney)exitWith{_fail = true;};
	[_price,false,false] call DS_fnc_handleMoney;
};

if(_fail)exitWith{};

_type =	switch(true)do {
	case (isClass (configFile >> "CfgMagazines" >> _className)): {"CfgMagazines";};
	case (isClass (configFile >> "CfgWeapons" >> _className)): {"CfgWeapons";};
	case (isClass (configFile >> "CfgGlasses" >> _className)): {"CfgGlasses";};
	case (isClass (configFile >> "CfgVehicles" >> _className)): {"CfgVehicles";};
};

/*
if(_type in ["CfgMagazines"])then {
	if(!(player canAdd _className))then {
		_fail = true;
	};
};

if(_fail)exitWith{hint "You don't have enough space for this item";};
*/

_config = switch(_type)do {
	case "CfgMagazines": {configFile >> "CfgMagazines" >> _className;};
	case "CfgWeapons": {configFile >> "CfgWeapons" >> _className;};
	case "CfgGlasses": {configFile >> "CfgGlasses" >> _className;};
	case "CfgVehicles": {configFile >> "CfgVehicles" >> _className;};
};

_type = getText (_config >> "displayName");

if(_tokenBuy)then {
	hint format ["You have bought a %1 for %2 rebel tokens",_type,_price];
} else {
	hint format ["You have bought a %1 for $%2",_type,[_price] call DS_fnc_numberText];
};

[_className,false,false,false,false] call DS_fnc_equipItem;

if((playerSide isEqualTo west)||(player getVariable ["security",false]))then{[] call DS_fnc_copUniform;};