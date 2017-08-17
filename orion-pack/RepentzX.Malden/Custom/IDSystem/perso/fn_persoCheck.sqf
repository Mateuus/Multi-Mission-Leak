/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoCheck.sqf
	Beschreibung:
		Überprüft, ob alle Pflichfelder im Personalausweis befüllt sind und korrekt (Schaltjahr / Februar / 31/30)
		
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
"_profname","_zeichen","_name","_email","_erlZeichen","_okZeichen","_sex","_cm","_kg","_abab0","_bdayJ","_bdayM","_bdayT","_plztown","_str","_hnr","_bild","_sel"];
disableSerialization;
if(isNull (findDisplay 60000)) exitWith {};
0 cutFadeOut 9999999;
if(isNull (findDisplay 60000)) exitWith {hint "Fehler"; endMission "dialogperso";};
_display = findDisplay 60000;
_spielername = _display displayCtrl 60001;
_lb_geschlechtList = _display displayCtrl 60002;
_anzeigeAlter = _display displayCtrl 60003;
_lb_groesseList = _display displayCtrl 60004;
_lb_gewichtList = _display displayCtrl 60005;
_lb_blutgruppeList = _display displayCtrl 60006;
_lb_bdayTagList = _display displayCtrl 60007;
_lb_bdayMonatList = _display displayCtrl 60008;
_lb_bdayJahrList = _display displayCtrl 60009;
_lb_plzStadtList = _display displayCtrl 60012;
_eingabeStrasse = _display displayCtrl  60010;
_eingabeHausnr = _display displayCtrl 60011;
_anzeigeEmail = _display displayCtrl 60013;
_anzeigeHandynr = _display displayCtrl 60014;
_knopfsenden = _display displayCtrl 60015;

_knopfsenden ctrlEnable false;

_sex = if((lbCurSel 60002) != -1) then {true} else {false};
_cm = if((lbCurSel 60004) != -1) then {true} else {false};
_kg = if((lbCurSel 60005) != -1) then {true} else {false};
_abab0 = if((lbCurSel 60006) != -1) then {true} else {false};
_bdayT = if((lbCurSel 60007) != -1) then {true} else {false};
_bdayM = if((lbCurSel 60008) != -1) then {true} else {false};
_bdayJ = if((lbCurSel 60009) != -1) then {true} else {false};
_plztown = if((lbCurSel 60012) != -1) then {true} else {false};
_str = if((lbCurSel 60010) != -1) then {true} else {false};
_hnr = if((lbCurSel 60011) != -1) then {true} else {false};
_bild = if((lbCurSel 60017) != -1) then {true} else {false};
if(_bdayJ) then {
	_sel = call compile format ["%1",lbValue[60009,(lbCurSel 60009)]];
	_date = ((date select 0) - _sel);
	_anzeigeAlter ctrlSetStructuredText parseText format["%1",_date];
	fvs_age = ((date select 0) - _sel);
} else {
	_anzeigeAlter ctrlSetStructuredText parseText "--";
};
if(_sex && _cm && _kg && _abab0 && _bdayT && _bdayM && _bdayJ && _plztown && _str && _hnr && _bild && fvs_hakenregeln && fvs_hakenrichtig && fvs_hakendaten && fvs_namenInfo) then {
	_knopfsenden ctrlEnable true;
} else {
	_knopfsenden ctrlEnable false;
};