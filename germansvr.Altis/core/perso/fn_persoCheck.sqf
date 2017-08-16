/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoCheck.sqf
	Beschreibung:
		Überprüft, ob alle Pflichfelder im Personalausweis befüllt sind und korrekt (Schaltjahr / Februar / 31/30)
*/
disableSerialization;
if(isNull (findDisplay 60000)) exitWith {};
0 cutFadeOut 9999999;
if(isNull (findDisplay 60000)) exitWith {hint "Fehler"; endMission "dialogperso";};
_display = findDisplay 60000;
_gangtag = _display displayCtrl 60002;
_vname = _display displayCtrl 60003;
_nname = _display displayCtrl 60004;
_lb_geschlechtList = _display displayCtrl 60005;
_lb_groesseList = _display displayCtrl 60006;
_lb_gewichtList = _display displayCtrl 60007;
_lb_bdayTagList = _display displayCtrl 60008;
_lb_bdayMonatList = _display displayCtrl 60009;
_lb_bdayJahrList = _display displayCtrl 60010;
_mnr = _display displayCtrl 60011;
_lb_bildID = _display displayCtrl 60012;
_bild = _display displayCtrl 60013;
_knopfsenden = _display displayCtrl 60014;

_knopfsenden ctrlEnable false;


_vn = if((ctrlText 60003) != "") then {true} else {false};
_nn = if((ctrlText 60004) != "") then {true} else {false};
_sex = if((lbCurSel 60005) != -1) then {true} else {false};
_cm = if((lbCurSel 60006) != -1) then {true} else {false};
_kg = if((lbCurSel 60007) != -1) then {true} else {false};
_bdayT = if((lbCurSel 60008) != -1) then {true} else {false};
_bdayM = if((lbCurSel 60009) != -1) then {true} else {false};
_bdayJ = if((lbCurSel 60010) != -1) then {true} else {false};
_bild = if((lbCurSel 60013) != -1) then {true} else {false};
if(_vn && _nn && _sex && _cm && _kg && _bdayT && _bdayM && _bdayJ && _bild && life_hakenregeln && life_hakenrichtig && life_hakendaten && life_namenInfo) then {
	_knopfsenden ctrlEnable true;
} else {
	_knopfsenden ctrlEnable false;
};