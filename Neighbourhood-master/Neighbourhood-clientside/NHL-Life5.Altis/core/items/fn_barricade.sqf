/*
	File: fn_barricade.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de
	
	Description:
	Creates a barricade.
*/
private["_position","_barricade"];
_barricade = "RoadBarrier_small_F" createVehicle [0,0,0];
_barricade attachTo[player,[0,2.5,0.2]];
_barricade setDir 90;
_barricade setVariable["item","barricadeDeployed",true];

life_action_barricadeDeploy = player addAction["Barrikade aufstellen",{if(!isNull life_barricade) then {detach life_barricade; life_barricade = ObjNull;}; player removeAction life_action_barricadeDeploy; life_action_barricadeDeploy = nil;},"",999,false,false,"",'!isNull life_barricade'];
life_barricade = _barricade;
waitUntil {isNull life_barricade};
if(!isNil "life_action_barricadeDeploy") then {player removeAction life_action_barricadeDeploy;};
if(isNull _barricade) exitWith {life_barricade = ObjNull;};
_barricade setPos [(getPos _barricade select 0),(getPos _barricade select 1),0];
_barricade allowDamage false;
//life_action_barricadePickup = player addAction["Barrikade aufheben",life_fnc_packUpBarricade,"",0,false,false,"",
//' _barricade = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0; !isNil "_barricade" && !isNil {(_barricade getVariable "item")}'];
[[_barricade],"TON_fnc_barricade",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.