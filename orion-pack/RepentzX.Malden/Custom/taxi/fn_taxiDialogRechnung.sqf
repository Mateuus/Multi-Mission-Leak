/*
	Autor: Felix von Studsinske
		Alias: Carter, Rom, Schnuffi \/ Carter | Flix
	Dateiname: fn_taxiDialogRechnung.sqf
	Beschreibung:
		Öffnet das Rechnungsmenü für Taxifahrer.
		params:
			[_dist,profileName,_multi,_fahrN,_fArt,_zeit,_wk_Text,_kGesamt]
		
	Sie dürfen meine Funktionen/Scripte nur mit der "License-FvS.txt" nutzen sowie der Einhaltung der Regeln.
		Im Missionshauptverzeichnis oder in einem leicht zu findenen Ordner muss die "License-FvS.txt" vorhanden sein!
			Beispiel-Pfad: 
				Altis_Life.Altis\License-FvS.txt
				MyExampleMission.Altis\License-FvS.txt
	You are only allowed to use my scripts/functions with my littly "License-FvS.txt" and the agreements to the rules.
		The "License-FvS.txt" has to be in your mission root folder or in an easy to finding folder
			Destination example:
				Altis_Life.Altis\License-FvS.txt
				MyExampleMission.Altis\License-FvS.txt
*/
disableSerialization;
params [
	["_dist",-1,[0]],
	["_fahrN","",[""]],
	["_multi",-1,[0]],
	["_fahrzeugName","",[""]],
	["_befArt","",[""]], // Beförderungsart (Luft, Boden, Wasser)
	["_zeit","",[""]],
	["_wk_Text","",[""]], // Kilometerrechenweg
	["_kGesamt",-1,[0]]
];
if (_dist < 0) exitWith {hint "Error in distance";};
if (_multi < 0) exitWith {hint "Error in the multiplier";};
if (_fahrN isEqualTo "") exitWith {hint "No driver?";};
if (_befArt isEqualTo "") exitWith {hint "No mode of transport?";};
if (_zeit isEqualTo "") exitWith {hint "No time?";};
if (_wk_Text isEqualTo "") exitWith {hint "Not a kilometer?";};
if (_kGesamt isEqualTo "") exitWith {hint "No costs?";};
_debug = getNumber(missionConfigFile >> "CfgTaxi" >> "debug");
_debug = if(_debug == 0) then {false;} else {true;};
createDialog "taxi_rechnung";
_disp = (findDisplay 6500);
_lb = _disp displayCtrl 6501;
_info = _disp displayCtrl 6502;
if _debug then {systemChat "The debug mode is active";};
{
	if !_debug then {
		if ((alive _x) && (isPlayer _x) && !(_x isEqualTo player)) then {
			_si = switch (side _x) do {case west: {"P"}; case civilian: {"Z"}; case independent: {"M"}; case east: {"O"};};
			_r = _lb lbAdd format["%1 - %2",name _x,_si];
			_lb lbSetData [_r,str _x];
			if _debug then {systemChat ((str _x) + " bla");};
		};
	} else {
		if ((alive _x) && (isPlayer _x)) then { // Listet auch den Fahrer auf
			_si = switch (side _x) do {case west: {"P"}; case civilian: {"Z"}; case independent: {"M"}; case east: {"O"};};
			_r = _lb lbAdd format["%1 - %2",name _x,_si];
			_lb lbSetData [_r,str _x];
		};
	};
} forEach (crew (vehicle player));
_info ctrlSetStructuredText parseText format[
	"<t underline='true'>Taximeter finished %4</t><br/><t align='left'><t underline='true'>Username:</t> %2<br/><t underline='true'>Distance (km):</t> %1<br/><t underline='true'>Type of transport:</t> %5<br/><t underline='true'>Needed time (s):</t> %6<br/><t underline='true'>Km-Info:</t> %7<br/><t underline='true'>total cost:</t> %8<br/><t underline='true'>Multiplier:</t> %3<br/></t>",
	_dist toFixed 3,profileName,_multi,_fahrN,_befArt,_zeit,_wk_Text,_kGesamt
];
if (lbSize _lb < 1) exitWith {hint "List empty => Dialog closed"; closeDialog 0;};