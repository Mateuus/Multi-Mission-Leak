#include "..\..\macros.hpp"
/*
File: fn_RepaintMenu.sqf
Author: MooN-Gaming

Description: What could it do bro?!

*/
private["_display","_vehicles","_objects","_color","_haha","_pic","_text"];
createDialog "DWEV_vehicle_repaint";
disableSerialization;
if(!isNull (findDisplay 2300)) then {
_display = findDisplay 2300;
_vehicles = _display displayCtrl 2302;

_objects = nearestObjects[getPos (_this select 0),["Car","Air"],10];
_xx = _objects select 0;

//List vehicles
{
			if(vehicle player != _x) then {
			_color = ((M_CONFIG(getArray,"LifeCfgVehicles",(typeOf _xx),"textures") select (_xx getVariable "DWEV_VEH_color")) select 0); // Neue config datei Funktioniert
			_pic = getText(configFile >> "CfgVehicles" >> typeOf _x >> "picture");			
			_text = format["(%1)",_color];
			_haha = typeOf _x;			
			if(_text == "()") then
			{
			_text = "";
			};			
			_vehicles lbAdd format ["%1 || %2", getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName"), _text];		
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];	
			_vehicles lbSetData [(lbSize _vehicles)-1,_haha];
		};		
	} foreach  _objects;
};