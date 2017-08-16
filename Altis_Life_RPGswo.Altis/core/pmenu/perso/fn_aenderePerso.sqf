/*
	Autor: Felix von Studsinske
	Dateiname: fn_aenderePerso.sqf
	Beschreibung:
	Anlegen eines neuen Personalausweises

*/
if(playerside != civilian) exitWith {}; 
DWEV_checking_a = true;
_spielerVar = player getVariable ["personaltext",[]];
if(_spielerVar isEqualTo []) exitWith {hint "Der Personalausweises existiert anscheinend nicht... ?";};

disableSerialization;
createDialog "personalausweis_70000a";
waitUntil {!isNull (findDisplay 70000)};
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

_nameP = _spielerVar select 0;
_alter = _spielerVar select 1;
_sex = _spielerVar select 2;
_bltg = _spielerVar select 3;
_stra = _spielerVar select 4;
_handynrP = _spielerVar select 5;
_emailP = _spielerVar select 6;
_cmP = call compile format ["%1",_spielerVar select 7];
_kgP = call compile format ["%1",_spielerVar select 8];
_t = call compile format ["%1",_spielerVar select 9];
_m = call compile format ["%1",_spielerVar select 10];
_j = call compile format ["%1",_spielerVar select 11];
_plz = _spielerVar select 12;
_hsnr = _spielerVar select 13;
_wohnort = getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> (_spielerVar select 12) >> "name");
_bildID = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> (_spielerVar select 14) >> "pfad");

lbClear _lb_plzStadtList;
lbClear _lb_bdayJahrList;
lbClear _lb_bdayMonatList;
lbClear _lb_bdayTagList;
lbClear _lb_blutgruppeList;
lbClear _lb_gewichtList;
lbClear _lb_groesseList;
lbClear _lb_bildID;

_knopfsenden ctrlEnable false; // Weil ändern ^^

_spielername ctrlSetText format["%1",(player getVariable ["nachname", ""])];
_spielervorname ctrlSetText format["%1",(player getVariable ["vorname", ""])];
_name = "";
_profname = ((player getVariable ["personaltext",[profileName]]) select 0) splitString "";
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
_anzeigeEmail ctrlSetStructuredText parseText format["%1",_email];
_anzeigeHandynr ctrlSetStructuredText parseText format["0%1",DWEV_handynr];

_configs = (missionConfigFile >> "Personalausweis" >> "persoOrt") call BIS_fnc_getCfgSubClasses;
_array = [];
{
	_array pushBack [getNumber(missionConfigFile >> "Personalausweis" >> "persoOrt" >> _x >> "plz"),getText(missionConfigFile >> "Personalausweis" >> "persoOrt" >> _x >> "name"),getArray(missionConfigFile >> "Personalausweis " >> "persoOrt" >> _x >> "str")];
} forEach _configs;
{
	_lb_plzStadtList lbAdd format["%1 %2",_x select 0, _x select 1];
	_lb_plzStadtList lbSetValue [(lbSize _lb_plzStadtList)-1,(_x select 0)];
} forEach _array;
lbSetCurSel [70013,0];

_configs_B = (missionConfigFile >> "Personalausweis" >> "persoBild") call BIS_fnc_getCfgSubClasses;
_arrayBild = [];
{
	_arrayBild pushBack [getNumber(missionConfigFile >> "Personalausweis" >> "persoBild" >> _x >> "id"),getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> _x >> "name")];
} forEach _configs_B;
{
	_lb_bildID lbAdd format["%1 %2",_x select 0, _x select 1];
	_lb_bildID lbSetValue [(lbSize _lb_bildID)-1,_x select 0];
} forEach _arrayBild;
lbSetCurSel [70018,0];
_groesseArr = getArray(missionConfigFile >> "Personalausweis" >> "koerpergroesse");
for "_cm" from (_groesseArr select 0) to (_groesseArr select 1) do
{
	_lb_groesseList lbAdd format["%1",_cm];
	_lb_groesseList lbSetValue [(lbSize _lb_groesseList)-1,_cm];
};
lbSetCurSel [70004,0];

_jahreArr = getArray(missionConfigFile >> "Personalausweis" >> "jahre");
for "_bJ" from (_jahreArr select 0) to (_jahreArr select 1) do
{
	_lb_bdayJahrList lbAdd format["%1",_bJ];
	_lb_bdayJahrList lbSetValue [(lbSize _lb_bdayJahrList)-1,_bJ];
};
lbSetCurSel [70010,0];

_kgArr = getArray(missionConfigFile >> "Personalausweis" >> "gewicht");
for "_kg" from (_kgArr select 0) to (_kgArr select 1) do
{
	_lb_gewichtList lbAdd format["%1",_kg];
	_lb_gewichtList lbSetValue [(lbSize _lb_gewichtList)-1,_kg];
};
lbSetCurSel [70006,0];

_blutgr = getArray(missionConfigFile >> "Personalausweis" >> "blutgr");
{
	_lb_blutgruppeList lbAdd format["%1",_x];
	_lb_blutgruppeList lbSetData [(lbSize _lb_blutgruppeList)-1,str(_x)];
} forEach _blutgr;
lbSetCurSel [70007,0];

_sex = getArray(missionConfigFile >> "Personalausweis" >> "geschlecht");
{
	_lb_geschlechtList lbAdd format["%1",_x];
	_lb_geschlechtList lbSetData [(lbSize _lb_geschlechtList)-1,str(_x)];
} forEach _sex;
lbSetCurSel [70003,0];

[] spawn {
	while{true} do {
		if(isNull (findDisplay 70000)) exitWith {};
		if(!DWEV_checking_a) exitWith {};
		call DWEV_fnc_persoCheck_aenderung;
		sleep .01;
	};
};