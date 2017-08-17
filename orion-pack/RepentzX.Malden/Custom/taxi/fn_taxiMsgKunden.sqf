/*
	Autor: Felix von Studsinske
		Alias: Carter, Rom, Schnuffi \/ Carter | Flix
	Dateiname: fn_taxiMsgKunden.sqf
	Beschreibung:
		Zeigt den Fahrzeuginsassen (außer Fahrer) des Taxis
		den aktuellen Preis an.
		params:
			[_dist,_tMotor,_fahrN,_kGesamt,_multi,_taxiFahrer]
		
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
params [
	["_dist",-1,[0]],
	["_tMotor","",[""]],
	["_fahrN","",[""]],
	["_kGesamt",-1,[0]],
	["_multi",-1,[0]],
	["_zeit","",[""]],
	["_taxiFahrer",objNull,[objNull]]
];
if ((_dist) < 0 || (_tMotor isEqualTo "") || (_fahrN isEqualTo "") || (_kGesamt < 0) || (_multi < 0) || (_zeit isEqualTo "") || (isNull _taxiFahrer)) exitWith {};
private _text = format["<t align='center' underline='true'>Taxi %1:</t><t align='left'><br/><br/><t underline='true'>Current costs:</t> %2<br/><t underline='true'>Multiplier:</t> %3 (Ground, air, water)<br/><t underline='true'>Dangerous kilometers:</t> %4<br/><t underline='true'>Driver name:</t> %5<br/><t underline='true'>Travel time:</t> %6</t>", _fahrN, _kGesamt, _multi, _dist, name(driver(vehicle player)),_zeit];
hint parseText _text;
if (life_houseProtect < _kGesamt && life_fishFinder < _kGesamt) then {
	[format["A passenger (%1) does not have enough money on hand or in his bank",profileName],"PLAIN"] remoteExecCall ["titleText",_taxiFahrer];
	format["A passenger (%1) does not have enough money on hand or in his bank",profileName] remoteExecCall ["hint",_taxiFahrer];
};