#include "..\..\script_macros.hpp"
/*
	File: fn_keyMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the key menu
	Will be revised.
*/
private["_display","_vehicles","_plist","_pic","_name","_text","_color","_index","_type"];
disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
_display = findDisplay 2700;
_vehicles = _display displayCtrl 2701;
lbClear _vehicles;
_plist = _display displayCtrl 2702;
lbClear _plist;

for "_i" from 0 to (count life_vehicles)-1 do {
	_veh = life_vehicles select _i;
	if(!isNull _veh && alive _veh) then {
		_color = SEL(SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,(typeOf _veh),"textures"),(_veh GVAR "Life_VEH_color")),0);
		if(isNil "_color") then {_color = ""};
		_text = format["(%1)",_color];
		if(_text == "()") then {
			_text = "";
		};

		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_vehicles lbAdd format["%1 %3 - [Distance: %2m]",_name,round(player distance _veh),_text];
		if(_pic != "pictureStaticObject") then {
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
		};
		_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
	};
};

_plist lbAdd format["%1","Cible"];
_plist lbSetData [(lbSize _plist)-1,"targetkeygive"];

if(((lbSize _vehicles)-1) == -1) then {
	_vehicles lbAdd "Vous ne possédez pas de véhicules";
	_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
};