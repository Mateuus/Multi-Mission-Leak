/*
    Lädt generelle Ausweis sachen.
*/
createDialog "esg_ausweis_create";
disableSerialization;
(findDisplay 2777) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];
_dialog = findDisplay 2777;
_name = _dialog displayCtrl 1003;
_geschlecht = _dialog displayCtrl 2104;
_religion = _dialog displayCtrl 2103;
_gtag = _dialog displayCtrl 2100;
_gmon = _dialog displayCtrl 2101;
_gjahr = _dialog displayCtrl 2102;
_action = [
  format ["Möchtest du mit dem Namen %1 permanent spielen ? Die Änderung kostet 3.500.000$ im Support!",name player],
   "Namen behalten ?",
   "Ja",
   "Nein"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{endmission "Namechange";};
_name ctrlSetText format["%1",player getvariable ["realname",name player]];

_geschlecht lbAdd "Männlich";
_geschlecht lbAdd "Weiblich";
_religion lbAdd "Deutsch";
_religion lbAdd "Schweiz";
_religion lbAdd "Österreich";
_religion lbAdd "Polnisch";
_religion lbAdd "Russisch";
_religion lbAdd "Französisch";

for "_i" from 1 to 31 do {
    _gtag lbAdd format["%1",_i];
};

for "_o" from 1 to 12 do {
    _gmon lbAdd format["%1",_o];
};

for "_a" from 1980 to 2015 do {
    _gjahr lbAdd format["%1",_a];
};
