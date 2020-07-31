/*
	File: fn_roadcone.sqf
	Author:@F
	Description:
	Spawns a roadcone on the player waiting for placement.
*/
private["_pos","_cone1"];
_isBlink = param [0,false,[false]];
_className = if(_isBlink) then {"RoadCone_L_F"} else {"RoadCone_F"};
_pos = [0,0,0];
_cone1 = _className createVehicle _pos;
_cone1 setVariable ["roadcone",[_cone1],true];
life_roadcone=_cone1;
_handle = [life_roadcone,"roadcone"] spawn life_fnc_disablecollisionwith; 
waitUntil {scriptDone _handle}; 
[life_roadcone,"roadcone"] remoteExec ["life_fnc_disablecollisionwith"];
_cone1 attachto [player,[0,2,.35]];
{_x setdir 90;} foreach (_cone1 getvariable "roadcone");
closedialog 0;
waitUntil {isNull life_roadcone};
if(isNull _cone1) exitWith {life_roadcone = ObjNull;};