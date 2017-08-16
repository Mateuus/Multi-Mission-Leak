/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for buyable houses?
	
	Edited:
	By CooliMC for Apex
	Restricted are now only used positions
*/
private["_house"];
_house = [_this,0,"",[""]] call BIS_fnc_param;
if(_house == "") exitWith {[]};

/*
	Return Format:
	[price,# of containers allowed]
*/
switch (true) do {
	case (_house in ["Land_House_Small_04_F","Land_House_Small_06_F","Land_House_small_05_F"]): {[5500000,1]}; //Normales 1 Slot Haus
	case (_house in ["Land_House_Big_01_F","Land_House_Small_02_F","Land_Addon_04_F","Land_House_Big_04_F","Land_House_Small_03_F","Land_Slum_01_F"]): {[10000000,2]}; //Mittleres 2 Slot Haus
	case (_house in ["Land_GarageShelter_01_F"]): {[9500000,1]}; //Garage mit Haus mit 1 Container
	case (_house in ["Land_House_Big_02_F"]): {[14500000,2]}; //Garage mit Haus mit 2 Container
	case (_house in ["Land_Slum_03_F"]): {[15000000,3]}; //Slum Gebäude mit 3 Kisten
	case (_house in ["Land_School_01_F"]): {[25000000,5]}; //Schule
	case (_house in ["Land_Hotel_02_F"]): {[52500000,8]}; //Villa/Hotel2
	case (_house in ["Land_House_Big_03_F"]): {[4000000,0]}; //Garage mit Haus ohne Container
	//case (_house in ["Land_PierWooden_03_F","Land_PierWooden_02_hut_F","Land_PierWooden_01_hut_F"]): {[3500000,0]}; //Bootssteg
	case (_house in ["Land_FuelStation_01_workshop_F"]): {[4000000,0]}; //Garage Doppelt
	default {[]};
};