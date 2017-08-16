/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
if (license_civ_bhc) then {
private["_position","_dixi"];
_dixi = "Land_ToiletBox_F" createVehicle [0,0,0];
_dixi attachTo[player,[0,5.5,0.2]];
_dixi setDir 180;
_dixi setVariable["item","dixiDeployed",true];
life_action_dixiDeploy = player addAction["<t color='#00FF00'>Toilette hinstellen</t>",{if(!isNull life_dixi) then {detach life_dixi; life_dixi = ObjNull;}; player removeAction life_action_dixiDeploy; life_action_dixiDeploy = nil;},"",999,false,false,"",'!isNull life_dixi'];
life_dixi = _dixi;
waitUntil {isNull life_dixi};
if(!isNil "life_action_dixiDeploy") then {player removeAction life_action_dixiDeploy;};
if(isNull _dixi) exitWith {life_dixi = ObjNull;};
_dixi setPos [(getPos _dixi select 0),(getPos _dixi select 1),0];
_dixi enableSimulation false;
};
if (playerSide in [west,independent,east]) then {
private["_position","_dixi"];
_dixi = "Land_ToiletBox_F" createVehicle [0,0,0];
_dixi attachTo[player,[0,5.5,0.2]];
_dixi setDir 180;
_dixi setVariable["item","dixiDeployed",true];
life_action_dixiDeploy = player addAction["<t color='#00FF00'>Toilette hinstellen</t>",{if(!isNull life_dixi) then {detach life_dixi; life_dixi = ObjNull;}; player removeAction life_action_dixiDeploy; life_action_dixiDeploy = nil;},"",999,false,false,"",'!isNull life_dixi'];
life_dixi = _dixi;
waitUntil {isNull life_dixi};
if(!isNil "life_action_dixiDeploy") then {player removeAction life_action_dixiDeploy;};
if(isNull _dixi) exitWith {life_dixi = ObjNull;};
_dixi setPos [(getPos _dixi select 0),(getPos _dixi select 1),0];
_dixi enableSimulation false;
};