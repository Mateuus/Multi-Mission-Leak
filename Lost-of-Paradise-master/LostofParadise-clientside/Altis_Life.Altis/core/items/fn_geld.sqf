/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_position","_geld"];
_geld = "Land_Money_F" createVehicle [0,0,0];
_geld attachTo[player,[0,5.5,0.2]];
_geld setDir 90;
_geld setVariable["item","geldDeployed",true];
life_action_geldDeploy = player addAction["<t color='#00FF00'>Falschgeld hinlegen</t>",{if(!isNull life_geld) then {detach life_geld; life_geld = ObjNull;}; player removeAction life_action_geldDeploy; life_action_geldDeploy = nil;},"",999,false,false,"",'!isNull life_geld'];
life_geld = _geld;
waitUntil {isNull life_geld};
if(!isNil "life_action_geldDeploy") then {player removeAction life_action_geldDeploy;};
if(isNull _geld) exitWith {life_geld = ObjNull;};
_geld setPos [(getPos _geld select 0),(getPos _geld select 1),0];
_geld enableSimulation false;