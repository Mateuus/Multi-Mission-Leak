/*
Datei : fn_scheinEntzug.sqf
Ersteller : xnetsrac
Link : http://www.global-gamer.com/home/wbb/index.php/Thread/501-Tutorial-Per-Interaktionbutton-Fahrerlizenz-abnehmen-Polizei/
*/

private["_unit"];
_unit = _this select 0;
_mode = _this select 1;

switch(_mode) do {

	case 0: 
	{ 
		[4] call life_fnc_removeLicenses;
		[0,format["%1's Führerschein wurde entzogen!", name player]] remoteExecCall ["life_fnc_broadcast",west];
	};
	case 1: 
	{
		[6] call life_fnc_removeLicenses;
		[0,format["%1's Flugschein wurde entzogen!", name player]] remoteExecCall ["life_fnc_broadcast",west];
	};
}