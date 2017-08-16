#include "..\..\..\script_macros.hpp"
/*
    File: scanVehicles.sqf
    Author: © 2014 nano2K - written for we-are-friendly.de
*/
private["_display","_vehicles","_objects"];
disableSerialization;
if(!isNull (findDisplay 3494)) then {
    _display = findDisplay 3494;
    _vehicles = _display displayCtrl 2902;
    lbClear _vehicles;
    nn_last_vehicles = [];
    _objects = nearestObjects [player, ["Air","Car","Ship"], 150];
    {
        if(vehicle player != _x) then {			
			_color = SEL(SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,(typeOf _x),"textures"),(_x GVAR "Life_VEH_color")),0);
			if(isNil "_color") then {_color = ""};
			_text = format["(%1)",_color];
			if(_text isEqualTo "()") then {
				_text = "";
			};
			
			_name = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
			_pic = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "picture");
			_vehicles lbAdd format["%1 %3 - [Distance: %2m]",_name,round(player distance _x),_text];
			if(_pic != "pictureStaticObject") then {
				_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
			};
			_vehicles lbSetData [(lbSize _vehicles)-1,str(_x)];
			
            nn_last_vehicles set [count nn_last_vehicles, _x];
        };
    } foreach _objects;
};