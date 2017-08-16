/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoCheck.sqf
	Beschreibung:
	Überprüft, ob alle Pflichfelder im Personalausweis befüllt sind und korrekt (Schaltjahr / Februar / 31/30)
*/
disableSerialization;
if(isNull (findDisplay 60000)) exitWith {};
//0 cutFadeOut 9999999;
if(isNull (findDisplay 60000)) exitWith {hint "Fehler"; endMission "dialogperso";};
_display = findDisplay 60000;
_spielername = _display displayCtrl 60001;
_spielervorname = _display displayCtrl 60018;
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

_name = "";
_profname = (format["%1.%2",ctrlText _spielervorname,ctrlText _spielername]) splitString "";
_zeichen = "1234567890!$%&/()=?{[]}\^+*~#:,;<>|";
_zeichen = _zeichen splitString "";
{
	if(!(_x in _zeichen)) then {
		if(_x == " ") then {
			_name = _name + "_";
		} else {
			_name = _name + _x;
		};
	};
} forEach _profname;
_email = format["%1%2@division-wolf.de",_name,round random 230];
_anzeigeEmail ctrlSetStructuredText parseText format["%1",_email];

if(_bdayJ) then {
	_sel = call compile format ["%1",lbValue[60009,(lbCurSel 60009)]];
	_date = ((Amyf_zeit select 4) - _sel);
	_anzeigeAlter ctrlSetStructuredText parseText format["%1",_date];
	DWEV_age = _date;
} else {
	_anzeigeAlter ctrlSetStructuredText parseText "--";
};
if(_sex && _cm && _kg && _abab0 && _bdayT && _bdayM && _bdayJ && _plztown && _str && _hnr && _bild && DWEV_hakenregeln && DWEV_hakenrichtig && DWEV_hakendaten && DWEV_namenInfo) then {
	_knopfsenden ctrlEnable true;
} else {
	_knopfsenden ctrlEnable false;
};