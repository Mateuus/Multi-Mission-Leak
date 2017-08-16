#include "..\..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private ["_container","_list"];
_container = param [1,ObjNull,[ObjNull]];
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	if (life_HC_isActive) then {
		[_container] remoteExecCall ["HC_fnc_updateHouseContainers",HC_Life];
	} else {
		[_container] remoteExecCall ["TON_fnc_updateHouseContainers",RSERV];
	};
	[3] call SOCK_fnc_updatePartial;
	player setVariable ["invOpened",nil,true];
};
[3] call SOCK_fnc_updatePartial;
player setVariable ["invOpened",nil,true];