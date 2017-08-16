private["_mode","_dialog","_applist","_preis","_buybutton","_beschreibung","_deinstallbutton","_download"];
disableSerialization;

_mode = _this select 0;

switch(_mode) do {

	case 0: {
		createdialog "appstore";
		_old = "";
		_dialog = finddisplay 3300;
		_applist = _dialog displayCtrl 3301;
		_preis = _dialog displayCtrl 3302;
		_buybutton = _dialog displayCtrl 3303;
		_beschreibung = _dialog displayCtrl 3304;
		_deinstallbutton = _dialog displayCtrl 3305;
		_download = _dialog displayCtrl 3306;
		
		
		lbClear _applist;
		
		{
			_appname = [_x] call life_fnc_varToStr;
			_img = [_x] call life_fnc_itemIcon;
			_val = missionNamespace getVariable _x;
			
			_applist lbadd format[" %1",_appname];
			_applist lbSetPicture [(lbsize _applist)-1,_img];
			_applist lbSetdata [(lbsize _applist)-1,_x];
			_applist lbSetColor [(lbsize _applist)-1,[0,1,0,1]];
			
			if(!_val) then {
				_applist lbSetPictureColor [(lbsize _applist)-1,[1,1,1,1]];
				_applist lbSetColor [(lbsize _applist)-1,[1,1,1,1]];
			};
		} foreach life_apps;

		_applist lbSetCurSel 0;
		
		while{dialog} do {
			WaitUntil {((lbCurSel _applist) != -1) AND (_applist lbData (lbCurSel _applist)) != _old};
			_old = (_applist lbData (lbCurSel _applist));
			_apppreis = [_old] call life_fnc_apppreis;		
			_preis ctrlSetText format["Preis: %1€",[_apppreis] call life_fnc_numberText];
			_beschreibung ctrlSetStructuredText parseText ([_old] call life_fnc_beschreibung);
			_val = missionNamespace getVariable _old;
			if(_val) then {_buybutton ctrlEnable false; _deinstallbutton ctrlEnable true} else {_deinstallbutton ctrlEnable false; _buybutton ctrlEnable true};
		};
	};

	case 1: {
		_dialog = finddisplay 3300;
		_applist = _dialog displayCtrl 3301;
		_preis = _dialog displayCtrl 3302;
		_buybutton = _dialog displayCtrl 3303;
		_beschreibung = _dialog displayCtrl 3304;
		_deinstallbutton = _dialog displayCtrl 3305;
		_download = _dialog displayCtrl 3306;
	
	
		_app = (_applist lbData (lbCurSel _applist));
		_appkosten = [_app] call life_fnc_apppreis;
		_appname = [_app] call life_fnc_varToStr;
		
		if(isnil "_app") exitWith {hint "Keine App ausgewählt!"};
		
		if(life_guthaben < _appkosten) exitWith {hint "Dein Guthaben reicht für diese App nicht aus. Kaufe Guthaben im Zubehörladen!"};
		life_guthaben = life_guthaben - _appkosten;
		
		disableUserInput true;
		_deinstallbutton ctrlEnable false;
		_buybutton ctrlEnable false;
		for "_i" from 0 to 100 do {_download ctrlSetText format["Download: %1%2 (%3 kb/s)",_i,"%",random(500)]; sleep random 0.6};
		
		_download ctrlSetTextColor [0,1,0,0.5];
		_download ctrlSetText format["App %1 heruntergeladen.",_appname];
		
		sleep 2;
		
		_download ctrlSetText "Starte System neu...";
		
		sleep 2;
		
		disableUserInput false;
		hint format["Du hast die App %1 für %2€ gekauft.",_appname,[_appkosten] call life_fnc_numberText];
		missionNamespace setVariable[_app,true];
		
		[13] call SOCK_fnc_updatePartial;
		[0] call life_fnc_closedialog;
	};
	
	case 2: {
		_dialog = finddisplay 3300;
		_applist = _dialog displayCtrl 3301;
		_preis = _dialog displayCtrl 3302;
		_buybutton = _dialog displayCtrl 3303;
		_beschreibung = _dialog displayCtrl 3304;
		_deinstallbutton = _dialog displayCtrl 3305;
		_download = _dialog displayCtrl 3306;
		
		_app = (_applist lbData (lbCurSel _applist));
		_appname = [_app] call life_fnc_varToStr;
		_val = missionNamespace getVariable _app;
	
		if(isnil "_app") exitWith {hint "Keine App ausgewählt!"};
	
		disableUserInput true;
		_deinstallbutton ctrlEnable false;
		_buybutton ctrlEnable false;
		for "_i" from 0 to 100 do {_download ctrlSetText format["Deinstallieren: %1%2",_i,"%"]; sleep random 0.2};
		
		_download ctrlSetTextColor [1,0,0,0.5];
		_download ctrlSetText format["App %1 deinstalliert.",_appname];
		
		sleep 2;
		
		_download ctrlSetText "Starte System neu...";
		
		sleep 2;
		
		disableUserInput false;
		missionNamespace setVariable[_app,false];
		[13] call SOCK_fnc_updatePartial;
		[0] call life_fnc_closedialog;
	};
};