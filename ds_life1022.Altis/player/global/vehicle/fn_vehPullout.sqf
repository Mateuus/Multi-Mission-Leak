/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Pulls crew out of vehicle
*/

private ["_vehicle","_crew","_pos","_distance"];

if((playerSide isEqualTo civilian)&&((player inArea "safezone")||(player inArea "safezone_1")))exitwith{hint "You can not do this in this area"};

_vehicle = DS_cursorTarget;
if(speed _vehicle > 7)exitWith{hint "That vehicle is moving too fast"};

_crew = crew _vehicle;
_pos = if(surfaceIsWater (getPos _vehicle))then{getPosASL _vehicle}else{getPosATL _vehicle};
_distance = 10;

closeDialog 0;
hint "Pulling out vehicle crew...";
sleep 4;
if(_vehicle distance _pos > _distance)exitwith{hint "Pullout failed"};
[_vehicle,false] spawn DS_fnc_vehDoors;
sleep 1;
if(cursorTarget != _vehicle)exitwith{hint "Pullout failed"};

{
	[_x,player] remoteExec ["DS_fnc_vehPulloutPlayer",_x];
} forEach _crew;