/*
    Speichert Ausweis Informationen.
*/
disableSerialization;
_dialog = findDisplay 2777;
_name = _dialog displayCtrl 1003;
_geschlecht = _dialog displayCtrl 2104;
_religion = _dialog displayCtrl 2103;
_gtag = _dialog displayCtrl 2100;
_gmon = _dialog displayCtrl 2101;
_gjahr = _dialog displayCtrl 2102;
_gland = _dialog displayCtrl 1407;
_gort = _dialog displayCtrl 1402;
_astrasse = _dialog displayCtrl 1403;
_aort = _dialog displayCtrl 1404;
_aplz = _dialog displayCtrl 1401;
_kafarbe = _dialog displayCtrl 1405;
_kgroesse = _dialog displayCtrl 1406;
_uid = getPlayerUID player;
_side = playerSide;
_sender = player;
_error = [];
_packet = [];
_name ctrlEnable false;
if ((ctrlText _name) isEqualTo "") then {_error pushBack _name;};
if ((lbCurSel _geschlecht) isEqualTo -1)then {_error pushback _geschlecht;};
if ((lbCurSel _religion) isEqualTo -1)then {_error pushback _religion;};
if ((lbCurSel _gtag) isEqualTo -1)then {_error pushback _gtag;};
if ((lbCurSel _gmon) isEqualTo -1)then {_error pushback _gmon;};
if ((lbCurSel _gjahr) isEqualTo -1)then {_error pushback _gjahr;};
if ((ctrlText _gland isEqualTo "") || (ctrlText _gland isEqualTo "Geburtsland"))then {_error pushback _gland;};
if ((ctrlText _gort isEqualTo "") || (ctrlText _gort isEqualTo "Geburtsort"))then {_error pushback _gort;};
if ((ctrlText _astrasse isEqualTo "") || (ctrlText _astrasse isEqualTo "Straße"))then {_error pushback _astrasse;};
if ((ctrlText _aort isEqualTo "") || (ctrlText _aort isEqualTo "Stadt"))then {_error pushback _aort;};
if ((ctrlText _aplz isEqualTo "") || (ctrlText _aplz isEqualTo "PLZ") || !([ctrltext _aplz]call TON_fnc_isnumber))then {_error pushback _aplz;};
if ((ctrlText _kafarbe isEqualTo "") || (ctrlText _kafarbe isEqualTo "Augenfarbe"))then {_error pushback _kafarbe;};
if ((ctrlText _kgroesse isEqualTo "") || (ctrlText _kgroesse isEqualTo "Größe") || !([ctrltext _kgroesse]call TON_fnc_isnumber))then {_error pushback _kgroesse;};
if(count _error > 0)exitWith{
  hint "Ein paar Sachen sind falsch!";
  {
    _x ctrlSetBackgroundColor [1, 0, 0, 0.4];
  }foreach _error;
};


_packet pushback (ctrlText _name);
_packet pushback (_geschlecht lbText (lbCurSel _geschlecht));
_packet pushback (_religion lbText (lbCurSel _religion));
_packet pushback (_gtag lbText (lbCurSel _gtag));
_packet pushback (_gmon lbText (lbCurSel _gmon));
_packet pushback (_gjahr lbText (lbCurSel _gjahr));
_packet pushback (ctrlText _gort);
_packet pushback (ctrlText _gland);
_packet pushback (ctrlText _astrasse);
_packet pushback (ctrlText _aort);
_packet pushback (ctrlText _aplz);
_packet pushback (ctrlText _kafarbe);
_packet pushback (ctrlText _kgroesse);
[_uid,_side,_sender,_packet] remoteExec ["ESG_fnc_checkausweis",2];
