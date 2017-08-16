/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Puts selected player into your vehicle
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if((isNull _unit)||(!isPlayer _unit)) exitWith {};

_nearestVehicle = nearestObjects[getPos player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle") exitWith {hint "There is no vehicle near by"};
[_nearestVehicle,false] spawn DS_fnc_vehDoors;
detach _unit;
[[_nearestVehicle],"DS_fnc_moveIn",_unit,false] call BIS_fnc_MP;
_unit setVariable["Escorted",FALSE,TRUE];
_unit setVariable["cuffedVeh",TRUE,TRUE];