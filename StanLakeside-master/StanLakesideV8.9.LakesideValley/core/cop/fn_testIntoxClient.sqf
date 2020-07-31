/*
	File: fn_testIntoxClient.sqf
	@Deo	
	Description:
	Tests the player.
*/

params [["_cop", ObjNull, [ObjNull]]];

if(isNull _cop) exitWith {};

[player,life_intox] remoteExecCall ["life_fnc_intoxTestReturn",_cop];