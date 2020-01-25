/*
	File: fn_roadconeWood.sqf
	Author:@F
	Description:
	Spawns a Wooden roadblock on the player waiting for placement.
*/
private["_barrier1","_barrier2","_cone1","_cone2"];
_pos = [0,0,0];
_barrier1 = "RoadBarrier_F" createVehicle _pos;
_barrier2 = "RoadBarrier_F" createVehicle _pos;
_cone1 = "RoadCone_F" createVehicle _pos;
_cone2 = "RoadCone_F" createVehicle _pos;
_cone1 setVariable ["roadblock",[_barrier1,_barrier2,_cone1,_cone2],true];
life_roadblock=_cone1;
_handle = [life_roadblock,"roadblock"] spawn life_fnc_disablecollisionwith; 
waitUntil {scriptDone _handle}; 
[life_roadblock,"roadblock"] remoteExec ["life_fnc_disablecollisionwith"];
_barrier1 attachto [player,[0,4,.6]];
_barrier2 attachto [player,[0,7.5,.6]];
_cone1 attachto [player,[0,2.4,.35]];
_cone2 attachto [player,[0,9.1,.35]];
{_x setdir 90;} foreach (_cone1 getvariable "roadblock");
closedialog 0;
waitUntil {isNull life_roadblock};
if(isNull _cone1) exitWith {life_roadblock = ObjNull;};