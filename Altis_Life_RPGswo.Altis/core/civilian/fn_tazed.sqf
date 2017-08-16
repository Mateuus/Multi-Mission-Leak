#include "..\..\macros.hpp"
/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach","_attach1"];
_unit = param [0,ObjNull,[ObjNull]];
_shooter = param [1,ObjNull,[ObjNull]];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; DWEV_istazed = false;};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!DWEV_istazed) then
	{
		DWEV_istazed = true;
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
		
		[_unit] remoteExec ["DWEV_fnc_tazeSound",-2];
		
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		
		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExec ["DWEV_fnc_animSync",-2];
		
		format["Du hast %1 mit dem Tazer außer Gefecht gesetzt.", getPlayerDName(_unit)] remoteExec ["systemChat",_shooter];

		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 15;

		[player,"amovppnemstpsraswrfldnon"] remoteExec ["DWEV_fnc_animSync",-2];
		if(!(player getVariable["Escorting",false])) then 
		{
			detach player;
		};
		DWEV_istazed = false;
		player allowDamage true;
		disableUserInput false;
		deleteVehicle _obj;
	};
}
	else
{
	_unit allowDamage true;
	DWEV_iztazed = false;
};