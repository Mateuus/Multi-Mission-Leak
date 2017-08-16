/*
	File: fn_barrier.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de
	
	Description:
	Creates a barrier.
*/
private["_position","_barrier"];
_barrier = "TapeSign_F" createVehicle [0,0,0];
_barrier attachTo[player,[0,5.5,0.2]];
_barrier setDir 90;
_barrier setVariable["item","barrierDeployed",true];

life_action_barrierDeploy = player addAction["Barriere aufstellen",{if(!isNull life_barrier) then {detach life_barrier; life_barrier = ObjNull;}; player removeAction life_action_barrierDeploy; life_action_barrierDeploy = nil;},"",999,false,false,"",'!isNull life_barrier'];
life_barrier = _barrier;
waitUntil {isNull life_barrier};
if(!isNil "life_action_barrierDeploy") then {player removeAction life_action_barrierDeploy;};
if(isNull _barrier) exitWith {life_barrier = ObjNull;};
_barrier setPos [(getPos _barrier select 0),(getPos _barrier select 1),0];
_barrier allowDamage false;
//life_action_barrierPickup = player addAction["Barriere aufheben",life_fnc_packUpBarrier,"",0,false,false,"",
//' _barrier = nearestObjects[getPos player,["TapeSign_F"],8] select 0; !isNil "_barrier" && !isNil {(_barrier getVariable "item")}'];
[[_barrier],"TON_fnc_barrier",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.