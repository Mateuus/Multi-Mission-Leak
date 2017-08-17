#define ERROR(text) titleText[text,"PLAIN"]; hint text;
/*
	Autor: Felix von Studsinske
		Alias: Carter, Rom, Schnuffi \/ Carter | Flix
	Dateiname: fn_taxiInitFahrer.sqf
	Beschreibung:
		Startet die Init/den Geldzähler des Taxis.
		license_civ_taxi ist die Lizenz, die benötigt wird (true/false)
	_units = Fahrgäste im Fahrzeug ohne Spieler/Fahrer
	license_civ_taxi = true; 0 spawn fvs_fnc_taxiInitFahrer;
	taxi_wip: Variable, ob schon das Taximeter läuft
		
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
private ["_Preis_km","_Preis_Zeit","_Preis_Start","_Preis_Multi_Auto","_Preis_Multi_Boot","_Preis_Multi_Luft","_Erlaubte_Fraktionen"];
private ["_Taxi_Grundpreis_Aktua","_startPos","_Erlaubte_Fahrzeuge","_fahrzeug","_aktPos","_multi","_lastDist","_Taximeter_Sleep"];
private ["_motor","_tMotor","_fahrN","_units","_debug","_diff","_fArt","_kosten","_zeit","_Taximeter_Farbe_M_An","_Taximeter_Farbe_M_Aus"];
private ["_Welche_Kilometer","_wk_Text"];
if !canSuspend exitWith {ERROR("suspend # fn_taxiInitFahrer.sqf");}; // scheduled?
if ((vehicle player) == player) exitWith {ERROR("Not in vehicle");}; // In keinem Fahrzeug
if !(player isEqualTo (driver (vehicle player))) exitWith {ERROR("You are not the driver of the vehicle");};
if (isNil "taxi_wip") then {taxi_wip = false;};
if taxi_wip exitWith {ERROR("Das Taximeter läuft bereits.")};
taxi_wip = true;
_fahrzeug = (vehicle player);
_fahrN = getText(configFile >> "CfgVehicles" >> (typeOf _fahrzeug) >> "displayName");
_Preis_km = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_km");
_Preis_Zeit = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Zeit");
_Preis_Start = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Start");
_Preis_Multi_Auto = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Multi_Auto");
_Preis_Multi_Luft = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Multi_Luft");
_Preis_Multi_Boot = getNumber(missionConfigFile >> "CfgTaxi" >> "Preis_Multi_Boot");
_Taxi_Grundpreis_Aktua = getNumber(missionConfigFile >> "CfgTaxi" >> "Taxi_Grundpreis_Aktua");
_Erlaubte_Fraktionen = getArray(missionConfigFile >> "CfgTaxi" >> "Erlaubte_Fraktionen");
_Erlaubte_Fraktionen = {
	if(str playerSide in _x) exitWith {_Erlaubte_Fraktionen select _forEachIndex};
} forEach _Erlaubte_Fraktionen;
if !(call compile format ["%1",_Erlaubte_Fraktionen select 1]) exitWith {taxi_wip = false; ERROR("Unfortunately you do not have the necessary rights to use the taxisystem!");};
_Erlaubte_Fahrzeuge = getArray(missionConfigFile >> "CfgTaxi" >> "Erlaubte_Fahrzeuge");
_Taximeter_Sleep = getNumber(missionConfigFile >> "CfgTaxi" >> "Taximeter_Sleep");
_Welche_Kilometer = getNumber(missionConfigFile >> "CfgTaxi" >> "Welche_Kilometer");
_Taximeter_Farbe_M_An = getText(missionConfigFile >> "CfgTaxi" >> "Taximeter_Farbe_M_An");
_Taximeter_Farbe_M_Aus = getText(missionConfigFile >> "CfgTaxi" >> "Taximeter_Farbe_M_Aus");
_Taximeter_Info_Step = getNumber(missionConfigFile >> "CfgTaxi" >> "Taximeter_Info_Step");
_debug = getNumber(missionConfigFile >> "CfgTaxi" >> "debug");
_debug = if(_debug == 0) then {false;} else {true;};
_Welche_Kilometer = if(_Welche_Kilometer == 0) then {true;} else {false;};
_wk_Text = if _Welche_Kilometer then {"Only rounded / completed kilometers are calculated"} else {"First kilometers are calculated as whole kilometers"};
if !((typeOf _fahrzeug) in _Erlaubte_Fahrzeuge) exitWith {taxi_wip = false; ERROR("This vehicle is not approved for official transport of passengers.");}; // Kein Taxifahrzeug
_multi = switch (true) do {case (_fahrzeug isKindOf "Car"): {_Preis_Multi_Auto}; case (_fahrzeug isKindOf "Air"): {_Preis_Multi_Luft}; case (_fahrzeug isKindOf "Boat"): {_Preis_Multi_Boot}; default {-1};};
if (_multi <= 0) exitWith {taxi_wip = false; ERROR("_multi # fn_taxiInitFahrer.sqf");};
_fArt = switch (true) do {case (_fahrzeug isKindOf "Car"): {"Auto-Beförderung"}; case (_fahrzeug isKindOf "Air"): {"Luft-Beförderung"}; case (_fahrzeug isKindOf "Boat"): {"Wasser-Beförderung"}; default {""};};
if (_fArt isEqualTo "") exitWith {taxi_wip = false; ERROR("_fArt # fn_taxiInitFahrer.sqf");};
_startPos = getPosATL _fahrzeug;
_units = crew _fahrzeug;
_luftlinie = 0;
_units = _units - [player];
_dist = 0;
_info = 0;
_kosten = _Preis_Start;
_timer = time;
_zeit = "";
_kGesamt = 0;
_timeAkt = time + (_Taxi_Grundpreis_Aktua * 60);
if (_units isEqualTo [] && !_debug) exitWith {taxi_wip = false; ERROR("There are no passengers in the vehicle");};
if (!(str(playerSide) in _Erlaubte_Fraktionen) && !_debug) exitWith {taxi_wip = false; ERROR("This faction is not authorized to become a taxi driver'");};
"The taximeter has been set to 0 and started. Delivery information is displayed inbetween!" remoteExecCall ["hint",_units];
while {(alive player) && ((vehicle player) isEqualTo _fahrzeug) && (alive _fahrzeug) && taxi_wip && license_civ_taxi && (player isEqualTo (driver _fahrzeug))} do {
	_motor = isEngineOn _fahrzeug;
	_tMotor = if _motor then {format["<t color='%1'>Motor is switched on</t>",_Taximeter_Farbe_M_An]} else {_info = _Taximeter_Info_Step; format["<t color='%1'>The engine is switched off!</t>",_Taximeter_Farbe_M_Aus]};
	_rechnung = ((((speed _fahrzeug) / 60) / 60) * _Taximeter_Sleep);
	_rechnung = if(_rechnung < 0) then {(_rechnung * -1);} else {_rechnung;}; // Rückwärts fahren?
	_rechnung = parseNumber(_rechnung toFixed 3);
	_luftlinie = round(_startPos distance (getPosATL _fahrzeug));
	_dist = _dist + _rechnung;
	_units = crew _fahrzeug;
	_units = _units - [player];
	_zeit = [(time - _timer),"MM:SS"] call BIS_fnc_secondsToString;
	if(_timeAkt - time < 0) then {
		_kosten = _kosten + _Preis_Zeit;
		_timeAkt = time + (_Taxi_Grundpreis_Aktua * 60);
		systemChat "The price was updated because of the price timer";
	};
	if _debug then {
		systemChat format["Kilometer in %1 s: %2",_Taximeter_Sleep,_rechnung];
		systemChat format["_units: %1",_units];
		systemChat format["_kosten (Without multi + distance): %1",_kosten];
	};
	_kGesamt = if _Welche_Kilometer then {((_kosten + ((floor _dist) * _Preis_km)) * _multi)} else {((_kosten + ((ceil _dist) * _Preis_km)) * _multi)};
	if ((_units isEqualTo []) && !_debug) exitWith {ERROR("There are no passengers in the vehicle");};
	if (_info >= _Taximeter_Info_Step) then {_info = 0; [_dist,_tMotor,_fahrN,_kGesamt,_multi,_zeit,player] remoteExecCall ["fvs_fnc_taxiMsgKunden",_units];};
	hint parseText format["<t align='center'><t underline='true'>Taximeter - %4:</t></t><t align='left'><br/><t underline='true'>Dangerous kilometers:</t> %1<br/><t underline='true'>Air line to the starting point:</t> %2<br/><t underline='true'>Runtime timer:</t> %5<br/><t underline='true'>Current costs: </t>%6 ($/€)<br/><t underline='true'>Type of boarder: </t>%7<br/>%8<br/>%3<br/><br/>- The longer the journey lasts, the less accurate the mileage recording is<br/>- If the vehicle is used during a customer trip, you should be billed, repaired and the taximeter started again</t>",_dist,_luftlinie,_tMotor,_fahrN,_zeit,_kGesamt,_fArt,_wk_Text];
	sleep _Taximeter_Sleep;
	_info = _info + 1;
};
if (_units isEqualTo [] && !_debug) exitWith {taxi_wip = false; ERROR("There are no passengers in the vehicle");};
[_dist,_tMotor,_fahrN,_kGesamt,_multi,_zeit,player] remoteExecCall ["fvs_fnc_taxiMsgKunden",_units];
hint "Taximeter finished.";
hint "Open Invoice dialog";
taxi_rechnung = [_dist,profileName,_multi,_fahrN,_fArt,_zeit,_wk_Text,_kGesamt];
taxi_rechnung call fvs_fnc_taxiDialogRechnung;
taxi_wip = false;