/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
if (license_civ_bhc) then {
private["_position","_sperre"];
_sperre = "RoadBarrier_F" createVehicle [0,0,0];
_sperre attachTo[player,[0,5.5,0.2]];
_sperre setDir 180;
_sperre setVariable["item","sperreDeployed",true];
life_action_sperreDeploy = player addAction["<t color='#00FF00'>Barriere hinstellen</t>",{if(!isNull life_sperre) then {detach life_sperre; life_sperre = ObjNull;}; player removeAction life_action_sperreDeploy; life_action_sperreDeploy = nil;},"",999,false,false,"",'!isNull life_sperre'];
life_sperre = _sperre;
waitUntil {isNull life_sperre};
if(!isNil "life_action_sperreDeploy") then {player removeAction life_action_sperreDeploy;};
if(isNull _sperre) exitWith {life_sperre = ObjNull;};
_sperre setPos [(getPos _sperre select 0),(getPos _sperre select 1),0];
_sperre enableSimulation false;
};
if (playerSide in [west,independent,east]) then {
private["_position","_sperre"];
_sperre = "RoadBarrier_F" createVehicle [0,0,0];
_sperre attachTo[player,[0,5.5,0.2]];
_sperre setDir 180;
_sperre setVariable["item","sperreDeployed",true];
life_action_sperreDeploy = player addAction["<t color='#00FF00'>Barriere hinstellen</t>",{if(!isNull life_sperre) then {detach life_sperre; life_sperre = ObjNull;}; player removeAction life_action_sperreDeploy; life_action_sperreDeploy = nil;},"",999,false,false,"",'!isNull life_sperre'];
life_sperre = _sperre;
waitUntil {isNull life_sperre};
if(!isNil "life_action_sperreDeploy") then {player removeAction life_action_sperreDeploy;};
if(isNull _sperre) exitWith {life_sperre = ObjNull;};
_sperre setPos [(getPos _sperre select 0),(getPos _sperre select 1),0];
_sperre enableSimulation false;
};