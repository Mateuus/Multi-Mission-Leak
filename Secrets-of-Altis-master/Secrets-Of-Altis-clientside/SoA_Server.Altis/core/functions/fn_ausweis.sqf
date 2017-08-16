_mode = _this select 3;

switch(_mode) do {

	case 0: {
		disableSerialization;
	
		if(playerside != civilian) exitWith {hint "Deinen Ausweis kannst du nur in zivil beantragen!"};
		if(!license_civ_ausweis && life_ausweisdaten isEqualTo []) then {
			_geschlecht = [
				"Bist du männlich oder weiblich?",
				"Geschlecht wählen",
				"Männlich",
				"Weiblich"
			] call BIS_fnc_guiMessage;

			if(!dialog) then {createdialog "ausweiserstellen"} else {closedialog 0; createdialog "ausweiserstellen"};
			
			_dialog = finddisplay 7200;
			_ausweishintergrund = _dialog displayCtrl 7201;
			_geburtsort = _dialog displayCtrl 7204;
			_geburtstag = _dialog displayCtrl 7205;
			_geburtsmonat = _dialog displayCtrl 7206;
			_geburtsjahr = _dialog displayCtrl 7207;
			_national = _dialog displayCtrl 7208;
			
			_dialog displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"]; 
			
			if(_geschlecht) then {_ausweishintergrund ctrlSetText "images\ausweismann.paa"} else {_ausweishintergrund ctrlSetText "images\ausweisfrau.paa"};
			
			{
				_geburtsort lbadd format["%1",_x];
				_geburtsort lbSetData [(lbSize _geburtsort)-1,_x];
			} foreach ["Kavala","Athira","Pyrgos","Sofia","Agios Dionysios","Chalkeia","Negades","Kore","Neri","Topolia","Frini","Selakano","Krya Nera","Telos","Kalochori","Molos"];
			
			for "_i" from 1 to 31 do {
				_geburtstag lbadd format["%1",_i];
				_geburtstag lbSetValue [(lbSize _geburtstag)-1,_i];
			};
			
			for "_i" from 1 to 12 do {
				_geburtsmonat lbadd format["%1",_i];
				_geburtsmonat lbSetValue [(lbSize _geburtsmonat)-1,_i];
			};
			
			for "_i" from 1950 to 2016 do {
				_geburtsjahr lbadd format["%1",_i];
				_geburtsjahr lbSetValue [(lbSize _geburtsjahr)-1,_i];
			};
			
			{
				_national lbadd format["%1",_x];
				_national lbSetData [(lbSize _national)-1,_x];
			} foreach ["Deutsch","Englisch","Französisch","Italienisch","Spanisch","Russisch","Chinesisch","Japanisch","Niederländisch","Belgisch","Rumänisch","Bulgarisch","Griechisch"];
			
		} else {
			
			_action = [
				"Möchtest du deine Ausweisdaten für 15.000€ erneut beantragen?",
				"Ausweisdaten ändern",
				"Ja",
				"Nein"
			] call BIS_fnc_guiMessage;
			
			if(!_action) exitWith {};

			_geschlecht = [
				"Bist du männlich oder weiblich?",
				"Geschlecht wählen",
				"Männlich",
				"Weiblich"
			] call BIS_fnc_guiMessage;

			if(life_beatbankgeld < 15000) exitWith {hint "Du besitzt keine 15.000€ auf deinem Bankkonto."};
			
			life_beatbankgeld = life_beatbankgeld - 15000;
			
			if(!dialog) then {createdialog "ausweiserstellen"} else {closedialog 0; createdialog "ausweiserstellen"};
			
			_dialog = finddisplay 7200;
			_ausweishintergrund = _dialog displayCtrl 7201;
			_geburtsort = _dialog displayCtrl 7204;
			_geburtstag = _dialog displayCtrl 7205;
			_geburtsmonat = _dialog displayCtrl 7206;
			_geburtsjahr = _dialog displayCtrl 7207;
			_national = _dialog displayCtrl 7208;
			
			_dialog displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"]; 
			
			if(_geschlecht) then {_ausweishintergrund ctrlSetText "images\ausweismann.paa"} else {_ausweishintergrund ctrlSetText "images\ausweisfrau.paa"};
			
			{
				_geburtsort lbadd format["%1",_x];
				_geburtsort lbSetData [(lbSize _geburtsort)-1,_x];
			} foreach ["Kavala","Athira","Pyrgos","Sofia","Agios Dionysios","Chalkeia","Negades","Kore","Neri","Topolia","Frini","Selakano","Krya Nera","Telos","Kalochori","Molos"];
			
			for "_i" from 1 to 31 do {
				_geburtstag lbadd format["%1",_i];
				_geburtstag lbSetValue [(lbSize _geburtstag)-1,_i];
			};
			
			for "_i" from 1 to 12 do {
				_geburtsmonat lbadd format["%1",_i];
				_geburtsmonat lbSetValue [(lbSize _geburtsmonat)-1,_i];
			};
			
			for "_i" from 1950 to 2016 do {
				_geburtsjahr lbadd format["%1",_i];
				_geburtsjahr lbSetValue [(lbSize _geburtsjahr)-1,_i];
			};
			
			{
				_national lbadd format["%1",_x];
				_national lbSetData [(lbSize _national)-1,_x];
			} foreach ["Deutsch","Englisch","Französisch","Italienisch","Spanisch","Russisch","Chinesisch","Japanisch","Niederländisch","Belgisch","Rumänisch","Bulgarisch","Griechisch"];
		};
	};

	case 1: {
		disableSerialization;
	
		_dialog = finddisplay 7200;
		_badChar = false;
	
		_ausweishintergrund = _dialog displayCtrl 7201;
		_nachname = _dialog displayctrl 7202;
		_vorname = _dialog displayCtrl 7203;
		_geburtsort = _dialog displayCtrl 7204;
		_geburtstag = _dialog displayCtrl 7205;
		_geburtsmonat = _dialog displayCtrl 7206;
		_geburtsjahr = _dialog displayCtrl 7207;
		_national = _dialog displayCtrl 7208;
		
		_geschlecht = "";
		_nachname = ctrlText _nachname;
		_vorname = ctrltext _vorname;
		_geburtsort = (_geburtsort lbData (lbCurSel _geburtsort));	
		_geburtstag = (_geburtstag lbValue (lbCurSel _geburtstag));
		_geburtsmonat = (_geburtsmonat lbValue (lbCurSel _geburtsmonat));
		_geburtsjahr = (_geburtsjahr lbValue (lbCurSel _geburtsjahr));
		_national = (_national lbData (lbCurSel _national));

		if(ctrlText _ausweishintergrund == "images\ausweismann.paa") then {_geschlecht = "mann"} else {_geschlecht = "frau"};
		
		if(_nachname == "" OR isnil "_nachname") exitWith {hint "Keinen Nachnamen eingegeben!"};
		if(_vorname == "" OR isnil "_vorname") exitWith {hint "Keinen Vornamen eingegeben!"};
		if(_geburtsort == "" OR isnil "_geburtsort") exitWith {hint "Keinen Geburtsort gewählt!"};
		if(_geburtstag == 0 OR isnil "_geburtstag") exitWith {hint "Keinen Geburtstag gewählt!"};
		if(_geburtsmonat == 0 OR isnil "_geburtsmonat") exitWith {hint "Keinen Geburtsmonat gewählt!"};
		if(_geburtsjahr == 0 OR isnil "_geburtsjahr") exitWith {hint "Kein Geburtsjahr gewählt!"};
		if(_national == "" OR isnil "_national") exitWith {hint "Keine Nationalität gewählt!"};
		
		_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜabcdefghijklmnopqrstuvwxyzäöüß");

		_length = count (toArray(_nachname));
		_chrByte = toArray (_nachname);
		if(_length > 10) exitWith {hint "Dein Nachname ist länger als 10 Zeichen."};
		{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
		if(_badChar) exitWith {hint "In deinem Nachnamen befinden sich ungültige Zeichen.";};
		
		_length = count (toArray(_vorname));
		_chrByte = toArray (_vorname);
		if(_length > 10) exitWith {hint "Dein Vorname ist länger als 10 Zeichen."};
		{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
		if(_badChar) exitWith {hint "In deinem Vornamen befinden sich ungültige Zeichen.";};

		_name = format["%1 %2",_vorname,_nachname];
		
		//profileNamespace setVariable ["ausweis",[_nachname,_vorname,_geburtsort,_geburtstag,_geburtsmonat,_geburtsjahr,_national,_geschlecht]];
		//saveProfileNamespace;
		life_ausweisdaten = [_nachname,_vorname,_geburtsort,_geburtstag,_geburtsmonat,_geburtsjahr,_national,_geschlecht];
		[4] call SOCK_fnc_UpdatePartial;

		
		closedialog 0;
		
		if(life_level == 0) then {life_exp = life_exp + 50; [] spawn life_fnc_exptolevel};
		license_civ_ausweis = true;
		hintC format["Herzlichen Glückwunsch %1, du bist nun offiziell Bürger von Altis! Denke bitte daran beim nächsten Besuch der Insel, dein Namensprofil an %2 anzupassen! Dies musst du nicht sofort ändern, sondern kannst es vor dem nächsten Inselbesuch tun!",name player,_name];
	};
	
	case 2: {
		_ausweis = life_ausweisdaten;

		if(_ausweis isEqualTo []) exitWith {hint "Deine Ausweisdaten sind korrupt, du musst sie möglicherweise neu beantragen!"};
	
		["","","",3,(_ausweis select 0),(_ausweis select 1),(_ausweis select 2),(_ausweis select 3),(_ausweis select 4),(_ausweis select 5),(_ausweis select 6),(_ausweis select 7),((group player) getVariable ["gang_tag","Kein Tag"])] remoteExecCall ["life_fnc_ausweis",cursortarget];
	};

	case 3: {
		disableSerialization;
		
		20 cutRsc ["life_ausweis", "PLAIN", 1, false];

		_dialog = uiNameSpace getVariable "life_ausweis";
		_ausweishintergrund = _dialog displayCtrl 7221;
		_nachname = _dialog displayctrl 7222;
		_vorname = _dialog displayCtrl 7223;
		_geburtsort = _dialog displayCtrl 7224;
		_geburtstag = _dialog displayCtrl 7225;
		_geburtsmonat = _dialog displayCtrl 7226;
		_geburtsjahr = _dialog displayCtrl 7227;
		_national = _dialog displayCtrl 7228;
		_gangtag = _dialog displayCtrl 7229;
		
		if((_this select 11) == "mann") then {_ausweishintergrund ctrlSetText "images\ausweismann.paa"} else {_ausweishintergrund ctrlSetText "images\ausweisfrau.paa"};
		_nachname ctrlSetText (_this select 4);
		_vorname ctrlSetText (_this select 5);
		_geburtsort ctrlSetText (_this select 6);	
		_geburtstag ctrlSetText str(_this select 7);
		_geburtsmonat ctrlSetText str(_this select 8);
		_geburtsjahr ctrlSetText str(_this select 9);
		_national ctrlSetText (_this select 10);
		_gangtag ctrlSetText format["[%1]",_this select 12];
	};
	
	case 4: {
		_ausweis = life_ausweisdaten;
		["","","",3,(_ausweis select 0),(_ausweis select 1),(_ausweis select 2),(_ausweis select 3),(_ausweis select 4),(_ausweis select 5),(_ausweis select 6),(_ausweis select 7),((group player) getVariable ["gang_tag","Kein Tag"])] call life_fnc_ausweis;
	};
};