/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens the vehicle key menu
*/

private ["_dialog","_list","_combo","_btnGive","_btnDrop","_nearPlayers","_vehicle","_name","_pic"];

disableSerialization;

closeDialog 0;
createDialog "keyMenu";

_dialog = findDisplay 666676;
_list = _dialog displayCtrl 1500;
_combo = _dialog displayCtrl 2100;
_btnGive = _dialog displayCtrl 2400;
_btnDrop = _dialog displayCtrl 2401;
_nearPlayers = allPlayers select {(alive _x)&&(player distance _x < 20)};

for "_i" from 0 to (count DS_keyRing)-1 do {
	_vehicle = DS_keyRing select _i;

	if((!isNull _vehicle)&&(alive _vehicle))then {
		_name = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		_pic = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "picture");

		_index = _list lbAdd format ["%1 - [Distance: %2m]",_name,round(player distance _vehicle)];
		_list lbSetData [_index,str(_i)];
		if(!(_pic isEqualTo "pictureStaticObject"))then{_list lbSetPicture [_index,_pic];};
	};
};

{
	if((!isNull _x)&&(alive _x)&&(player distance _x < 20)&&(!(_x isEqualTo player))) then {
		_index = _combo lbAdd format ["%1 - %2",_x getVariable ["name",name _x], side _x];
		_combo lbSetData [_index,(_x call BIS_fnc_objectVar)];
	};
} forEach _nearPlayers;

lbSort [_combo,"ASC"];

if(((lbSize _list)-1) isEqualTo -1)then {
	_index = _list lbAdd "None of your owned vehicles are active";
	_list lbSetData [_index,str(objNull)];
};

_btnGive ctrlSetTooltip "Give a copy of your vehicles key to the selected player";
_btnGive ctrlSetText "Give Key";
_btnGive buttonSetAction "[false] spawn DS_fnc_keyGive;";

_btnDrop ctrlSetTooltip "Give a copy of your vehicles key to all nearby gang members";
_btnDrop ctrlSetText "All nearby";
_btnDrop buttonSetAction "[true] spawn DS_fnc_keyGive;";