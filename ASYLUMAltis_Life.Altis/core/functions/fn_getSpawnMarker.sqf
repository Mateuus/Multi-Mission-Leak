/*
	File: fn_getSpawnMarker.sqf
	Author: Skalicon / John "Paratus" VanderZwet
	
	Description:
	Spawn marker thing but Skali forgot to put the header in it!
*/

private["_npc","_dist"];
_markers = [_this,0,[],[[]]] call BIS_fnc_param;
if (count _markers == 0) then { _markers = life_spawn_markers; };
_npc = player;
life_veh_sp = "";

{
	_pos = if (typeName _x == "STRING") then { markerPos _x } else { getPos _x };
	_dist = (_npc) distance _pos;
	if(_dist <= 160) then{
		if(count(nearestObjects[(_pos),["Car","Ship","Air"],4]) == 0) then {
			if (life_veh_sp == "") then {
				life_veh_sp = _x;
			} else {
				if (_dist < (markerPos life_veh_sp) distance (_npc)) then{
					life_veh_sp = _x;
				};
			};
		};
	};
}foreach _markers;
