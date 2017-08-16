/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [["_container", "", [""]]];
private ["_type", "_maxLoad"];

//--- Exit if no class given
if (_container == "") exitWith {0};

//--- Manually nerf wetsuits
if (_container in ["U_B_Wetsuit", "U_O_Wetsuit", "U_I_Wetsuit"]) then {
  _container = "Supply40";
};

//--- Type info
_type = [_container] call BIS_fnc_itemType;
_type = _type select 1;

//--- Read vest supply type from config
if (_type in ["Uniform", "Vest"]) then {
  _container = getText (configfile >> "CfgWeapons" >> _container >> "ItemInfo" >> "containerClass");
};

//--- Read maximum load from config
_maxLoad = getNumber (configFile >> "CfgVehicles" >> _container >> "maximumLoad");

//--- Return capacity (divided by 10)
round (_maxLoad / 10)
