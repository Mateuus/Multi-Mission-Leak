/*
	File: fn_roadCone.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: blaster
	
	Description:
	Creates a road cone and preps it.?
*/
private["_position","_cone"];
_cone = "RoadCone_F" createVehicle [0,0,0];
_cone attachTo[player,[0,5.5,0]];
_cone setDir 90;
_cone setVariable["item","coneDeployed",true];

life_action_coneDeploy = player addAction[localize "STR_ISTR_Cone_Place",{if(!isNull life_cone) then {detach life_cone; life_cone = ObjNull;}; player removeAction life_action_coneDeploy; life_action_coneDeploy = nil;},"",999,false,false,"",'!isNull life_cone'];
life_cone = _cone;
waitUntil {isNull life_cone};
if(!isNil "life_action_coneDeploy") then {player removeAction life_action_coneDeploy;};
if(isNull _cone) exitWith {life_cone = ObjNull;};
_cone setPos [(getPos _cone select 0),(getPos _cone select 1),0];

life_action_conePickup = player addAction[localize "STR_ISTR_Cone_Pack",life_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["RoadCone_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];
