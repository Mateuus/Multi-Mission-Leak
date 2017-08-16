

if(life_beatgeld < 1000) exitWith {hint "Du hast keine 1000€ bei dir!"};
if(life_netzhacked) exitWith {hint "Altis-Talk ist zurzeit nicht verfügbar. Kein Netz."; playsound "notavailable"};
DisableSerialization;
if(!dialog) then {createdialog "phone"};

_nummern = [];
_dialog = finddisplay 3700;
_callpic = _dialog displayCtrl 3701;
_decallpic = _dialog displayCtrl 3708;
_buttoncall = _dialog displayCtrl 3706;
_buttondecall = _dialog displayCtrl 3709;
_list = _dialog displayCtrl 3703;
_eingabe = _dialog displayCtrl 3704;
_calltext = _dialog displayCtrl 3707;
_eingabe ctrlEnable false;
lbClear _list;

ctrlSetText[3710,"Telefonzelle"]; ctrlShow[3711,false]; ctrlShow[3712,true]; ctrlShow[3703,true]; ctrlShow[3713,false]; ctrlShow[3705,false]; ctrlShow[3714,false]; ctrlShow[3715,false]; ctrlShow[3716,false]; 
if((player getvariable "life_callactive1") OR (player getvariable "life_callactive2")) then {
	_callpic ctrlShow false;
	_buttoncall ctrlShow false;
	_decallpic ctrlShow true;
	_buttondecall ctrlShow true;
	_calltext ctrlSetText "Anruf im Gange...";
} else {
	_callpic ctrlShow true;
	_buttoncall ctrlShow true;
	_decallpic ctrlShow false;
	_buttondecall ctrlShow false;
	_calltext ctrlSetText format["Eigene Nummer: %1",(player getvariable "phone")];
};

{
	_nummern pushback (_x getvariable "phone");
} foreach playableUnits;

{
	if((_x select 0) in _nummern) then {
		_list lbadd format["%1",(_x select 1)];
		_list lbSetData [(lbSize _list)-1,(_x select 0)];
	};
} foreach life_kontakte;

if(((lbSize _list)-1) == -1) exitWith
{
	_list lbAdd "Keine Kontakte vorhanden.";
	_list lbSetData [(lbSize _list)-1,str(ObjNull)];
};