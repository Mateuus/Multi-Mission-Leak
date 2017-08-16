
if(typeOf ES_tuning_vehicle in["C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","B_Quadbike_01_F"])exitWith{cuttext["Dieses Fahrzeug unterstützt keinen Turbo.","PLAIN"]};

_mode=_this select 0;

switch(_mode)do{
	case 0:{
		[]spawn{
			if((ES_tuning_vehicle getVariable["Turbo",0])>0)exitWith{cuttext["In deinem Fahrzeug ist bereits ein Turbolader verbaut","PLAIN"]};
			_confirm=[parseText format["Willst du wirklich einen Turbolader in deinem Fahrzeug einbauen? Der Umbau kostet dich 100.000$."],"Kauf bestätigen","Ja","Nein"]call BIS_fnc_GUIMessage;
			if(!_confirm)exitWith{};
			if(ES_cash<100000)exitWith{cuttext["Du hast keine 100.000$ dabei","PLAIN"]};
			ES_cash=ES_cash-100000;
			ES_tuning_vehicle setVariable["Turbo",1,true];
			[ES_tuning_vehicle,1]remoteExec["ES_fnc_vehicleTurbo",2];
			(ES_tuning_vehicle)setMass(((getMass(ES_tuning_vehicle)))-(((getMass(ES_tuning_vehicle)))*0.5));
			cuttext["Der Turbolader wurde erfolgreich eingebaut","PLAIN"];
		};
	};
	case 1:{
		[]spawn{
			if((ES_tuning_vehicle getVariable["Turbo",0])<1)exitWith{cuttext["In deinem Fahrzeug ist kein Turbolader verbaut","PLAIN"]};
			_confirm=[parseText format["Willst du den Turbolader wirklich entfernen? Dieser Vorgang ist kostenlos."],"Kauf bestätigen","Ja","Nein"]call BIS_fnc_GUIMessage;
			if(!_confirm)exitWith{};
			ES_tuning_vehicle setVariable["Turbo",0,true];
			[ES_tuning_vehicle,0]remoteExec["ES_fnc_vehicleTurbo",2];
			_tempveh=(typeOf ES_tuning_vehicle)createVehicleLocal[0,0,0];_mass=getMass _tempveh;deleteVehicle _tempveh;
			(ES_tuning_vehicle)setMass(_mass);
			cuttext["Der Turbolader wurde erfolgreich eingebaut","PLAIN"];
		};	
	};
};