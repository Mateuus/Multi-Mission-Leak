/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Drops your key or gives it to a selected person
*/

private["_dialog","_list","_plist","_sel","_vehicle","_owners","_drop","_unit","_uid","_vehString"];
disableSerialization;

_dialog = findDisplay 666676;
_list = _dialog displayCtrl 1500;
_plist = _dialog displayCtrl 2100;

_drop = _this select 0;

_sel = lbCurSel _list;
if(_sel == -1)exitwith{hint "No vehicle selected"};
_vehicle = _list lbData _sel;
_vehicle = DS_keyRing select parseNumber(_vehicle);
_newOwner = [];
if(isNil "_vehicle")exitwith{};
if(isNull _vehicle)exitwith{};
if(_drop)exitwith
	{
	//Keeps the player on the owners list (May fix one day)
	DS_keyRing = DS_keyRing - [_vehicle];
	closeDialog 0;
	hint "You have dropped this key";
	};
_sel = lbCurSel _plist;
if(_sel == -1)exitwith{hint "No body selected"};
_unit = _plist lbData _sel;
_unit = call compile format["%1", _unit];
if(isNull _unit OR isNil "_unit") exitWith {}; 

_uid = getPlayerUID _unit;
_owners = _vehicle getVariable "vehicle_owners";
_newOwner pushBack (getPlayerUID _unit);
_newOwner pushBack (name _unit);
_newOwner pushBack (_unit);
_owners pushBack _newOwner;
_vehicle setVariable ["vehicle_owners",_owners,true];
_vehString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
hint format["You have given %1 keys to your %2",_unit getVariable["name",name _unit],_vehString];

//FINISH THIS< Havn't tested menu etc yet
[[_vehicle,player],"DS_fnc_receiveKey",_unit,false] spawn BIS_fnc_MP;
