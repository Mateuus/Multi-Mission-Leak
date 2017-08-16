/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoNeu.sqf
	Beschreibung:
		Anlegen eines neuen Personalausweises
*/
life_checking = true;
0 cutText ["Aufgabe: Personalausweis anlegen","BLACK FADED"];
0 cutFadeOut 9999999;
disableSerialization;
createDialog "personalausweis_60000";
(findDisplay 60000) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];
waitUntil {!isNull (findDisplay 60000)};
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

_sex = getArray(missionConfigFile >> "Personalausweis" >> "geschlecht");
{
	_lb_geschlechtList lbAdd format["%1",_x];
	_lb_geschlechtList lbSetData [(lbSize _lb_geschlechtList)-1,str(_x)];
} forEach _sex;
lbSetCurSel [60005,0];

_groesseArr = getArray(missionConfigFile >> "Personalausweis" >> "koerpergroesse");
for "_cm" from (_groesseArr select 0) to (_groesseArr select 1) do
{
	_lb_groesseList lbAdd format["%1",_cm];
	_lb_groesseList lbSetValue [(lbSize _lb_groesseList)-1,_cm];
};
lbSetCurSel [60006,0];

_kgArr = getArray(missionConfigFile >> "Personalausweis" >> "gewicht");
for "_kg" from (_kgArr select 0) to (_kgArr select 1) do
{
	_lb_gewichtList lbAdd format["%1",_kg];
	_lb_gewichtList lbSetValue [(lbSize _lb_gewichtList)-1,_kg];
};
lbSetCurSel [60007,0];

_configs_B = (missionConfigFile >> "Personalausweis" >> "persoBild") call BIS_fnc_getCfgSubClasses;
_arrayBild = [];
{
	_arrayBild pushBack [getNumber(missionConfigFile >> "Personalausweis" >> "persoBild" >> _x >> "id"),getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> _x >> "name")];
} forEach _configs_B;
{
	_lb_bildID lbAdd format["%1 %2",_x select 0, _x select 1];
	_lb_bildID lbSetValue [(lbSize _lb_bildID)-1,_x select 0];
} forEach _arrayBild;
lbSetCurSel [60012,0];

_jahreArr = getArray(missionConfigFile >> "Personalausweis" >> "jahre");
for "_bJ" from (_jahreArr select 0) to (_jahreArr select 1) do
{
	_lb_bdayJahrList lbAdd format["%1",_bJ];
	_lb_bdayJahrList lbSetValue [(lbSize _lb_bdayJahrList)-1,_bJ];
};
lbSetCurSel [60010,0];

[] spawn {
	while{true} do {
		if(isNull (findDisplay 60000)) exitWith {};
		if(!life_checking) exitWith {};
		[]call life_fnc_persoCheck;
		sleep .01;
	};
};