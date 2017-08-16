/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
_cityCfg = getArray(missionConfigFile >> "cfgAusweis" >> "ausweis_stadt");

_name		= ctrlText 1401;
_vorname	= ctrlText 1400;
_stadtsa	= ctrlText 1403;

_geschle	= lbCurSel 1502;
_stadt		= lbCurSel 1500;
_pass		= lbCurSel 1501;

///////////////////////gebdatum //////////////////////
_gebd = ctrlText 1405;
_gebm = ctrlText 1402;
_gebj = ctrlText 1404;

if ((ctrltext 1405) == "") exitWith {hint "Du musst ein Tag eingeben.";};
if ((ctrltext 1402) == "") exitWith {hint "Du musst ein Monat eingeben.";};
if ((ctrltext 1404) == "") exitWith {hint "Du musst ein jahr eingeben.";};

if(!([_gebd] call fnc_isnumber) || !([_gebm] call fnc_isnumber) || !([_gebj] call fnc_isnumber)) exitWith
{
	hint "Bitte beim Geb. Datum nur zahlen!";
};
_gebd = parseNumber _gebd;
if(_gebd < 1 || _gebd > 31) exitWith { hint "Geburtstag von 1 bis 31"; };

_gebm = parseNumber _gebm;
if(_gebm < 1 || _gebm > 12) exitWith { hint "Geburtsmonat von 1 bis 12"; };

_gebj = parseNumber _gebj;
if(_gebj < 1900 || _gebj > 2050) exitWith { hint "Geburtstag von 1900 bis 2050"; };

_gebdatum = format["%1.%2.%3", _gebd,_gebm,_gebj];
///////////////////////gebdatum //////////////////////

///////////////////////Geschlecht//////////////////////
if((lbCurSel 1502) == -1) exitWith {hint "Du musst dein Geschlecht auswählen.";};

switch (_geschle) do {
	case 0: {
	_geschle = "Männlich";
	};
	case 1: {
	_geschle = "Weiblich";
	};
};
///////////////////////Geschlecht//////////////////////

///////////////////////Stadt//////////////////////////
if((lbCurSel 1500) == -1) exitWith {hint "Du musst eine Stadt auswählen.";};

_stadt = _cityCfg select _stadt;
///////////////////////Stadt//////////////////////////

///////////////////////Passfoto//////////////////////////

if((lbCurSel 1501) == -1) exitWith {hint "Du musst ein Passfoto auswählen.";};

///////////////////////Passfoto//////////////////////////

///////////////////////Name und Vorname und stadts //////////////////////////
if ((ctrltext 1401) == "") exitWith {hint "Du musst dein Nachname eingeben.";};
if ((ctrltext 1400) == "") exitWith {hint "Du musst dein Vorname eingeben.";};
if ((ctrltext 1403) == "") exitWith {hint "Du musst deine Staatsangehörigkeit eingeben.";};
///////////////////////Name und Vorname und stadts //////////////////////////
_data = [];

_data pushBack	_name;
_data pushBack	_vorname;
_data pushBack	_gebdatum;
_data pushBack	_stadtsa;
_data pushBack	_geschle;
_data pushBack	_stadt;
_data pushBack	_pass;


[[player,getPlayerUID player,name player,_data], "EMonkeys_fnc_ausweissave",false,false] call EMonkeys_fnc_mp;

if(EMonkeys_PlayerInTutorial) then {eM_TutorialAusweis = true;} else {EMonkeys_c164 = EMonkeys_c164 - 20000;};
closeDialog 0;