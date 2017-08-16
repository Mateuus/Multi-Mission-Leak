/*
	Autor: Felix von Studsinske
	Dateiname: fn_zeigePerso.sqf
	Beschreibung:
		Setzt nen HUD für den Spieler auf und zeigt den Personalausweis an.
*/
disableSerialization;
_sender = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(isNull (uiNameSpace getVariable "playerPerso"))) exitWith {hint format["%1 moechte dir seinen Personal- / Dienstausweis zeigen, jedoch schaust du dir gerade einen an. Blende den aktuellen Ausweis mit F10 aus, um den von %1 zu sehen.",_sender getVariable["realname",name _sender]]}; // Aktuell wird schon ein Personalausweis angesehen
if(_sender distance player > 5) exitWith {titleText ["Der Spieler ist zu weit weg","PLAIN"];};
if(isNull _sender) exitWith {};
_senderVar = _sender getVariable ["personaltext",[]];
if(_senderVar isEqualTo []) exitWith {hint format ["Fehler im Personalausweis von %1 und kann somit nicht dargestellt werden ( %1 )",_sender getVariable["realname",name _sender],_senderVar];}; // Fehler

("perso" call BIS_fnc_rscLayer) cutRsc ["playerPerso","PLAIN"];
_ui = uiNameSpace getVariable "playerPerso";

_gangtag = _senderVar select 0;
_vname = _senderVar select 1;
_nname = _senderVar select 2;
_sex = _senderVar select 3;
_cm = _senderVar select 4;
_kg = _senderVar select 5;
_alter = [_senderVar select 6,_senderVar select 7,_senderVar select 8] joinString ".";
_mnr = str(_senderVar select 9);
_bildID = getText(missionConfigFile >> "Personalausweis" >> "persoBild" >> (_senderVar select 10) >> "pfad");
_pc = _ui displayCtrl 411000;
_pi = _ui displayCtrl 413000;
_pe = _ui displayCtrl 412000;
_pz = _ui displayCtrl 410000;
_side = side _sender;
if 	(_side == civilian) 	then 	{_pc ctrlShow false; _pi ctrlShow false; _pe ctrlShow false; };
if 	(_side == west) 		then 	{_pz ctrlShow false; _pi ctrlShow false; _pe ctrlShow false; };
if 	(_side == independent)	then 	{_pc ctrlShow false; _pz ctrlShow false; _pe ctrlShow false; };
if 	(_side == east) 		then 	{_pc ctrlShow false; _pi ctrlShow false; _pe ctrlShow false; };

_bildPerso = _ui displayCtrl 410001;
_bildPerso ctrlSetText format["%1",_bildID];

_vorname = _ui displayCtrl 410002;
_vorname ctrlSetStructuredText parseText format["%1",_vname];

_nachname = _ui displayCtrl 410003;
_nachname ctrlSetStructuredText parseText format["%1",_nname];

_bday = _ui displayCtrl 410004;
_bday ctrlSetStructuredText parseText format["%1",_alter];

_groesse = _ui displayCtrl 410005;
_groesse ctrlSetStructuredText parseText format["%1",_cm];

_gewicht = _ui displayCtrl 410006;
_gewicht ctrlSetStructuredText parseText format["%1",_kg];

_geschlecht = _ui displayCtrl 410007;
_geschlecht ctrlSetStructuredText parseText format["%1",_sex];

_handynrUI = _ui displayCtrl 410008;
_handynrUI ctrlSetStructuredText parseText format["%1",_gangtag];



if(_sender != player) then {
	hint format["Dir wird gerade der Personal- / Dienstausweis von %1 angezeigt. Blende ihn mit F10 wieder aus",_sender getVariable["realname",name _sender]];
} else {
	hint "Du schaust die gerade deinen Personal- / Dienstausweis an. Blende ihn mit F10 wieder aus"; // Eigener Personalausweis?
};
PERSO_EXIT = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',PERSO_EXIT];(""perso"" call BIS_fnc_rscLayer) cutText ["""",""PLAIN""];};false"];
