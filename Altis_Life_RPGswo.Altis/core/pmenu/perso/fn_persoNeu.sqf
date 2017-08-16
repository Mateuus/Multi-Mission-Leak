/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoNeu.sqf
	Beschreibung:
	Anlegen eines neuen Personalausweises
*/
DWEV_checking = true;
//0 cutText ["Aufgabe: Personalausweis anlegen","BLACK FADED"];
//0 cutFadeOut 9999999;
disableSerialization;
createDialog "personalausweis_60000";
(findDisplay 60000) displaySetEventHandler ["keyDown","_this call DWEV_fnc_displayHandler"];
waitUntil {!isNull (findDisplay 60000)};
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
_bild = _display displayCtrl 60016;
_lb_bildID = _display displayCtrl 60017;

lbClear _lb_plzStadtList;

_knopfsenden ctrlEnable false; // Weil neu ^^

_name = "";
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
_splitUID = (getPlayerUID player) splitString "";
_handynr = str((round random(99))+700) + (_splitUID select 9) + (_splitUID select 10) + (_splitUID select 11) + (_splitUID select 12) + (_splitUID select 13) + (_splitUID select 14) + (_splitUID select 15) + (_splitUID select 16);
DWEV_handynr = _handynr;
DWEV_email = _email;

_nachname = ""; _vorname = [];
{
    if(_forEachIndex == count(profileName splitString " ")-1) then {
		_nachname = _x;
	} else {
		_vorname pushBackUnique _x;
	};
} forEach (profileName splitString " ");

_spielername ctrlSetText _nachname;
_spielervorname ctrlSetText (_vorname joinString " ");
//_spielername ctrlEnable false;
_anzeigeEmail ctrlSetStructuredText parseText format["%1",_email];
_anzeigeHandynr ctrlSetStructuredText parseText format["0%1",DWEV_handynr];


_configs = (missionConfigFile >> "Personalausweis" >> "persoOrt") call BIS_fnc_getCfgSubClasses;
_array = [];
{
	_array pushBack [getNumber(missionConfigFile >> "Personalausweis" >> "persoOrt" >> _x >> "plz"),getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> _x >> "name"),getArray(missionConfigFile >> "Personalausweis" >> "persoOrt" >> _x >> "str")];
} forEach _configs;
{
	_lb_plzStadtList lbAdd format["%1 %2",_x select 0, _x select 1];
	_lb_plzStadtList lbSetValue [(lbSize _lb_plzStadtList)-1,(_x select 0)];
} forEach _array;
lbSetCurSel [60012,0];

_configs_B = (missionConfigFile >> "Personalausweis" >> "persoBild") call BIS_fnc_getCfgSubClasses;
_arrayBild = [];
{
	_arrayBild pushBack [getNumber(missionConfigFile >> "Personalausweis" >> "persoBild" >> _x >> "id"),getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> _x >> "name")];
} forEach _configs_B;
{
	_lb_bildID lbAdd format["%1 %2",_x select 0, _x select 1];
	_lb_bildID lbSetValue [(lbSize _lb_bildID)-1,_x select 0];
} forEach _arrayBild;
lbSetCurSel [60017,0];

_groesseArr = getArray(missionConfigFile >> "Personalausweis" >> "koerpergroesse");
for "_cm" from (_groesseArr select 0) to (_groesseArr select 1) do
{
	_lb_groesseList lbAdd format["%1",_cm];
	_lb_groesseList lbSetValue [(lbSize _lb_groesseList)-1,_cm];
};
lbSetCurSel [60004,0];

_jahreArr = getArray(missionConfigFile >> "Personalausweis" >> "jahre");
for "_bJ" from (_jahreArr select 0) to (_jahreArr select 1) do
{
	_lb_bdayJahrList lbAdd format["%1",_bJ];
	_lb_bdayJahrList lbSetValue [(lbSize _lb_bdayJahrList)-1,_bJ];
};
lbSetCurSel [60009,0];

_kgArr = getArray(missionConfigFile >> "Personalausweis" >> "gewicht");
for "_kg" from (_kgArr select 0) to (_kgArr select 1) do
{
	_lb_gewichtList lbAdd format["%1",_kg];
	_lb_gewichtList lbSetValue [(lbSize _lb_gewichtList)-1,_kg];
};
lbSetCurSel [60005,0];

_blutgr = getArray(missionConfigFile >> "Personalausweis" >> "blutgr");
{
	_lb_blutgruppeList lbAdd format["%1",_x];
	_lb_blutgruppeList lbSetData [(lbSize _lb_blutgruppeList)-1,str(_x)];
} forEach _blutgr;
lbSetCurSel [60006,0];

_sex = getArray(missionConfigFile >> "Personalausweis" >> "geschlecht");
{
	_lb_geschlechtList lbAdd format["%1",_x];
	_lb_geschlechtList lbSetData [(lbSize _lb_geschlechtList)-1,str(_x)];
} forEach _sex;
lbSetCurSel [60002,0];

[] spawn {
	while{true} do {
		if(isNull (findDisplay 60000)) exitWith {};
		if(!DWEV_checking) exitWith {};
		[]call DWEV_fnc_persoCheck;
		sleep .01;
	};
};