/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoCheck_aenderung.sqf
	Beschreibung:
		Überprüft, ob alle Pflichfelder im Personalausweis befüllt sind und korrekt (Schaltjahr / Februar / 31/30/29/28)
		
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
private ["_display","_spielername","_lb_geschlechtList","_anzeigeAlter","_lb_groesseList","_lb_gewichtList","_lb_blutgruppeList","_lb_bdayTagList","_lb_bdayMonatList",
"_lb_bdayJahrList","_lb_plzStadtList","_eingabeStrasse","_eingabeHausnr","_anzeigeEmail","_anzeigeHandynr","_knopfsenden","_bild","_lb_bildID",
"_profname","_name","_email","_erlZeichen","_okZeichen","_sex","_cm","_kg","_abab0","_bdayJ","_bdayM","_bdayT","_plztown","_str","_hnr","_bild",
"_min","_max","_mehralsXZeichen","_sel"];
if(playerside != civilian) exitWith {}; // Nur Zivilisten dürfen den Personalausweis ändern
disableSerialization;
if(isNull (findDisplay 70000)) exitWith {};
_display = findDisplay 70000;
_spielername = _display displayCtrl 70002;
_plText = ctrlText 70002;
_lb_geschlechtList = _display displayCtrl 70003;
_anzeigeAlter = _display displayCtrl 70005;
_lb_groesseList = _display displayCtrl 70004;
_lb_gewichtList = _display displayCtrl 70006;
_lb_blutgruppeList = _display displayCtrl 70007;
_lb_bdayTagList = _display displayCtrl 70008;
_lb_bdayMonatList = _display displayCtrl 70009;
_lb_bdayJahrList = _display displayCtrl 70010;
_lb_plzStadtList = _display displayCtrl 70013;
_eingabeStrasse = _display displayCtrl  70011;
_eingabeHausnr = _display displayCtrl 70012;
_anzeigeEmail = _display displayCtrl 70014;
_anzeigeHandynr = _display displayCtrl 70015;
_knopfsenden = _display displayCtrl 70016;
_bild = _display displayCtrl 70017;
_lb_bildID = _display displayCtrl 70018;
_erlZeichen = getArray(missionConfigFile >> "Personalausweis" >> "erlaubteZeichen");
_okZeichen = true;
if(fvs_namen_a) then { // Ist die Checkbox aktiv, so wird auch das Eingabefeld freigegeben, sonst nicht und der Profilname wird genutzt sowie die Email zugleich aktualisiert
	_spielername ctrlEnable true;
	_name = "";
	_profname = toArray(ctrlText 70002);
	{
		if(!(_x in _erlZeichen)) then {
			if(_x == " ") then {
				_name = _name + "_";
			} else {
				_name = _name + _x;
			};
		};
	} forEach _profname;
	_email = format["%1%2@citizen.altis",_name,round random 230];
	_anzeigeEmail ctrlSetStructuredText parseText format["%1",_email];
	if (profileName isEqualTo (ctrlText 70002)) then {_okZeichen = false;};
} else {
	_name = "";
	_spielername ctrlEnable false;
	_profname = (profileName) splitString "";
	{
		if(!(_x in _erlZeichen)) then {
			if(_x == " ") then {
				_name = _name + "_";
			} else {
				_name = _name + _x;
			};
		};
	} forEach _profname;
	_email = format["%1%2@citizen.altis",_name,round random 230];
	_anzeigeEmail ctrlSetStructuredText parseText format["%1",_email];
};

_sex = if((lbCurSel 70003) != -1) then {true} else {false};
_cm = if((lbCurSel 70004) != -1) then {true} else {false};
_kg = if((lbCurSel 70006) != -1) then {true} else {false};
_abab0 = if((lbCurSel 70007) != -1) then {true} else {false};
_bdayT = if((lbCurSel 70008) != -1) then {true} else {false};
_bdayM = if((lbCurSel 70009) != -1) then {true} else {false};
_bdayJ = if((lbCurSel 70010) != -1) then {true} else {false};
_plztown = if((lbCurSel 70013) != -1) then {true} else {false};
_str = if((lbCurSel 70011) != -1) then {true} else {false};
_hnr = if((lbCurSel 70012) != -1) then {true} else {false};
_bild = if((lbCurSel 70018) != -1) then {true} else {false};
_min = getNumber(missionConfigFile >> "Personalausweis" >> "zeichen_n_min");
_max = getNumber(missionConfigFile >> "Personalausweis" >> "zeichen_n_max");
_mehralsXZeichen = if(count(_plText splitString "") >= _min && count(_plText splitString "") <= _max) then {true} else {false};
if _okZeichen then {
	{ // Namenszeichenüberprüfung
		if !(_x in _erlZeichen) exitWith {_okZeichen = false;};
	} forEach toArray(_plText);
};
if(_bdayJ) then {
	_sel = call compile format ["%1",lbValue[70010,(lbCurSel 70010)]];
	_date = ((date select 0) - _sel);
	_anzeigeAlter ctrlSetStructuredText parseText format["%1",_date];
	fvs_age = ((date select 0) - _sel);
} else {
	_anzeigeAlter ctrlSetStructuredText parseText "--";
};
if(_sex && _cm && _kg && _abab0 && _bdayT && _bdayM && _bdayJ && _plztown && _str && _hnr && _bild && _mehralsXZeichen && _okZeichen) then {
	_knopfsenden ctrlEnable true;
	_knopfsenden ctrlSetTooltip "Alle Angaben scheinen in Ordnung zu sein";
} else {
	_knopfsenden ctrlEnable false;
	_knopfsenden ctrlSetTooltip format["Manche Angaben scheinen fehlerhaft zu sein.\nSpielername: %3\n    Mindestzeichen: %1\n    Max.-Zeichen: %2",_max,_min,_plText];
};