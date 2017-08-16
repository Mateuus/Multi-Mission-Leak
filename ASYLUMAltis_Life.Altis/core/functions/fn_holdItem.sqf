/*
	File: fn_holdItem.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Place an object in the player's hand.
*/

private ["_started"];

_item = [_this,0,"",[""]] call BIS_fnc_param;
_dir = [_this,1,[0,0,0],[[]]] call BIS_fnc_param;
_vectorUp = [_this,2,[0,0,0],[[]]] call BIS_fnc_param;
_offset = [_this,3,[0,0,0],[[]]] call BIS_fnc_param;

if (_item == "") exitWith {};
if (vehicle player != player) exitWith {};
if (!isNull life_object_inhand) exitWith {hint "You're already holding an object."};

if (!life_holstered && currentWeapon player != "") then { [nil,nil,nil,true] call life_fnc_holsterWeapon; };

life_object_inhand = _item createVehicle [0,0,0];
life_object_inhand attachTo [player, _offset, "righthand"];
life_object_inhand setVectorDirAndUp [_dir,_vectorUp];

_name = getText(configFile >> "cfgVehicles" >> _item >> "displayName");
titleText[format["You are now holding %1", _name],"PLAIN"];
_action = player addAction [format["Put %1 Away", _name], {deleteVehicle life_object_inhand}, nil, 1, false, true, "", ' !isNull life_object_inhand '];

_action spawn
{
	while { !isNull life_object_inhand } do
	{
		if (vehicle player != player) then { deleteVehicle life_object_inhand };
	};
	player removeAction _this;
};