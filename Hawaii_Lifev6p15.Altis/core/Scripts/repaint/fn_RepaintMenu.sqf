#include "..\..\..\script_macros.hpp"
/*
	File: fn_RepaintMenu.sqf
	Author: MooN-Gaming
	Rewrite by Larry
*/
if (true) exitWith {hint "Momentan ausser Betrieb!"};
private["_display","_vehicles","_objects","_color","_haha","_pic","_name","_text"];
createDialog "life_vehicle_repaint";
disableSerialization;
if(!isNull (findDisplay 2300)) then {
	_display = findDisplay 2300;
	_vehicles = _display displayCtrl 2302;

	_objects = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],8];
	_xx = _objects select 0;

	{
            if(vehicle player != _x) then {
            _color = SEL(SEL(M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,(typeOf _x),"textures"),(_x GVAR "Life_VEH_color")),0);
            _pic = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "picture");
			_name = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
            _text = format["(%1)",_color];
            _haha = typeOf _x;            
            if(_text == "()") then
            {
            _text = "";
            };            
            _vehicles lbAdd format ["%1 || %2",_name,_text];        
            _vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];    
            _vehicles lbSetData [(lbSize _vehicles)-1,_haha];
        };        
    } foreach  _objects;
};