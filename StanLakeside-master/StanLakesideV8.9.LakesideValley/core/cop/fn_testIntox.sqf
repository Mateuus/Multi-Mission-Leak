/*
	File: fn_testIntox.sqf
	@Deo	
	Description:
	Starts the testing process.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
["Sprawdzam ilosc alkoholu w oddechu..", false] spawn domsg;
uiSleep 2;
if(player distance _unit > 5 || deadPlayer || !alive _unit) exitWith {["Nie mozesz tego zrobic.", false] spawn domsg;};
[player] remoteExecCall ["life_fnc_testIntoxClient",_unit];
