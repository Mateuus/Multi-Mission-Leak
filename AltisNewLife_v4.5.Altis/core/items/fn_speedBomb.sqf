#include <macro.h>
private["_unit"];
_unit = cursorTarget;
if((!(_unit isKindOf "LandVehicle"))&&(!(_unit GVAR ["restrained",false]))) exitWith {hint "Vous ne pouvez pas mettre cette bombe sur ce vehicule."};
if(player distance _unit > 7) exitWith {hint "Vous devez être dans les 7 metres !"};
if(!([false,"speedbomb",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;
life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 1.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Vous etes pas a coté !","PLAIN"];};
titleText["Vous avez mis la bombe de vitesse sur ce véhicule.","PLAIN"];
[_unit] spawn
{
	_veh = _this select 0;
	waitUntil {(speed _veh) > 70};
	[[_veh, "bombarm",20],"life_fnc_playSound",true,false] spawn BIS_fnc_MP;
	hint "La bombe que vous avez mis sur un véhicule vient d'etre activée !";
	{ [[2,"ATTENTION !!! Une bombe a été activée, en dessous de 50km\h LA BOMBE EXPLOSE !"],"life_fnc_broadcast",_x,false] spawn BIS_fnc_MP; } foreach (crew _veh);
	waitUntil {(speed _veh) < 50};
	serv_killed = [player,"1090"];
	publicVariableServer "serv_killed";
	_test = "Bo_Mk82" createVehicle [0,0,9999];
	_test setPos (getPos _veh);
	_test setVelocity [100,0,0];
	hint "La bombe que vous avez mis sur un véhicule a explosée !";
};