/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in a players garage
*/

private ["_dialog","_vehicleArray","_list","_btn1","_index","_displayedVehicles","_vehUID","_className","_side","_textureIndex","_boot","_plate","_colourArray","_colour","_img","_name","_tmp"];

disableSerialization;

waitUntil {!isNull (findDisplay 666667)};

_dialog = findDisplay 666667;
_vehicleArray = [];

{
	if((getPlayerUID player) isEqualTo (_x select 0))then {
		_vehicleArray pushBack _x;
	};
} forEach DS_rentals;

_list = _dialog displayCtrl 1501;

lbClear _list;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_btn1 = _dialog displayCtrl 777;
ctrlShow [777,true];

if(_vehicleArray isEqualTo [])exitWith {
	_index = _list lbAdd "You have no vehicles in the impound lot";
	_list lbSetData [_index,""];
};

_btn1 ctrlSetStructuredText parseText "<t size='0.9'>Retrieve Vehicle</t>";
_btn1 buttonSetAction "[] spawn DS_fnc_impoundRetrieve;";
_displayedVehicles = 0;

{
	_vehUID = _x select 0;
	_className = _x select 1;
	_side = _x select 2;
	_textureIndex = _x select 3;
	_boot = _x select 4;
	_plate = _x select 5;
	_index = _forEachIndex;

	if(((playerside isEqualTo civilian)&&(_side isEqualTo 1))||((playerside isEqualTo west)&&(_side isEqualTo 2))||((playerside isEqualTo independent)&&(_side isEqualTo 3)))then {
		_colourArray = [_className,false,playerside] call DS_fnc_vehicleTextures;
		if(_colourArray isEqualTo [])then {
			_colour = "";
		} else {
			if(_textureIndex > 99)then {
				_colour = "Repainted";
			} else {
				_colour = _colourArray select _textureIndex;
			};
		};
		_img = getText (configFile >> "CfgVehicles" >> _className >> "picture");
		_name = getText (configFile >> "CfgVehicles" >> _className >> "displayName");

		_index = _list lbAdd format ["%1  %2",_colour,_name];
		_list lbSetPicture [_index,_img];
		_list lbSetColor [_index,[0,1,0,0.5]];
		_tmp = [_className,_textureIndex];
		_tmp = str(_tmp);
		_list lbSetData [_index,_tmp];
		_list lbSetValue [_index,_index];

		_displayedVehicles = _displayedVehicles + 1;
	};
} forEach _vehicleArray;

if(_displayedVehicles isEqualTo 0)then {
	ctrlShow [777,false];
	_index = _list lbAdd "You have no vehicles in the impound lot";
	_list lbSetData [_index,""];
};