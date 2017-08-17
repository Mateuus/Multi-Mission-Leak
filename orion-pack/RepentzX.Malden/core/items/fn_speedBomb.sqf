#include "..\..\script_macros.hpp"

private["_unit"];
_unit = cursorTarget;

if (safezone) exitWith {
	["You cannot attach boms within a safezone!",false,"slow"] call life_fnc_notificationSystem;
};

if((!(_unit isKindOf "LandVehicle"))&&(!(_unit getVariable ["restrained",false]))) exitWith {["You cannot put a bomb on this vehicle",false,"slow"] call life_fnc_notificationSystem;};
if(player distance _unit > 5) exitWith {["You must be within 5 meters to plant this!",false,"slow"] call life_fnc_notificationSystem;};
if(!([false,"speedbomb",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;
life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
uiSleep 1.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};
life_action_inUse = false;
if(player distance _unit > 7) exitWith {titleText["Too far away","PLAIN"];};
[player,"chargeSound"] remoteexeccall ["say3D",0];
titleText["You put the speed bomb on this vehicle","PLAIN"];
[_unit] spawn
{
	_veh = _this select 0;
	waitUntil {(speed _veh) > 70};
	["The bomb you planted has been activated!",false,"slow"] call life_fnc_notificationSystem;
	{ [2,"CAUTION! A bomb has been placed on the vehicle you are driving, if you go below 50km/h THE BOMB EXPLODES!"] remoteExec ["life_fnc_broadcast",_x]; } foreach (crew _veh);
	waitUntil {(speed _veh) < 50};
	//serv_killed = [player,"1090"];
	//publicVariableServer "serv_killed";
	_test = "Bo_Mk82" createVehicle [0,0,9999];
	_test setPos (getPos _veh);
	_test setVelocity [100,0,0];
	["The bomb you planted has exploded!",false,"slow"] call life_fnc_notificationSystem;
};