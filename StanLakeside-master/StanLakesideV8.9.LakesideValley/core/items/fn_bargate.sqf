
/*
	File: fn_bargate.sqf
	Author: sc
	
	Description:
	Spawns a barqate on the player waiting for placement.
*/
private["_pos","_bargate","_cone1","_cone2","_bargate","_handle"];
_pos = [0,0,0];
_bargate = "Land_BarGate_F" createVehicle _pos;
_cone1 = "RoadCone_F" createVehicle _pos;
_cone2 = "RoadCone_F" createVehicle _pos;
_cone1 setVariable ["bargate",[_cone1,_bargate,_cone2],true];
life_bargate=_cone1;
_handle = [life_bargate,"bargate"] spawn life_fnc_disablecollisionwith; 
waitUntil {scriptDone _handle}; 
[life_bargate,"bargate"] remoteExec ["life_fnc_disablecollisionwith"];
_bargate attachto [player,[0,6.4,4.4]];
_cone1 attachto [player,[0,1.6,.35]];
_cone2 attachto [player,[0,10.5,.35]];
{_x setDir (270);} foreach (_cone1 getvariable "bargate");
closedialog 0;
waitUntil {isNull life_bargate};
if(isNull _cone1) exitWith {life_bargate = ObjNull;};