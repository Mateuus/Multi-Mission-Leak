/*
	File: fn_calVehWeight.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Starting to lose track on shit I wrote a year ago..
*/
private["_vehicle","_weight","_used","_itemWeight"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {};
_used = 0;
_trunk = _vehicle getVariable ["Trunk",[]];
if(count _trunk > 0) then {
  {
    _itemWeight = getNumber(missionConfigFile >> "VirtualItems" >> (_x select 0) >> "weight");
    _used = _used + (_itemWeight * (_x select 1));
  } forEach _trunk;
};
_weight = getNumber(missionconfigfile >> "CfgVehicles" >> (typeOf _vehicle) >> "trunk" >> str(playerSide));
[_weight,_used];
