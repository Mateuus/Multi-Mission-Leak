/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Returns information on the chosen house
*/
private["_property"];
_property = [_this,0,"",[""]] call BIS_fnc_param;

_garages = ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"];
_smallHouses1 = ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F"];
_smallHouses2 = ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"];
_stoneHouses = ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"];
_largeHouses1 = ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F"];
_largeHouses2 = ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"];
_largeHouses3 = ["Land_i_House_Small_03_V1_F"];

switch (true) do {
	case (_property in _largeHouses1): {[350000,4]};
	case (_property in _largeHouses2): {[400000,5]};
	case (_property in _garages): {[100000,0]};
	case (_property in _smallHouses1): {[310000,3]};
	case (_property in _smallHouses2): {[310000,3]};
	case (_property in _largeHouses3): {[360000,4]};
	case (_property in _stoneHouses): {[220000,2]};
	default {[]};
};