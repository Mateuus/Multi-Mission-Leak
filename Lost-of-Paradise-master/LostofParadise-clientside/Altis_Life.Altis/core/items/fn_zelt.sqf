/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
if (license_civ_bhc) then {
private["_position","_zelt"];
_zelt = "Land_PartyTent_01_F" createVehicle [0,0,0];
_zelt attachTo[player,[0,5.5,0.2]];
_zelt setDir 180;
_zelt setVariable["item","zeltDeployed",true];
life_action_zeltDeploy = player addAction["<t color='#00FF00'>Pavillon aufstellen</t>",{if(!isNull life_zelt) then {detach life_zelt; life_zelt = ObjNull;}; player removeAction life_action_zeltDeploy; life_action_zeltDeploy = nil;},"",999,false,false,"",'!isNull life_zelt'];
life_zelt = _zelt;
waitUntil {isNull life_zelt};
if(!isNil "life_action_zeltDeploy") then {player removeAction life_action_zeltDeploy;};
if(isNull _zelt) exitWith {life_zelt = ObjNull;};
_zelt setPos [(getPos _zelt select 0),(getPos _zelt select 1),0];
_zelt enableSimulation false;
};
if (playerSide in [west,independent,east]) then {
private["_position","_zelt"];
_zelt = "Land_PartyTent_01_F" createVehicle [0,0,0];
_zelt attachTo[player,[0,5.5,0.2]];
_zelt setDir 180;
_zelt setVariable["item","zeltDeployed",true];
life_action_zeltDeploy = player addAction["<t color='#00FF00'>Pavillon aufstellen</t>",{if(!isNull life_zelt) then {detach life_zelt; life_zelt = ObjNull;}; player removeAction life_action_zeltDeploy; life_action_zeltDeploy = nil;},"",999,false,false,"",'!isNull life_zelt'];
life_zelt = _zelt;
waitUntil {isNull life_zelt};
if(!isNil "life_action_zeltDeploy") then {player removeAction life_action_zeltDeploy;};
if(isNull _zelt) exitWith {life_zelt = ObjNull;};
_zelt setPos [(getPos _zelt select 0),(getPos _zelt select 1),0];
_zelt enableSimulation false;
};