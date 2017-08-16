/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoCheck_aenderung.sqf
	Beschreibung:
	Überprüft, ob alle Pflichfelder im Personalausweis befüllt sind und korrekt (Schaltjahr / Februar / 31/30/29/28)
*/
if(playerside != civilian) exitWith {}; // Nur Zivilisten dürfen den Personalausweis ändern
disableSerialization;
if(isNull (findDisplay 70000)) exitWith {};
_display = findDisplay 70000;
_spielername = _display displayCtrl 70002;
_spielervorname = _display displayCtrl 70019;
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
if(DWEV_namen_a) then { // Ist die Checkbox aktiv, so wird auch das Eingabefeld freigegeben, sonst nicht und der Profilname wird genutzt sowie die Email zugleich aktualisiert
	_spielername ctrlEnable true;
	_spielervorname ctrlEnable true;
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
} else {
	_name = "";
	_spielername ctrlEnable false;
	_spielervorname ctrlEnable false;
	_profname = (profileName) splitString "";
	_zeichen = "1234567890!$%&/()=?{[]}\^+*~#.:,;<>|";
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
_mehralsXZeichen = if(count(ctrlText (70002) splitString "") >= 3 && count(ctrlText (70002) splitString "") <= 16) then {true} else {false}; // Wie viele Zeichen der Spielername beinhalten muss
if(_bdayJ) then {
	_sel = call compile format ["%1",lbValue[70010,(lbCurSel 70010)]];
	_date = ((Amyf_zeit select 4) - _sel);
	_anzeigeAlter ctrlSetStructuredText parseText format["%1",_date];
	DWEV_age = _date;
} else {
	_anzeigeAlter ctrlSetStructuredText parseText "--";
};
if(_sex && _cm && _kg && _abab0 && _bdayT && _bdayM && _bdayJ && _plztown && _str && _hnr && _bild && _mehralsXZeichen) then {
	_knopfsenden ctrlEnable true;
} else {
	_knopfsenden ctrlEnable false;
};