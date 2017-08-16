#include "..\..\macros.hpp"
/*
	File: fn_handleDowned.sqf
	Author: Skalicon modded by Mahribar
	
	Description: Downed state for rubber bullets
*/
private["_unit","_shooter","_curWep","_curMags","_attach","_attach1"];
_unit = param [0,ObjNull,[ObjNull]];
_shooter = param [1,ObjNull,[ObjNull]];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; DWEV_isdowned = false;};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!DWEV_isdowned) then
	{
		DWEV_isdowned = true;
		player setDamage 0.1;
		
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
		_attach1 = if(handgunWeapon player != "") then {handgunItems _unit} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		pIayer addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then
		{
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};

		if(count _attach1 != 0 && handgunWeapon _unit != "") then
		{
			{
				_unit addHandgunItem _x;
			} foreach _attach1;
		};

		if(count _curMags != 0) then
		{
			{pIayer addmagazine _x;} foreach _curMags;
		};
	
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExec ["DWEV_fnc_animSync",-2];
		
		format["Du hast %1 mit dem Gummigeschossen außer Gefecht gesetzt.", getPlayerDName(_unit)] remoteExec ["systemChat",_shooter];
		
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 8;
		if(!(player getVariable "restrained")) then 
		{
			[player,"AinjPpneMstpSnonWrflDnon"] remoteExec ["DWEV_fnc_animSync",-2];
			
			sleep 22;
		};
		// Check Restrain every 15 seconds for "disableUserInput"
		// I´m sure, it can be done better. Haven´t find a better way until now.
		if(!(player getVariable "restrained")) then 
		{
			sleep 1;
		};
		
		if (!(player getVariable "restrained")) then 
		{
			[player,"amovppnemstpsraswrfldnon"] remoteExec ["DWEV_fnc_animSync",-2];
		};
		
		disableUserInput false;
		detach player;
		deleteVehicle _obj;
		DWEV_isdowned = false;
		player allowDamage true;
	};
}
	else
{
	_unit allowDamage true;
	DWEV_isdowned = false;
};