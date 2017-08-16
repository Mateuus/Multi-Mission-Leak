/*
	file: fn_cemterMsg.sqf
	Author: Teebaron
	Description:
	Zeigt einen Nachrichtentext oben zentriert an.
	
	Parameter:
	[typ (int), text (String), zeigeHintergrund (Boolean]
	typ = 1,2 Wobei 1 = Admin Nachricht 2 = Event Mitteilung
	text = die Nachricht
	zeigeHintergrund = Eine graue Box hinter dem Text
*/
private ["_farbe","_txt","_display","_txtMsg","_istHintergund","_pos"];

_typ = param [0, 0];
_txt = param [1, "Fehler! Kein Text"];
_istHintergund = param [2, false];
_farbe = "#ff0000";

switch (_typ) do {
    case 1: { _farbe = "#ff0000";_typ = "Admin Nachricht:" };
    case 2: { _farbe = "#00ff00";_typ = "Event Mitteilung:" };
	case 3: { _farbe = "#0000ff";_typ = "Gang Area:" };
    default { _farbe = "#ff0000";_typ = "" };
};

//Öffne das Display
"centerMsg" cutRsc ["CenterMsg","PLAIN"];
//Schreibe den Text in die Konsole zum nachlesen
systemChat format ["%1 %2", _typ, _txt];

//Auf den Display warten
waitUntil {!isNull (uiNameSpace getVariable "CenterMsg")};

disableSerialization;
//Gib mir das Display
_display = uiNameSpace getVariable "CenterMsg";
_txtMsg = _display displayCtrl 1100;
//Setze den Text in die Box
_txtMsg ctrlSetStructuredText (parseText format["<t size='1.25' color='%1'>%2</t><br /> <t size='1' color='#ffffff'>%3</t>",_farbe,_typ, _txt]);
_pos = ctrlPosition _txtMsg;
//Leichte korrektur der Position für einen breiteren Rand oben
_txtMsg ctrlSetPosition [(_pos select 0), (_pos select 1), (_pos select 2), 0.5];
//Drucke den Text auf das Display
_txtMsg ctrlCommit 0;
//Hintergund Ja oder Nein
if(_istHintergund) then {_txtMsg ctrlSetBackgroundColor [0,0,0,0.3];};

//Spiele den Sound ab 6 mal wegen der Lautstärke
playSound "scoreAdded"; 
playSound "scoreAdded"; 
playSound "scoreAdded"; 
playSound "scoreAdded"; 
playSound "scoreAdded"; 
playSound "scoreAdded"; 


