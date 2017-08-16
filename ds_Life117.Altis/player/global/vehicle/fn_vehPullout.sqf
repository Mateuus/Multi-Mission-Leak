/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Pulls crew out of vehicle
*/

private ["_vehicle","_crew","_pos"];

_vehicle = DS_cursorTarget;
_crew = crew _vehicle;
_pos = (position _vehicle);
closeDialog 0;
hint "Pulling out vehicle crew....";
sleep 4;
if(_vehicle distance _pos > 10)exitwith{hint "Pullout failed"};
[_vehicle,false] spawn DS_fnc_vehDoors;
if(_vehicle distance _pos > 10)exitwith{hint "Pullout failed"};
sleep 1;
if(cursorTarget != _vehicle)exitwith{hint "Pullout failed"};
{
	[[_x],"DS_fnc_vehPulloutPlayer",_x,false] spawn DS_fnc_mp;
}forEach _crew;







