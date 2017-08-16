/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Returns information on the chosen house
*/
private["_property","_storageLevel","_infoArray"];
_property = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_garages = ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"];
_smallHouses1 = ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"];
_smallHouses2 = ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"];
_stoneHouses = ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"];
_largeHouses1 = ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"];
_largeHouses2 = ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"];
_largeHouses3 = ["Land_i_House_Small_03_V1_F"];

switch (true) do {
	case (typeOf _property in _largeHouses1): {_infoArray = [350000,4]};
	case (typeOf _property in _largeHouses2): {_infoArray = [400000,5]};
	case (typeOf _property in _garages): {_infoArray = [100000,0]};
	case (typeOf _property in _smallHouses1): {_infoArray = [310000,3]};
	case (typeOf _property in _smallHouses2): {_infoArray = [310000,3]};
	case (typeOf _property in _largeHouses3): {_infoArray = [360000,4]};
	case (typeOf _property in _stoneHouses): {_infoArray = [220000,2]};
	default {[]};
};

_storageLevel = _property getVariable ["storage",0];

hint format[
"Details about this property\n\n
Storage Level: %1\n
Max Storage Level: %2\n
Sell Price: $%3\n
Storage Upgrade Cost: $%4\n"
,(_storageLevel)
,(_infoArray select 1)
,[(round((_infoArray select 0)/2))] call DS_fnc_numberText
,[(round((_infoArray select 0)/4))] call DS_fnc_numberText
];










