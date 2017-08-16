#include <macro.h>
/*
	File: fn_RepaintMenu.sqf
	Author: PlayGermany
	
	Description: Opens and fills the repaint menu

*/
private["_display","_vehicles","_objects","_color","_pic","_text","_xx"];
createDialog "Life_vehicle_repaint";
disableSerialization;
_kind = _this select 3;
paint_veh = [];
if(!isNull (findDisplay 2300)) then {
	_display = findDisplay 2300;
	_vehicles = _display displayCtrl 2302;
	
	_objects = nearestObjects[getPos (_this select 0),[_kind],20];
	_xx = _objects select 0;
	
	//List vehicles
	{
			if (!(_x in life_vehicles)) exitWith {};
			if (!(_x isKindOf _kind)) exitWith {};
			if(vehicle player != _x) then {
				_className = typeOf _x;
				_colorArray = getArray(missionConfigFile >> "CfgVehicles" >> _className >> "textures");
				_color = (_colorArray select (_x getVariable "Life_VEH_color")) select 0;
				_pic = getText(configFile >> "CfgVehicles" >> _className >> "picture");			
				_text = format["(%1)",_color];
				paint_veh pushBack _x;
				
				if(_text == "()") then
				{
					_text = "";
				};			
				_vehicles lbAdd format ["%1 || %2", getText(configFile >> "cfgVehicles" >> _className >> "DisplayName"), _text];		
				_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];	
				_vehicles lbSetData [(lbSize _vehicles)-1,_className];
			};		
	} foreach  _objects;
};
