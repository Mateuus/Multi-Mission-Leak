/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Drops your key or gives it to a selected person
*/

private ["_amount","_dialog","_list","_playerList","_drop","_selection","_vehicle","_owners","_unit","_vehString"];

disableSerialization;

_dialog = findDisplay 666676;
_list = _dialog displayCtrl 1500;
_playerList = _dialog displayCtrl 2100;

_drop = _this select 0;

_selection = lbCurSel _list;
if(_selection isEqualTo -1)exitWith{hint "No vehicle selected"};
_vehicle = _list lbData _selection;
_vehicle = DS_keyRing select (parseNumber (_vehicle));
if((isNil "_vehicle")||(isNull _vehicle))exitWith{};

if(_drop)exitWith {
	_amount = 0;
	_owners = _vehicle getVariable ["vehicle_owners",[]];

	{
		if((!(_x isEqualTo player))&&(player distance _x < 100))then {
			_amount = _amount + 1;
			_newOwner = [(getPlayerUID _x),(name _x),(_x)];

			if(!(_newOwner in _owners))then {
				[_vehicle,player] remoteExecCall ["DS_fnc_receiveKey",_x];
				_owners pushBack _newOwner;
			};
		};
	} forEach (units (group player));

	_vehicle setVariable ["vehicle_owners",_owners,true];
	closeDialog 0;

	if(_amount isEqualTo 0)then {
		hint "You have no nearby gang members to give this key to";
	} else {
		hint format ["You have given out your key to %1 gang member(s)",_amount];
	};
};

_selection = lbCurSel _playerList;
if(_selection isEqualTo -1)exitWith{hint "You have not selected anybody"};

_unit = _playerList lbData _selection;
_unit = missionNamespace getVariable _unit;
if((isNull _unit)||(isNil "_unit"))exitWith{};

if((player distance _unit) > 100)exitWith{};

_owners = _vehicle getVariable ["vehicle_owners",[]];
_newOwner = [(getPlayerUID _unit),(name _unit),(_unit)];
if(_newOwner in _owners)exitWith{hint "This player already has the keys to this vehicle"};
_owners pushBack _newOwner;
_vehicle setVariable ["vehicle_owners",_owners,true];
_vehString = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
hint format ["You have given %1 keys to your %2",_unit getVariable["name",name _unit],_vehString];

[_vehicle,player] remoteExecCall ["DS_fnc_receiveKey",_unit];