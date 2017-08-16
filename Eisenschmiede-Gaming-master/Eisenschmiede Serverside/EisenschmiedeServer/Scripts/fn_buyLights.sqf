_mode=_this select 0;
switch(_mode)do{
	case 0:{
		disableSerialization;
		_lightcombo=((finddisplay 122223)displayCtrl 3);
		_light=switch(_lightcombo lbValue lbCurSel _lightcombo)do{
			case 0:{""};
			case 1:{"ChemLight_Green"};
			case 2:{"ChemLight_Red"};
			case 3:{"ChemLight_Yellow"};
			case 4:{"ChemLight_Blue"};
		};
		{deleteVehicle _x}forEach(attachedObjects(ES_tuning_vehicle));
		switch(true)do{
			case((typeOf ES_tuning_vehicle=="C_Kart_01_Blu_F")||(typeOf ES_tuning_vehicle=="C_Kart_01_Fuel_F")||(typeOf ES_tuning_vehicle=="C_Kart_01_Red_F")||(typeOf ES_tuning_vehicle=="C_Kart_01_Vrana_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,0,-0.988142]];
				
			};
			case((typeOf ES_tuning_vehicle=="B_Quadbike_01_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,0,-0.439174]];					
			};
			case((typeOf ES_tuning_vehicle=="C_Offroad_01_F")||(typeOf ES_tuning_vehicle=="B_G_Offroad_01_F")||(typeOf ES_tuning_vehicle=="B_G_Offroad_01_armed_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.26263,-0.933247]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.08608,-0.878348]];		
			};
			case((typeOf ES_tuning_vehicle=="C_Hatchback_01_F")||(typeOf ES_tuning_vehicle=="C_Hatchback_01_sport_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.59201,-0.933247]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-1.7567,-0.933247]];						
			};
			case((typeOf ES_tuning_vehicle=="C_SUV_01_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.97628,-0.988142]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.47036,-0.988142]];						
			};	
			case((typeOf ES_tuning_vehicle=="C_Van_01_transport_F")||(typeOf ES_tuning_vehicle=="C_Van_01_box_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.7018,-0.823452]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.74484,-0.603865]];						
			};
			case((typeOf ES_tuning_vehicle=="I_Truck_02_transport_F")||(typeOf ES_tuning_vehicle=="I_Truck_02_covered_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,3.18402,-1.26263]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.90953,-1.26263]];						
			};
			case((typeOf ES_tuning_vehicle=="O_Truck_03_transport_F")||(typeOf ES_tuning_vehicle=="O_Truck_03_covered_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,3.23891,-1.09793]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.85463,-1.09793]];						
			};
			case((typeOf ES_tuning_vehicle=="B_Truck_01_mover_F")||(typeOf ES_tuning_vehicle=="B_Truck_01_transport_F")||(typeOf ES_tuning_vehicle=="B_Truck_01_box_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,3.73298,-0.768557]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.30566,-0.768557]];				
			};
			case((typeOf ES_tuning_vehicle=="O_MRAP_02_F")||(typeOf ES_tuning_vehicle=="O_MRAP_02_hmg_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,0.109792,-1.31752]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-3.51339,-1.31752]];				
			};
			case((typeOf ES_tuning_vehicle=="B_MRAP_01_F")||(typeOf ES_tuning_vehicle=="B_MRAP_01_hmg_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,0.548966,-1.09793]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.63505,-1.09793]];				
			};
			case((typeOf ES_tuning_vehicle=="I_MRAP_03_F")||(typeOf ES_tuning_vehicle=="I_MRAP_03_hmg_F")):{
				_light1=(_light)createVehicleLocal[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.81159,-0.823452]];
				_light2=(_light)createVehicleLocal[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-1.42732,-0.823452]];				
			};			
		};		
	};
	case 1:{
		disableSerialization;
		_lightcombo=((finddisplay 122223)displayCtrl 3);
		_light=_this select 1;
		_confirm=_this select 2;
		_c2=call compile str(_confirm);
		_abort=false;
		if(isNil"_light")then{
			_light=switch(_lightcombo lbValue lbCurSel _lightcombo)do{
				case 0:{""};
				case 1:{"ChemLight_Green"};
				case 2:{"ChemLight_Red"};
				case 3:{"ChemLight_Yellow"};
				case 4:{"ChemLight_Blue"};
			};
		};
		if((_light==(ES_tuning_vehicle getVariable["Light",""]))&&_confirm)exitWith{cutText["Du hast keine Änderungen vorgenommen","PLAIN"]};
		if(_light=="")exitWith{[]spawn{_confirm=["Willst du die Unterbodenbeleuchtung wirklich demontieren? Dieser Vorgang ist kostenlos.","Kauf bestätigen","Ja","Nein"]call BIS_fnc_GUIMessage;if(_confirm)then{{deleteVehicle _x}forEach(attachedObjects(ES_tuning_vehicle));ES_tuning_vehicle setVariable["Tuning",[(ES_tuning_vehicle getVariable["Tuning",[]])select 0,"",(ES_tuning_vehicle getVariable["Tuning",[]])select 2,(ES_tuning_vehicle getVariable["Tuning",[]])select 3]]}}};
		if(_confirm)then{_confirm=["Willst diese Unterbodenleuchtung wirklich kaufen? Der Anbau kostet 10.000 $. Die Lichter sind einmalig","Kauf bestätigen","Ja","Nein"]call BIS_fnc_GUIMessage}else{_confirm=true};
		if(!_confirm)exitWith{};
		if(_c2)then{
			if(ES_cash<10000)exitWith{_abort=true;cuttext["Du hast keine 10.000 $ dabei","PLAIN"]};
			ES_cash=ES_cash-10000;
			ES_tuning_vehicle setVariable["Light",_light,true];
		};
		if(_abort)exitWith{};
		{deleteVehicle _x}forEach(attachedObjects(ES_tuning_vehicle));
		switch(true)do{
			case((typeOf ES_tuning_vehicle=="C_Kart_01_Blu_F")||(typeOf ES_tuning_vehicle=="C_Kart_01_Fuel_F")||(typeOf ES_tuning_vehicle=="C_Kart_01_Red_F")||(typeOf ES_tuning_vehicle=="C_Kart_01_Vrana_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,0,-0.988142]];				
			};
			case((typeOf ES_tuning_vehicle=="B_Quadbike_01_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,0,-0.439174]];					
			};
			case((typeOf ES_tuning_vehicle=="C_Offroad_01_F")||(typeOf ES_tuning_vehicle=="B_G_Offroad_01_F")||(typeOf ES_tuning_vehicle=="B_G_Offroad_01_armed_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.26263,-0.933247]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.08608,-0.878348]];						
			};
			case((typeOf ES_tuning_vehicle=="C_Hatchback_01_F")||(typeOf ES_tuning_vehicle=="C_Hatchback_01_sport_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.59201,-0.933247]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-1.7567,-0.933247]];						
				};
			case((typeOf ES_tuning_vehicle=="C_SUV_01_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.97628,-0.988142]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.47036,-0.988142]];						
			};	
			case((typeOf ES_tuning_vehicle=="C_Van_01_transport_F")||(typeOf ES_tuning_vehicle=="C_Van_01_box_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.7018,-0.823452]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.74484,-0.603865]];						
			};
			case((typeOf ES_tuning_vehicle=="I_Truck_02_transport_F")||(typeOf ES_tuning_vehicle=="I_Truck_02_covered_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,3.18402,-1.26263]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.90953,-1.26263]];						
			};
			case((typeOf ES_tuning_vehicle=="O_Truck_03_transport_F")||(typeOf ES_tuning_vehicle=="O_Truck_03_covered_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,3.23891,-1.09793]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.85463,-1.09793]];						
			};
			case((typeOf ES_tuning_vehicle=="B_Truck_01_mover_F")||(typeOf ES_tuning_vehicle=="B_Truck_01_transport_F")||(typeOf ES_tuning_vehicle=="B_Truck_01_box_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,3.73298,-0.768557]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.30566,-0.768557]];				
			};
			case((typeOf ES_tuning_vehicle=="O_MRAP_02_F")||(typeOf ES_tuning_vehicle=="O_MRAP_02_hmg_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,0.109792,-1.31752]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-3.51339,-1.31752]];				
			};
			case((typeOf ES_tuning_vehicle=="B_MRAP_01_F")||(typeOf ES_tuning_vehicle=="B_MRAP_01_hmg_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,0.548966,-1.09793]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-2.63505,-1.09793]];				
			};
			case((typeOf ES_tuning_vehicle=="I_MRAP_03_F")||(typeOf ES_tuning_vehicle=="I_MRAP_03_hmg_F")):{
				_light1=(_light)createVehicle[0,0,0];
				_light1 attachTo [ES_tuning_vehicle,[0,1.81159,-0.823452]];
				_light2=(_light)createVehicle[0,0,0];
				_light2 attachTo [ES_tuning_vehicle,[0,-1.42732,-0.823452]];				
			};	
		};		
	};	
};