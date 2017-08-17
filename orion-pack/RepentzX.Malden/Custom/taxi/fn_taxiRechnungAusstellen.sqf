/*
	Autor: Felix von Studsinske
		Alias: Carter, Rom, Schnuffi \/ Carter | Flix
	Dateiname: fn_taxiRechnungAusstellen.sqf
	Beschreibung:
		Stellt die Rechnung dem gewählten Spieler aus
		
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
	["_fahrerName","",[""]],
	["_multi",-1,[0]],
	["_fahrzeugName","",[""]],
	["_befArt","",[""]], // Beförderungsart (Luft, Boden, Wasser)
	["_zeit","",[""]],
	["_wk_Text","",[""]], // Kilometerrechenweg
	["_kGesamt",-1,[0]]
];
if (_dist < 0) exitWith {hint "Error in distance";};
if (_multi < 0) exitWith {hint "Error in the multiplier";};
if (_fahrerName isEqualTo "") exitWith {hint "No driver?";};
if (_befArt isEqualTo "") exitWith {hint "No mode of transport?";};
if (_fahrzeugName isEqualTo "") exitWith {hint "No vehicle?";};
if (_zeit isEqualTo "") exitWith {hint "No time?";};
if (_wk_Text isEqualTo "") exitWith {hint "Not a kilometer?";};
if (_kGesamt isEqualTo "") exitWith {hint "No costs?";};


_disp = (findDisplay 6500);
_lb = _disp displayCtrl 6501;
_sel = lbCurSel _lb;
if (_sel isEqualTo -1) exitWith {hint "You did not choose an invoice recipient!";};
_data = _lb lbData _sel;
_data = call compile format["%1",_data];
if (isNil "_data") exitWith {hint "Error on target";};
if (!alive _data) exitWith {hint "The receiver is dead";};
_text = format[
	"<t underline='true'>Taxi finished %4</t><br/><t align='left'><t underline='true'>Driver name:</t> %2<br/><t underline='true'>Distance (km):</t> %1<br/><t underline='true'>Transport:</t> %5<br/><t underline='true'>Needed time:</t> %6<br/><t underline='true'>Km-Info:</t> %7<br/><t underline='true'>Total cost:</t> %8<br/><t underline='true'>Multiplier:</t> %3<br/></t>",
	_dist,profileName,_multi,_fahrzeugName,_befArt,_zeit,_wk_Text,_kGesamt
];
private _action = [
	format["Of, %1, ask %2 (%4) An invoice:<br/><br/>%3",profileName,name _data,_text,getPlayerUID _data],
	"Taxi Bill invoice",
	"Accept",
	"ABORT"
] call BIS_fnc_guiMessage;
if(!isNil "_action" && {!_action}) exitWith {hint "No invoice issued";};
hint format["Information is being sent to:\n%1 (%2)",name _data,getPlayerUID _data];
[player,taxi_rechnung] remoteExec ["fvs_fnc_taxiRechnungErhalten",_data]; // CfgRemoteExec fvs_fnc_taxiRechnungErhalten => Spieler/Objekte