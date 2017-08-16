#include <macro.h>
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0,["",[],0]] call BIS_fnc_param;

disableSerialization;
_dialog = finddisplay 3900;
_kontaktliste = _dialog displayCtrl 3901;
_preview = _dialog displayCtrl 3902;
_ganz = _dialog displayCtrl 3903;
_smsbutton = _dialog displayCtrl 3904;
_notrufbutton = _dialog displayCtrl 3905;
_deletebutton = _dialog displayCtrl 3906;
_maintitle = _dialog displayCtrl 3999;
_unterwegsbutton = _dialog displayCtrl 3908;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
_phoneicon = _ui displayCtrl 60;

_unterwegsbutton ctrlShow false;
_maintitle ctrlSetText format["Nachrichten - Eigene Nummer: %1",(player getvariable "phone")];

//Unterwegs button
switch(playerside) do {

	case independent: {
		_unterwegsbutton ctrlShow true;
		_unterwegsbutton buttonSetAction "[5] call life_fnc_smartphone";
	};
};

switch(_type) do {

	//Kontakte laden
	case 0: {
		_nummern = [];
		
		if(playerside in [west,independent] OR (__GETC__(life_adminlevel) > 0)) then {
			{
				if(_x != player) then {
					_kontaktliste lbadd format["%1",(name _x)];
					_kontaktliste lbSetData [(lbSize _kontaktliste)-1,(_x getvariable ["phone","0000000"])];
				};
			} foreach playableUnits;
		};
		
		{
			if(side _x == west && playerside != west) then {			
				_kontaktliste lbadd format["%1 (POL)",(name _x)];
				_kontaktliste lbSetData [(lbSize _kontaktliste)-1,(_x getvariable ["phone","0000000"])];
			};
			_nummern pushback (_x getvariable "phone");
		} foreach playableUnits;
	
		{
			if((_x select 0) in _nummern) then {
				_kontaktliste lbadd format["%1",(_x select 1)];
				_kontaktliste lbSetData [(lbSize _kontaktliste)-1,(_x select 0)];
			};
		} foreach life_kontakte;
		
		if(((lbSize _kontaktliste)-1) == -1) then
		{
			_kontaktliste lbAdd "Keine Kontakte vorhanden.";
			_kontaktliste lbSetData [(lbSize _kontaktliste)-1,str(ObjNull)];
		};

		[getPlayerUID player, player] remoteExecCall ["SOA_fnc_msgRequest",2];
	};

	//Nachrichtenliste auffüllen
	case 1: 
	{
		if(phonereceived) then {_phoneicon ctrlShow false; phonereceived = false;};
	
		_msg = [_data select 2,40] call KRON_StrLeft;
		_rowData = [_data select 0, _data select 1, _data select 2, _data select 3];
		_preview lnbAddRow[_data select 3,format["  %1 ...",_msg]];
		_preview lnbSetData[[((lnbSize _preview) select 0)-1,0],str(_rowData)];
	};
	
	//SMS Daten sammeln
	case 2:
	{
		_target = _kontaktliste lbData (lbCurSel _kontaktliste);
		_nummern = [];
		_life_smartphonetarget = ObjNull;
	
		{
			_nummern pushback [(_x getvariable "phone"),_x];
		} foreach playableUnits;
		
		{
			if(_target == (_x select 0)) exitWith {_life_smartphonetarget = (_x select 1)};
		} foreach _nummern;

		life_smsTarget = _life_smartphonetarget;
	};
	
	//Nachrichten löschen
	case 3:
	{
		lbClear _preview;
		[player] remoteExecCall ["SOA_fnc_cleanupMessages",2];
	};
	
	//SMS schreiben
	case 4:
	{
		if(life_netzhacked) exitWith {hint "Altis-Talk ist zurzeit nicht verfügbar. Kein Netz."};
		if(life_battery < 2) exitWith {hint "Dein Tablet-Akku ist leer!"};
		if(isNull life_smsTarget) exitWith {hint "Person nicht erreichbar."; playsound "notavailable"};
		createDialog "smsschreiben";
		ctrlSetText[3933, format["Nachricht an: %1",name life_smsTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[3934,false];
		};
	};
};