#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_target","_Fuel","_vehicle"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_target == player) exitWith {hint "Du kannst dich nicht zu dir selbst teleportieren";};
_vehicle = (vehicle _target);

if(_vehicle == _target) then
{
	_target setPos (getPos player);
	hint format["Du hast %1 zu dir teleportiert",_target getVariable["realname",name _target]];
	[player, _target, 3, "[ADMIN-Menu]", "Hat zu sich teleportiert"] remoteExec ["TEX_FNC_LOGIT", 2];
} else {
	_vehicle enableSimulation false;
	_vehicle allowDamage false;
	player allowDamage false;
	
	_Fuel = fuel _vehicle;
	_vehicle setFuel 0;
	_vehicle setPos (getPos player);
	
	_vehicle enableSimulation true;
	_vehicle allowDamage true;
	_vehicle setFuel _Fuel;
	
	[player] spawn {sleep 10; player allowDamage true;};
	
	hint format["Du hast %1's Fahrzeug zu dir teleportiert",_target getVariable["realname",name _target]];
	[player, _target, 3, "[ADMIN-Menu]", "Hat Fahrzeug zu sich teleportiert"] remoteExec ["TEX_FNC_LOGIT", 2];
};