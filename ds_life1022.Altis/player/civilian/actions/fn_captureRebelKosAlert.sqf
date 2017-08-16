/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays alerts concerning the rebel KOS point
*/

if(_this select 5)exitwith {
	[0,format["%1 from the %2 gang has taken control of the rebel KOS Zone! (Because they owned it before a server restart)",name player,(group player) getVariable "gangName",true],false,0] remoteExecCall ["DS_fnc_globalMessage",civilian];
};

if(_this select 0)exitwith {
	[0,format["%1 and the %2 gang have taken control of the rebel KOS Zone!",name player,(group player) getVariable "gangName",true],false,0] remoteExecCall ["DS_fnc_globalMessage",civilian];
};

if(_this select 2)exitWith {
	hint "You went too far from the cap point, your capturing has been cancelled";
	systemChat "You went too far from the cap point, your capturing has been cancelled";
};

if(_this select 1)exitWith {
	hint format ["This area will be captured by %1 in %2 minutes",(name (_this select 3)),((_this select 4)/60)];
	systemChat format ["This area will be captured by %1 in %2 minutes",(name (_this select 3)),((_this select 4)/60)];
};