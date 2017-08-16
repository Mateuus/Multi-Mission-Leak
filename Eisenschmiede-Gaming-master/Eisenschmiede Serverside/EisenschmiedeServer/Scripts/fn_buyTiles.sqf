/*
	File: fn_buyTiles.sqf
	Author: Anton
	
	Description:
	Tuning: Fahrzeugteil-Verwaltung
*/

_mode=_this select 0;

switch(_mode)do{
	case 0:{
		disableSerialization;
		_list=((finddisplay 122223)displayCtrl 4);
		if((_list lbText(lbCurSel _list))=="Keine Fahrzeugteile verfuegbar")exitWith{};
		_list lbSetColor[(lbCurSel _list),switch((ES_tuning_parts select(lbCurSel _list))select 1)do{case 0:{ES_tuning_parts set[(lbCurSel _list),[(ES_tuning_parts select(lbCurSel _list))select 0,1,(ES_tuning_parts select(lbCurSel _list))select 2]];ES_tuning_vehicle animate[(ES_tuning_parts select(lbCurSel _list))select 0,1];[0.478,0,0,1]};case 1:{ES_tuning_parts set[(lbCurSel _list),[(ES_tuning_parts select(lbCurSel _list))select 0,0,(ES_tuning_parts select(lbCurSel _list))select 2]];ES_tuning_vehicle animate[(ES_tuning_parts select(lbCurSel _list))select 0,0];[0.188,0.49,0,1]}}];
	};
	case 1:{
		[]spawn{
			disableSerialization;
			if(str(ES_tuning_parts)==str(ES_tuning_vehicle getVariable["parts",[]]))exitWith{cuttext["An den Fahrzeugteilen wurde keine Änderung vorgenommen","PLAIN"]};
			_confirm=[parseText format["Willst du die aktuelle Fahrzeugteil-Kombination wirklich kaufen? Egal wieviele Fahrzeugteile du veränderst, der Umbau kostet dich jedes Mal 10.000$."],"Kauf bestätigen","Ja","Nein"]call BIS_fnc_GUIMessage;
			if(!_confirm)exitWith{};
			if(ES_cash<10000)exitWith{cuttext["Du hast keine 10.000$ dabei","PLAIN"]};
			ES_cash=ES_cash-10000;
			cuttext["Der Umbau der Fahrzeugteile war erfolgreich","PLAIN"];
			ES_tuning_vehicle setVariable["parts",call compile format["%1",ES_tuning_parts],true];
			[ES_tuning_vehicle,ES_tuning_parts]remoteExec["ES_fnc_vehicleParts",2];
		};
	};	
};