/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Displays alerts concerning the rebel KOS point
*/

if(_this select 0)exitwith
	{
	[[0,format["%1 and the %2 gang have taken control of the rebel KOS Zone!",name player,(group player) getVariable "gangName",true]],"DS_fnc_globalMessage",civilian,false] spawn BIS_fnc_MP;
	[[1,format["%1 and the %2 gang have taken control of the rebel KOS Zone!",name player,(group player) getVariable "gangName",true]],"DS_fnc_globalMessage",civilian,false] spawn BIS_fnc_MP;
	};

if(_this select 2)exitWith
	{
	hint "You went too far from the cap point, your capturing has been cancelled";
	systemChat "You went too far from the cap point, your capturing has been cancelled";
	};
	
if(_this select 1)exitWith
	{
	hint format ["This area will be captured by %1 in %2 seconds",(name (_this select 3)),(_this select 4)];
	systemChat format ["This area will be captured by %1 in %2 seconds",(name (_this select 3)),(_this select 4)];
	};
	
