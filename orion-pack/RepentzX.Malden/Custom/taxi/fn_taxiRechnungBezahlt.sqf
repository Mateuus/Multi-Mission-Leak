/*
	Autor: Felix von Studsinske
		Alias: Carter, Rom, Schnuffi \/ Carter | Flix
	Dateiname: fn_taxiRechnungBezahlt.sqf
	Beschreibung:
		Die Rechnung wurde bezahlt und der Taxifahrer erhält nun unabhängig von der Zahlungsart _kGesamt als Bargeld => Speichern
		params:
			[_kGesamt,name player,getPlayerUID player,1]
		
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
	["_kGesamt",-1,[0]],
	["_kundeName","",[""]],
	["_kundeUID","",[""]],
	["_m",-1,[0]]
];
if (_kGesamt < 1) exitWith {hint "No costs?";};
if (_kundeName isEqualTo "") exitWith {hint "Customers' Name";};
if (_kundeUID isEqualTo "") exitWith {hint "No customer's UID";};
if (_m < 0) exitWith {hint "No payment method?";};
life_houseProtect = life_houseProtect + _kGesamt;
[6] call SOCK_fnc_updatePartial;
hint format["%1 (%2) Has paid the bill in the amount of $% 3 (payment method %4)",_kundeName,_kundeUID,_kGesamt,if(_m == 0) then {"Bankeinzug"} else {"Bar"}];