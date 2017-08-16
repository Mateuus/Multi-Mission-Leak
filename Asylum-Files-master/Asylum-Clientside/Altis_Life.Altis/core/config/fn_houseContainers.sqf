/*
	File: fn_houseContainers.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Returns the max number of containers by house type.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "Land_i_House_Small_01_V1_F": {2};
	case "Land_i_House_Small_01_V2_F": {2};
	case "Land_i_House_Small_01_V3_F": {2};
	case "Land_i_House_Small_02_V1_F": {2};
	case "Land_i_House_Small_02_V2_F": {2};
	case "Land_i_House_Small_02_V3_F": {2};
	case "Land_i_House_Small_03_V1_F": {2};
	case "Land_i_House_Big_01_V1_F": {3};
	case "Land_i_House_Big_01_V2_F": {3};
	case "Land_i_House_Big_01_V3_F": {3};
	case "Land_i_House_Big_02_V1_F": {3};
	case "Land_i_House_Big_02_V2_F": {3};
	case "Land_i_House_Big_02_V3_F": {3};
	case "Land_i_Addon_02_V1_F": {0};
	case "Land_i_Addon_03_V1_F": {0};
	case "Land_i_Addon_03mid_V1": {0};
	case "Land_i_Addon_04_V1_F": {0};
	case "Land_i_Stone_HouseSmall_V1_F": {3};
	case "Land_i_Stone_HouseSmall_V2_F": {3};
	case "Land_i_Stone_HouseSmall_V3_F": {3};
	case "Land_i_Stone_Shed_V1_F": {0};
	case "Land_i_Stone_Shed_V2_F": {0};
	case "Land_i_Stone_Shed_V3_F": {0};
	case "Land_i_Shed_Ind_F": {2};
	case "Land_House_Small_01_F": {2};
	case "Land_House_Small_02_F": {2};
	case "Land_House_Small_03_F": {2};
	case "Land_House_Small_04_F": {2};
	case "Land_House_Small_05_F": {2};
	case "Land_House_Small_06_F": {2};
	case "Land_House_Big_01_F": {3};
	case "Land_House_Big_02_F": {3};
	case "Land_House_Big_03_F": {3};
	case "Land_House_Big_04_F": {3};
	case "Land_Shed_05_F": {0};
	case "Land_HouseA";
	case "Land_HouseB";
	case "Land_HouseB1";
	case "Land_HouseC_R";
	case "Land_HouseA1_L";
	case "Land_HouseB1_L";
	case "Land_HouseC1_L";
	case "Land_HouseA1": {3};
	case "Land_HouseDoubleAL";
	case "Land_HouseDoubleAL2": {4};
	default {0};
};