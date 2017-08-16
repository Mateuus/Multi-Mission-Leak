/*
	File: fn_buyHorn.sqf
	Author: Anton
	
	Description:
	Tuning: Hupen-Verwaltung
*/

_mode=_this select 0;

switch(_mode)do{
	case 0:{
		disableSerialization;
		_horncombo=((finddisplay 122223)displayCtrl 1);
		_hornIndex=_horncombo lbValue lbCurSel _horncombo;
		if(ES_siren_active)exitWith{};
		switch(_hornIndex)do{
			case -1:{};
			case 0:{};
			case 1:{[]spawn{ES_siren_active=true;sleep 2.9;ES_siren_active=false};(vehicle player)say3D"hlacucaracha"};
			case 2:{[]spawn{ES_siren_active=true;sleep 2.8;ES_siren_active=false};(vehicle player)say3D"hmel"};
		};
	};
	case 1:{
		[]spawn{
			disableSerialization;
			_horncombo=((finddisplay 122223)displayCtrl 1);
			_hornIndex=_horncombo lbValue lbCurSel _horncombo;
			if(_hornIndex==ES_tuning_vehicle getVariable["Horn",0])exitWith{cutText["Es wurde keine Änderung vorgenommen","PLAIN"]};
			if(_hornIndex==0)exitWith{
				_confirm=[parseText format["Willst du deine Hupe wirklich ausbauen? Eingebaut wird anschließend die normale Hupe. Der Vorgang ist kostenlos."],"Kauf bestätigen","Ja","Nein"]call BIS_fnc_GUIMessage;
				if(!_confirm)exitWith{};
				_horn=switch(true)do{
					case(typeOf ES_tuning_vehicle in["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_grey_F","C_Hatchback_01_green_F","C_Hatchback_01_blue_F","C_Hatchback_01_bluecustom_F","C_Hatchback_01_beigecustom_F","C_Hatchback_01_yellow_F","C_Hatchback_01_white_F","C_Hatchback_01_black_F","C_Hatchback_01_dark_F","C_Hatchback_01_sport_red_F","C_Hatchback_01_sport_blue_F","C_Hatchback_01_sport_orange_F","C_Hatchback_01_sport_white_F","C_Hatchback_01_sport_grey_F","C_Hatchback_01_sport_green_F","C_SUV_01_F","SUV_01_base_red_F","SUV_01_base_black_F","SUV_01_base_grey_F","SUV_01_base_orange_F","C_Van_01_transport_F","I_G_Van_01_transport_F","C_Van_01_box_F","C_Van_01_fuel_F","I_G_Van_01_fuel_F","B_G_Van_01_transport_F","O_G_Van_01_transport_F","B_G_Van_01_fuel_F","O_G_Van_01_fuel_F","C_Van_01_transport_white_F","C_Van_01_transport_red_F","C_Van_01_box_white_F","C_Van_01_box_red_F","C_Van_01_fuel_white_F","C_Van_01_fuel_red_F","C_Van_01_fuel_white_v2_F","C_Van_01_fuel_red_v2_F"]):{"CarHorn"};
					case(typeOf ES_tuning_vehicle in["O_MRAP_02_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","B_APC_Wheeled_01_cannon_F","O_APC_Wheeled_02_rcws_F","I_APC_Wheeled_03_cannon_F"]):{"TruckHorn"};
					case(typeOf ES_tuning_vehicle in["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_mover_F","B_Truck_01_box_F","B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F"]):{"TruckHorn2"};
					case(typeOf ES_tuning_vehicle in["O_Truck_02_covered_F","O_Truck_02_transport_F","I_Truck_02_covered_F","I_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_repair_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_device_F","O_Truck_02_box_F","O_Truck_02_medical_F","O_Truck_02_Ammo_F","O_Truck_02_fuel_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_medical_F","I_Truck_02_fuel_F"]):{"TruckHorn3"};
					case(typeOf ES_tuning_vehicle in["C_Offroad_01_F","C_Offroad_01_repair_F","B_G_Offroad_01_repair_F","O_G_Offroad_01_repair_F","I_G_Offroad_01_repair_F","I_G_Offroad_01_F","I_G_Offroad_01_armed_F","B_G_Offroad_01_F","O_G_Offroad_01_F","B_G_Offroad_01_armed_F","O_G_Offroad_01_armed_F","C_Offroad_01_red_F","C_Offroad_01_sand_F","C_Offroad_01_white_F","C_Offroad_01_blue_F","C_Offroad_01_darkred_F","C_Offroad_01_bluecustom_F","C_Offroad_luxe_F","C_Offroad_default_F","C_Offroad_stripped_F"]):{"SportCarHorn"};
					case(typeOf ES_tuning_vehicle in["C_Quadbike_01_F","B_Quadbike_01_F","O_Quadbike_01_F","I_Quadbike_01_F","I_G_Quadbike_01_F","B_G_Quadbike_01_F","O_G_Quadbike_01_F","C_Quadbike_01_black_F","C_Quadbike_01_blue_F","C_Quadbike_01_red_F","C_Quadbike_01_white_F"]):{"MiniCarHorn"};
				};
				(vehicle player)addWeaponTurret[_horn,[-1]];
				ES_tuning_vehicle setVariable["Horn",0,true];
				cuttext["Die Hupe wurde ausgebaut","PLAIN"];
			};
			_confirm=[parseText format["Willst du die Hupe wirklich in dein Fahrzeug einbauen lassen? Der Umbau kostet dich 10.000$."],"Kauf bestätigen","Ja","Nein"]call BIS_fnc_GUIMessage;
			if(!_confirm)exitWith{};
			if(ES_cash<10000)exitWith{cuttext["Du hast keine 10.000$ dabei","PLAIN"]};
			ES_cash=ES_cash-10000;
			cuttext["Die Hupe wurde in dein Fahrzeug eingebaut","PLAIN"];
			ES_tuning_vehicle setVariable["Horn",_hornIndex,true];
			[ES_tuning_vehicle,_hornIndex]remoteExec["ES_fnc_vehicleHorn",2];
			{ES_tuning_vehicle removeWeaponTurret[_x,[-1]]}forEach(ES_tuning_vehicle weaponsTurret [-1]);
		};
	};	
};