/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Buys a building
*/

private ["_price"];

disableSerialization;

ctrlShow [66654,false];

if(isNil "DS_copLevel")then {DS_copLevel = 0;};

if((playerSide isEqualTo west)&&(DS_copLevel == 0))exitWith{hint "Public cops can not do this"};

switch(DS_className)do {
	case "Land_BagFence_Long_F": {_price = 50};
	case "Land_BarGate_F": {_price = 200};
	case "Land_Crash_barrier_F": {_price = 200};
	case "Land_PortableLight_double_F": {_price = 200};
	case "RoadBarrier_F": {_price = 150};
	case "RoadCone_L_F": {_price = 30};
	case "TapeSign_F": {_price = 75};
	case "CamoNet_BLUFOR_F": {_price = 200};
	case "Land_runway_edgelight_blue_F": {_price = 100};
	case "Land_runway_edgelight": {_price = 100};
	case "Land_Flush_Light_red_F": {_price = 100};
	case "Land_Net_Fence_Gate_F": {_price = 300};
	case "Land_New_WiredFence_10m_F": {_price = 250};
	case "Land_PierLadder_F": {_price = 450};
	case "C_Rubberboat": {_price = 1500};
	case "Land_Sign_WarningMilitaryArea_F": {_price = 200};
	case "Land_HBarrier_Big_F": {_price = 2500};
	default {_price = 100};
};

if([_price,false] call DS_fnc_checkMoney)exitWith{hint "You don't have enough money on you to purchase this"};
[_price,false,false] call DS_fnc_handleMoney;
hint format ["You have bought this item for $%1",[_price] call DS_fnc_numberText];

[DS_className] spawn DS_fnc_placeBuildingBox;