/*
	File: fn_roadconeConc.sqf
	Author:@F
	Description:
	Spawns a Fortified roadblock on the player waiting for placement.
*/
private["_barrier1","_barrier2","_barrier3","_barrier4","_cone1","_cone2","_light1","_light2","_light3","_light4"];
_pos = [0,0,0];
_barrier1 = "Land_CncBarrier_F" createVehicle _pos;
_barrier2 = "Land_CncBarrier_F" createVehicle _pos;
_barrier3 = "Land_CncBarrier_F" createVehicle _pos;
_barrier4 = "Land_CncBarrier_F" createVehicle _pos;
_cone1 = "RoadCone_L_F" createVehicle _pos;
_cone2 = "RoadCone_L_F" createVehicle _pos;
_light1 = "Land_FLush_Light_yellow_F" createVehicle _pos;
_light2 = "Land_FLush_Light_yellow_F" createVehicle _pos;
_light3 = "Land_FLush_Light_yellow_F" createVehicle _pos;
_light4 = "Land_FLush_Light_yellow_F" createVehicle _pos;
_lamp1 = "Land_Portablelight_Single_F" createVehicle _pos;
_lamp2 = "Land_Portablelight_Single_F" createVehicle _pos;
_cone2 setVariable ["roadblock",[_barrier1,_barrier2,_barrier3,_barrier4,_cone1,_cone2,_light1,_light2,_light3,_light4,_lamp1,_lamp2],true];
life_roadblock=_cone2;
_handle = [life_roadblock,"roadblock"] spawn life_fnc_disablecollisionwith; 
waitUntil {scriptDone _handle}; 
[life_roadblock,"roadblock"] remoteExec ["life_fnc_disablecollisionwith"];
_light1 attachto [player,[.1,4,1.12]];
_light2 attachto [player,[.1,7.5,1.12]];
_light3 attachto [player,[-.12,4,1.12]];
_light4 attachto [player,[-.12,7.5,1.12]];
_barrier1 attachto [player,[0,4,.3]];
_barrier2 attachto [player,[0,7.5,.3]];
_barrier3 attachto [player,[0,4,1]];
_barrier4 attachto [player,[0,7.5,1]];
_cone1 attachto [player,[0,9.1,.35]];
_cone2 attachto [player,[0,2.4,.35]];
_lamp1 attachto [player,[1.5,1,1.12]];  
_lamp2 attachto [player,[-1.5,9.5,1.12]];   
{_x setdir 90;} foreach (life_roadblock getvariable "roadblock");
_lamp1 setDir (150);  
_lamp2 setDir (-30);
_light1 setVectorDirAndUp [[0,-90,0],[1,1,0]];  _light2 setVectorDirAndUp [[0,-90,0],[1,1,0]];
_light3 setVectorDirAndUp [[0,90,0],[-1,1,0]];  _light4 setVectorDirAndUp [[0,90,0],[-1,1,0]];
closedialog 0;
waitUntil {isNull life_roadblock};
if(isNull life_roadblock) exitWith {life_roadblock = ObjNull;};