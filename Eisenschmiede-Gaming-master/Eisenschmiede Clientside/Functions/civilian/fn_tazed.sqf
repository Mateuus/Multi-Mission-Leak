#include "..\script_macros.hpp"
/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_curWep","_curMags","_attach"];
params [
	["_unit",objNull,[objNull]],
	["_shooter",objNull,[objNull]]
];

if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; ES_istazed = false;};

if(_shooter isKindOf "Man" && alive player) then {
	if(!ES_istazed) then {
		ES_istazed = true;
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(!(EQUAL(primaryWeapon player,""))) then {primaryWeaponItems player} else {[]};
		
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(!(EQUAL(count _attach,0)) && !(EQUAL(primaryWeapon player,""))) then {
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		
		if(!(EQUAL(count _curMags,0))) then {
			{player addMagazine _x;} foreach _curMags;
		};
		
		[_unit] remoteExec ["ES_fnc_tazeSound",-2];
		_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
		_obj setPosATL ASLTOATL(visiblePositionASL player);
		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExec ["ES_fnc_animSync",-2];
		[0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExec ["ES_fnc_broadcast",-2];
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 15;
		
		[player,"amovppnemstpsraswrfldnon"] remoteExec ["ES_fnc_animSync",-2];
		
		if(!(player getVariable ["Escorting",false])) then {
			detach player;
		};
		ES_istazed = false;
		player allowDamage true;
		disableUserInput false;
	};
} else {
	_unit allowDamage true;
	ES_iztazed = false;
};