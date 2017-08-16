/*

	[player] requested Data

*/

private["_unit"];

_unit = _this select 0;

if(isNil("eM_session_completed") || !eM_session_completed) exitWith {};

[[player, (player getVariable "perms")],"EMonkeys_fnc_permManager_gotData",_unit,false] call EMonkeys_fnc_mp;

