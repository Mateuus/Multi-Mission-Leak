/*
	Autor: Felix von Studsinske
		Alias: Carter, Rom, Schnuffi \/ Carter | Flix
	Dateiname: fn_taxiRechnungErhalten.sqf
	Beschreibung:
		Kunde erhält Rechnung vom Taxifahrer und kann entscheiden
		
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
	["_taxiFahrer",objNull,[objNull]],
	["_infoText",[],[[]]]
];
if (isNull _taxiFahrer) exitWith {hint "Error in the taxi driver";};
if (count _infoText < 1) exitWith {hint "No information provided";};
_infoText params [
	["_dist",-1,[0]],
	["_fahrerName","",[""]],
	["_multi",-1,[0]],
	["_fahrzeugName","",[""]],
	["_befArt","",[""]], // Beförderungsart (Luft, Boden, Wasser)
	["_zeit","",[""]],
	["_wk_Text","",[""]], // Kilometerrechenweg
	["_kGesamt",-1,[0]]
];

_text = format[
	"<t underline='true'>Taximeter finished %4</t><br/><t align='left'><t underline='true'>Driver name:</t> %2<br/><t underline='true'>Distance (km):</t> %1<br/><t underline='true'>Transport:</t> %5<br/><t underline='true'>Needed time:</t> %6<br/><t underline='true'>Km-Info:</t> %7<br/><t underline='true'>Total cost:</t> %8<br/><t underline='true'>Multiplier:</t> %3<br/></t>",
	_dist,_fahrerName,_multi,_fahrzeugName,_befArt,_zeit,_wk_Text,_kGesamt
];
private _action = [
	format["Recieved from %1 (%2) An invoice has been issued. The following information is available:<br/><br/>%3<br/><br/>Would you like to pay the bill?<br/>PS: If you do not have enough cash or your bank account does not have enough cover, you can not pay the bill",name _taxiFahrer, getPlayerUID _taxiFahrer,_text],
	"Taxi Bill invoice",
	"PAY",
	"REJECT"
] call BIS_fnc_guiMessage;
if(!isNil "_action" && {!_action}) exitWith {
	hint "No invoice issued"; format["%1 (%2) Has rejected the bill",profileName,getPlayerUID player] remoteExecCall ["hint",_taxiFahrer];
};
if (life_houseProtect > _kGesamt) exitWith {
	life_houseProtect = life_houseProtect - _kGesamt;
	[6] call SOCK_fnc_updatePartial;
	hint format["You paid the bill in the amount of $%1 with cash",_kGesamt];
	[_kGesamt,name player,getPlayerUID player,1] remoteExecCall ["fvs_fnc_taxiRechnungBezahlt",_taxiFahrer]; // CfgRemoteExec fvs_fnc_taxiRechnungBezahlt => Spieler/Objekte
};
if (life_fishFinder > _kGesamt) exitWith {// Bezahlen
	hint "You do not have enough cash. Check your bank account.";
	life_fishFinder = life_fishFinder - _kGesamt;
	[6] call SOCK_fnc_updatePartial;
	hint format["You paid the bill in the amount of $%1 with bank card.",_kGesamt];
	[_kGesamt,name player,getPlayerUID player,0] remoteExecCall ["fvs_fnc_taxiRechnungBezahlt",_taxiFahrer];
};
hint "You do not have enough cash or cover in your bank account. Inform the taxi driver";
format["%1 (%2) Can not pay the bill.\nEs not enough in their bank $ %3 or in thier hands $ %4",profileName,getPlayerUID player,_kGesamt - life_fishFinder,_kGesamt - life_houseProtect] remoteExecCall ["hint",_taxiFahrer];