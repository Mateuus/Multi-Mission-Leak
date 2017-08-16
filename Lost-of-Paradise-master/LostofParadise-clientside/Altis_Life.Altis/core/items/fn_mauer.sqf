/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
if (license_civ_bhc) then {
private["_position","_mauer"];
_mauer = "RoadCone_L_F" createVehicle [0,0,0];
_mauer attachTo[player,[0,5.5,0.2]];
_mauer setDir 90;
_mauer setVariable["item","mauerDeployed",true];
life_action_mauerDeploy = player addAction["<t color='#00FF00'>Pylone aufstellen</t>",{if(!isNull life_mauer) then {detach life_mauer; life_mauer = ObjNull;}; player removeAction life_action_mauerDeploy; life_action_mauerDeploy = nil;},"",999,false,false,"",'!isNull life_mauer'];
life_mauer = _mauer;
waitUntil {isNull life_mauer};
if(!isNil "life_action_mauerDeploy") then {player removeAction life_action_mauerDeploy;};
if(isNull _mauer) exitWith {life_mauer = ObjNull;};
_mauer setPos [(getPos _mauer select 0),(getPos _mauer select 1),0];
_mauer enableSimulation false;
};
if (playerSide in [west,independent,east]) then {
private["_position","_mauer"];
_mauer = "RoadCone_L_F" createVehicle [0,0,0];
_mauer attachTo[player,[0,5.5,0.2]];
_mauer setDir 90;
_mauer setVariable["item","mauerDeployed",true];
life_action_mauerDeploy = player addAction["<t color='#00FF00'>Pylone aufstellen</t>",{if(!isNull life_mauer) then {detach life_mauer; life_mauer = ObjNull;}; player removeAction life_action_mauerDeploy; life_action_mauerDeploy = nil;},"",999,false,false,"",'!isNull life_mauer'];
life_mauer = _mauer;
waitUntil {isNull life_mauer};
if(!isNil "life_action_mauerDeploy") then {player removeAction life_action_mauerDeploy;};
if(isNull _mauer) exitWith {life_mauer = ObjNull;};
_mauer setPos [(getPos _mauer select 0),(getPos _mauer select 1),0];
_mauer enableSimulation false;
};