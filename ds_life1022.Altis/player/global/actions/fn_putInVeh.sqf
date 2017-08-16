/*
	Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Puts a unit into the nearest vehicle to the player
*/

private["_unit","_nearestVehicle"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if((isNull _unit)||(!isPlayer _unit))exitwith{};

_nearestVehicle = nearestObjects[player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle")exitwith{hint "There is no vehicle nearby"};

//Check the vehicle for any disconnected player's AI
//[_nearestVehicle] call DS_fnc_checkVehForAI;

//Un-escort the unit
detach _unit;
_unit setVariable["escorted",FALSE,TRUE];

//Move the unit into the vehicle
[_nearestVehicle,false] spawn DS_fnc_vehDoors;
[_nearestVehicle] remoteExecCall ["DS_fnc_moveIn",_unit];