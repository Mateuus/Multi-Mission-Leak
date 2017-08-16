/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns information on the chosen house
*/

private ["_tinyHouses","_smallHouses","_medHouses","_bigHouses","_hugeHouses"];

params [["_house","",[""]]];

_tinyHouses = ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"];
_smallHouses = ["Land_House_Small_02_F","Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"];
_medHouses = ["Land_i_House_Small_03_V1_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"];
_bigHouses = ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F"];
_hugeHouses = [""];

switch(true)do {
	case (_house in _hugeHouses): {[2200000,8]};
	case (_house in _bigHouses): {[1000000,7]};
	case (_house in _medHouses): {[850000,6]};
	case (_house in _smallHouses): {[600000,5]};
	case (_house in _tinyHouses): {[400000,4]};
	default {[]};
};