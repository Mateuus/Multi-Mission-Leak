/*File: fn_addKey
Author: Dexter

Description:
Adds keys back to the player after relogging/disconnect
*/
private["_allVeh","_uid","_index","_owners"];
sleep 5;

_allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
_uid = getPlayerUID player;

{
	_owners = _x getVariable ["vehicle_info_owners",[]];
	_index = [_uid,_owners] call TON_fnc_index;

	if(!(_index == -1) && ((_x getVariable ["dbInfo", ["","",civilian]]) select 2== playerSide)) then {
		life_vehicles pushBack _x;
	};
} foreach _allVeh;