/*
	Author: Bryan "Tonic" Boardwine

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
_unit = _this select 0;
_container = _this select 1;

if(_container isKindOf "LandVehicle" ||_container isKindOf "Air" ||_container isKindOf "Ship") exitWith {
	if(!(_container in life_vehicles) && {locked _container != 0}) exitWith {
		true;
	};
};

if((typeOf _container) isEqualTo "R3F_WeaponBox") exitWith {
	if((_container getVariable ["PlayerOwner",""]) != getPlayerUID player) exitWith {
		true;
	};
};

if(getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack") isEqualTo 1) exitWith {
	true;
};

if(_container isKindOf "Man" && {!alive _container}) exitWith {
	true;
};

if(client_lastShotAt + (1*15) > diag_tickTime && {playerside isEqualTo civilian}) exitWith {
  hintSilent localize "STR_MISC_InventoryCombat";
	true;
};
