/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
if (license_civ_bhc) then {
private["_position","_lampe"];
_lampe = "Land_PortableLight_double_F" createVehicle [0,0,0];
_lampe attachTo[player,[0,5.5,0.2]];
_lampe setDir 180;
_lampe setVariable["item","lampeDeployed",true];
life_action_lampeDeploy = player addAction["<t color='#00FF00'>Strahler aufstellen</t>",{if(!isNull life_lampe) then {detach life_lampe; life_lampe = ObjNull;}; player removeAction life_action_lampeDeploy; life_action_lampeDeploy = nil;},"",999,false,false,"",'!isNull life_lampe'];
life_lampe = _lampe;
waitUntil {isNull life_lampe};
if(!isNil "life_action_lampeDeploy") then {player removeAction life_action_lampeDeploy;};
if(isNull _lampe) exitWith {life_lampe = ObjNull;};
_lampe setPos [(getPos _lampe select 0),(getPos _lampe select 1),0];
_lampe allowDamage false;
};
if (playerSide in [west,independent,east]) then {
private["_position","_lampe"];
_lampe = "Land_PortableLight_double_F" createVehicle [0,0,0];
_lampe attachTo[player,[0,5.5,0.2]];
_lampe setDir 180;
_lampe setVariable["item","lampeDeployed",true];
life_action_lampeDeploy = player addAction["<t color='#00FF00'>Strahler aufstellen</t>",{if(!isNull life_lampe) then {detach life_lampe; life_lampe = ObjNull;}; player removeAction life_action_lampeDeploy; life_action_lampeDeploy = nil;},"",999,false,false,"",'!isNull life_lampe'];
life_lampe = _lampe;
waitUntil {isNull life_lampe};
if(!isNil "life_action_lampeDeploy") then {player removeAction life_action_lampeDeploy;};
if(isNull _lampe) exitWith {life_lampe = ObjNull;};
_lampe setPos [(getPos _lampe select 0),(getPos _lampe select 1),0];
_lampe allowDamage false;
};