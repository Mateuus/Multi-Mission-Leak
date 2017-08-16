/* 

	Author: Don Richter
	
*/
private["_source","_action"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(life_musikan) exitwith{hint "Die Musik läuft bereits..."};

_action = [
	parseText format["Möchtest du die Jukebox für $1.000 einschalten?"],
	"Jukebox",
	"Ja",
	"Nein"
] call BIS_fnc_guiMessage;

if(_action) then {
if(life_cash < 1000) exitWith {hint "Du hast nicht genügend Bargeld dabei!"};
life_cash = life_cash - 1000;
life_musikan = true;
[_source, "pizzaria", 100] call life_fnc_globalsound;
sleep 150;
life_musikan = false; 
};
