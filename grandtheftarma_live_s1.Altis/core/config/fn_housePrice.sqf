/*
	File: fn_housePrice.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Returns the buyable house price.
*/
private["_type"];
_type = [_this,0,"",[""]] call GTA_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "Land_i_House_Small_01_V1_F": {5000000};
	case "Land_i_House_Small_01_V2_F": {5000000};
	case "Land_i_House_Small_01_V3_F": {5000000};
	case "Land_i_House_Small_02_V1_F": {5000000};
	case "Land_i_House_Small_02_V2_F": {5000000};
	case "Land_i_House_Small_02_V3_F": {5000000};
	case "Land_i_House_Small_03_V1_F": {5000000};
	case "Land_i_House_Big_01_V1_F": {10000000};
	case "Land_i_House_Big_01_V2_F": {10000000};
	case "Land_i_House_Big_01_V3_F": {10000000};
	case "Land_i_House_Big_02_V1_F": {7500000};
	case "Land_i_House_Big_02_V2_F": {7500000};
	case "Land_i_House_Big_02_V3_F": {7500000};
	case "Land_i_Addon_02_V1_F": {400000};
	case "Land_i_Addon_03_V1_F": {400000};
	case "Land_i_Addon_03mid_V1": {400000};
	case "Land_i_Addon_04_V1_F": {400000};
	case "Land_i_Garage_V1_F": {3000000};
	case "Land_i_Garage_V2_F": {3000000};
	case "Land_i_Garage_V1_dam_F": {3000000};
	case "Land_i_Stone_Shed_V1_F": {1000000};
	case "Land_i_Stone_Shed_V2_F": {1000000};
	case "Land_i_Stone_Shed_V3_F": {1000000};
	case "Land_Slum_House02_F": {500000};
	default {-1};
};

