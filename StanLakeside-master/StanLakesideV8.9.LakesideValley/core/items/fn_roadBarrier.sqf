private["_position","_roadbarrier"];
_roadBarrier = "plp_upm_WoodBarrierLongPoliceSide" createVehicle [0,0,0];
_roadBarrier setDir 90;
_roadBarrier setVariable["item","barrierDeployed",true];
_roadBarrier attachTo[player,[0,5.5,0]];

life_action_roadBarrierDeploy = player addAction["Place",{if(!isNull life_roadbarrier) then {detach life_roadBarrier; life_roadBarrier = ObjNull;}; player removeAction life_action_roadBarrierDeploy; life_action_roadBarrierDeploy = nil;},"",999,false,false,"",'!isNull life_roadbarrier'];
life_roadbarrier = _roadBarrier;
_handle = [life_roadbarrier,"roadBarrier"] spawn life_fnc_disablecollisionwith; 
waitUntil {scriptDone _handle}; 
[life_roadbarrier,"roadBarrier"] remoteExec ["life_fnc_disablecollisionwith"];
waitUntil {isNull life_roadBarrier};
if(!isNil "life_action_roadBarrierDeploy") then {player removeAction life_action_roadBarrierDeploy;};
if(isNull _roadBarrier) exitWith {life_roadbarrier = ObjNull;};
_roadBarrier setPos [(getPos _roadBarrier select 0),(getPos _roadBarrier select 1),0];
_roadBarrier setDamage 1;
life_action_roadBarrierPickup = player addAction["Pack Up",life_fnc_packupBarrier,"",0,false,false,"",
' _barrier = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_barrier" && !isNil {(_barrier getVariable "item")}'];