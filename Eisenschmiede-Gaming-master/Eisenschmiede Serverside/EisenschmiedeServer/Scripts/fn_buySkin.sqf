
_mode=_this select 0;

switch(_mode)do{
	case 0{
		disableSerialization;
		_skincombo=((finddisplay 122223)displayCtrl 2);
		_skinIndex=_skincombo lbValue lbCurSel _skincombo;
		[ES_tuning_vehicle,_skinIndex]call ES_fnc_colorVehicle;
		[player,graffiti] call ES_fnc_globalSound;
	};
	case 1{
		[]spawn{
			disableSerialization;
			_skincombo=((finddisplay 122223)displayCtrl 2);
			_skinIndex=_skincombo lbValue lbCurSel _skincombo;
			if(_skinIndex==ES_tuning_skinbackup)exitWith{cutText[Das Fahrzeug ist bereits mit dieser Lakierung lakiert worden. Bitte wähle eine andere Lackierung zum Kauf aus,PLAIN]};
			_confirm=[parseText format[Willst du die Lackierung für dein Fahrzeug wirklich kaufen Die Umlakierung kostet dich 20.000$.],Kauf bestätigen,Ja,Nein]call BIS_fnc_GUIMessage;
			if(!_confirm)exitWith{};
			if(ES_cash15000)exitWith{cuttext[Du hast keine 150000$ dabei,PLAIN]};
			ES_cash=ES_cash-15000;
			cuttext[Die Umlakierung des Fahrzeuges wurde abgeschlossen,PLAIN];
			[player,graffiti] call ES_fnc_globalSound;
			[ES_tuning_vehicle,_skinIndex]remoteExec[ES_fnc_colorVehicle,0];
			[ES_tuning_vehicle,_skinIndex]remoteExec[ES_fnc_vehicleColor,2];
			ES_tuning_skinbackup=_skinIndex;
		};
	};	
};