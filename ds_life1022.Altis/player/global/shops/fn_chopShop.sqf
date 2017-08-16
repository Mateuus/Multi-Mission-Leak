/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the chop shop
*/

private ["_shop","_dialog","_list","_nearVehicles","_className","_img","_name"];

disableSerialization;

if([player,25,civilian] call DS_fnc_nearbyPlayers)exitWith{titleText ["You can not chop this when another player is so nearby","PLAIN"];};
if([player,25,independent] call DS_fnc_nearbyPlayers)exitWith{titleText ["You can not chop this when another player is so nearby","PLAIN"];};
if([player,25,west] call DS_fnc_nearbyPlayers)exitWith{titleText ["You can not chop this when another player is so nearby","PLAIN"];};

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

_nearVehicles = nearestObjects [player,["Car","Truck","Air","Ship"],25];
if(_nearVehicles isEqualTo [])exitWith{titleText ["There are no vehicles nearby","PLAIN"];};

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

lbClear _list;

{
	if(alive _x)then {
		_className = (typeOf _x);
		_img = getText (configFile >> "CfgVehicles" >> _className >> "picture");
		_name = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
		_index = _list lbAdd format ["%1",_name];
		_list lbSetPicture [_index,_img];
		_list lbSetColor [_index,[0,1,0,0.5]];
		_list lbSetData [_index,_className];
	};
} forEach _nearVehicles;