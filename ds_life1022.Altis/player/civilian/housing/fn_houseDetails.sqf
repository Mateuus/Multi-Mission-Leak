/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns information on the chosen house
*/

private ["_tinyHouses","_smallHouses","_medHouses","_bigHouses","_hugeHouses","_infoArray","_storageLevel","_upgradeCost"];

params [["_house",objNull,[objNull]]];

if(isNull _house)exitWith{};
if(!(_house isKindOf "House_F"))exitWith{};

_tinyHouses = ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"];
_smallHouses = ["Land_House_Small_02_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"];
_medHouses = ["Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"];
_bigHouses = ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"];
_hugeHouses = [""];

_infoArray = switch(true)do {
	case ((typeOf _house) in _hugeHouses): {[2200000,8]};
	case ((typeOf _house) in _bigHouses): {[1000000,7]};
	case ((typeOf _house) in _medHouses): {[850000,6]};
	case ((typeOf _house) in _smallHouses): {[600000,5]};
	case ((typeOf _house) in _tinyHouses): {[400000,4]};
	default {[]};
};
if(_infoArray isEqualTo [])exitWith{};

_storageLevel = _house getVariable ["storage",0];
_upgradeCost = (round((_infoArray select 0)/4));
if(_upgradeCost > 999999)then{_upgradeCost = 1000000};

hint format [
"Details about this property\n\n
Storage Level: %1\n
Max Storage Level: %2\n
Sell Price: $%3\n
Storage Upgrade Cost: $%4\n"
,(_storageLevel)
,(_infoArray select 1)
,[(round((_infoArray select 0)/2))] call DS_fnc_numberText
,[_upgradeCost] call DS_fnc_numberText
];