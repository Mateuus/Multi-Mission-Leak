/*
	File: fn_roadconeRebel.sqf
	Author:@F
	Description:
	Spawns a Rebel roadblock on the player waiting for placement.
*/
private["_truck","_truck2","_truck3","_junk1","_junk2"];
_pos = [0,0,0];
_truck = "Land_Wreck_Truck_dropside_F" createVehicle _pos;
_truck2 = "Land_MetalBarrel_empty_F" createVehicle _pos;
_truck3 = "Land_MetalBarrel_empty_F" createVehicle _pos;
_junk1 = "Land_GarbageBags_F" createVehicle _pos;
_junk2 = "Land_Tyres_F" createVehicle _pos;
_truck2 setVariable ["roadblock",[_truck,_truck2,_truck3,_junk1,_junk2],true];
life_roadblock=_truck2;
_handle = [life_roadblock,"roadblock"] spawn life_fnc_disablecollisionwith; 
waitUntil {scriptDone _handle}; 
[life_roadblock,"roadblock"] remoteExec ["life_fnc_disablecollisionwith"];
_truck attachto [player,[0,6,1.2]];
_truck2 attachto [player,[0,2.5,.40]];  
_truck3 attachto [player,[0,9.5,.40]];
_junk1 attachto [player,[1.8,2.5,.30]];  
_junk2 attachto [player,[1.8,9.8,.30]];
{_x setdir -90;} foreach (_truck getvariable "roadblock");
_truck setdir 0;
_junk1 setdir 0;
closedialog 0;
waitUntil {isNull life_roadblock};
if(isNull _truck2) exitWith {life_roadblock = ObjNull;};