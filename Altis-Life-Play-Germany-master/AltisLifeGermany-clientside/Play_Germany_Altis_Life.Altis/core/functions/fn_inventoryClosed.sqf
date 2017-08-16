#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private "_container";
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","I_supplyCrate_F"]) exitWith {
	_house = _container getVariable ["containerHouse",ObjNull];
	if(isNull _house) exitWith {};
	//DEBUG
	_containers = _house getVariable ["containers",[]];
	_arr = [];
	{
		_className = typeOf _x;
		_weapons = getWeaponCargo _x;
		_magazines = getMagazineCargo _x;
		_items = getItemCargo _x;
		_backpacks = getBackpackCargo _x;

		_arr pushBack [_className,[_weapons,_magazines,_items,_backpacks]];
	} foreach _containers;
	
	////////////
	[[_house,_arr],"TON_fnc_updateHouseContainers",false,false] call life_fnc_MP;
	[] call SOCK_fnc_updateRequest;
};
