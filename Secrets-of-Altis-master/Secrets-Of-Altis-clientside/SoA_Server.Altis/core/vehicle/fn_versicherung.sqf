disableSerialization;
private["_display","_vehiclelist","_teilkaskotext","_vollkaskotext","_teilkaskobutton","_vollkaskobutton","_versicherungsanzeige"];

_mode = _this select 0;

switch(_mode) do {

	//Laden der Autos
	case 0: {
	
	createdialog "versicherungen";
	
	_display = finddisplay 5100;
	_vehiclelist = _display displayCtrl 5101;
	_teilkaskobutton = _display displayctrl 5104;	
	_vollkaskobutton = _display displayCtrl 5105;
	
	_vollkaskobutton ctrlEnable false;
	_teilkaskobutton ctrlEnable false;
	
	
		for "_i" from 0 to (count life_vehicles)-1 do
		{
			_veh = life_vehicles select _i;
			_price = [(typeOf _veh)] call life_fnc_versicherungspreise;

			if(!isNull _veh && alive _veh && !(_veh iskindof "House_F")) then {
				_vehiclelist lbadd format["%1 (%2m entfernt)",([typeOf _veh] call life_fnc_fetchVehInfo) select 3,round(player distance _veh)];
				_vehiclelist lbSetValue [(lbSize _vehiclelist)-1,_price];
				_vehiclelist lbSetData [(lbSize _vehiclelist)-1,str _i];
			};
		};
	};

	//Anzeige ob versichert oder nicht und Anzeige der Preise
	case 1: {
	
	_display = finddisplay 5100;
	_vehiclelist = _display displayCtrl 5101;
	_teilkaskotext = _display displayCtrl 5102;
	_vollkaskotext = _display displayCtrl 5103;
	_teilkaskobutton = _display displayctrl 5104;	
	_vollkaskobutton = _display displayCtrl 5105;
	_versicherungsanzeige = _display displayCtrl 5106;
	
	_sel = lbCurSel _vehiclelist;
	_price = _vehiclelist lbValue _sel;
	_vehicle = _vehiclelist lbData _sel;
	_vehicle = life_vehicles select parseNumber(_vehicle);

	if(_price == -1) then {_price = 0};
	
		_teilkaskotext CtrlsetStructuredText parsetext format["Die Teilkasko-Versicherung von EGO kostet dich für dieses Fahrzeug %1€. Bei Teilkasko bezahlst du nur die Hälfte der Versicherungspolice. Die Teilkasko-Versicherung beinhaltet keinen Diebstahlschutz. Im Falle einer abrupten Inselausreise verfällt die Versicherung.",[_price/2] call life_fnc_numberText];
		_vollkaskotext CtrlsetStructuredText parsetext format["Die Vollkasko-Versicherung von EGO kostet dich für dieses Fahrzeug %1€. Bei Vollkasko bezahlst du die volle Versicherungspolice und das Fahrzeug ist jederzeit gegen Schaden und Diebstahl versichert. Im Falle einer abrupten Inselausreise verfällt die Versicherung.",[_price] call life_fnc_numberText];
		
		if(_vehicle getVariable "versichert") then {
			_versicherungsanzeige CtrlSetText format["Fahrzeugversicherung: %1!",(_vehicle getvariable ["versicherung","Verfallen"])];
			_versicherungsanzeige ctrlSetTextColor [0,1,0,1];
			_vollkaskobutton ctrlEnable false;
			_teilkaskobutton ctrlEnable false;
		} else {
			_versicherungsanzeige CtrlSetText "Fahrzeug nicht versichert!";
			_versicherungsanzeige ctrlSetTextColor [1,0,0,1];
			_vollkaskobutton ctrlEnable true;
			_teilkaskobutton ctrlEnable true;
		};
	};
	
	//Versicherungsbutton
	case 2: {
		
	_display = finddisplay 5100;
	_vehiclelist = _display displayCtrl 5101;
	
	_typ = _this select 1;
	_sel = lbCurSel _vehiclelist;
	_vehicle = _vehiclelist lbData _sel;
	_vehicle = life_vehicles select parseNumber(_vehicle);
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	_owner = _vehicleData select 0;
	
	if(_owner select 0 != getplayerUID player) exitWith {hint "Du kannst keine Versicherung für ein Fahrzeug abschließen, welches nicht dir gehört!"};
	if((_vehicle getVariable "versicherung") == "Abgelaufen") exitWith {hint "Dieses Fahrzeug kann nicht mehr versichert werden, da es länger als 5 Minuten aktiv ist!"};
	if(isNil "_vehicle") exitWith {hint "Kein Fahrzeug ausgewählt!"};
	closedialog 0;
	
		switch(_typ) do {
			case "vollkasko": {
				[_typ,_vehicle] spawn {

					_typ = _this select 0;
					_vehicle = _this select 1;
					_price = [(typeOf _vehicle)] call life_fnc_versicherungspreise;
					
					if(_price == -1) exitWith {hint "Dieses Fahrzeug kann nicht versichert werden."};
					if(life_beatbankgeld < _price) exitWith {hint "Dein Bankguthaben reicht für die Vollkasko-Versicherung nicht aus."};
					
					hint format["Fahrzeug ist nun %1-versichert.",_typ];
					life_beatbankgeld = life_beatbankgeld - _price;
					_vehicle setvariable ["versicherung","Vollkasko",true];
					_vehicle setvariable ["versichert",true,true];
					[name player,_price,typeOf _vehicle,12,_vehicle getVariable ["versicherung","ERROR"]] remoteExecCall ["life_fnc_logDat",2];					
					WaitUntil{sleep 0.1; !alive _vehicle || (!alive player && _vehicle isKindof "Air")};
					[_vehicle,false,player,0,1] RemoteExec ["SOA_fnc_vehicleStore",2];
				};
			};
			
			case "teilkasko": {
				[_typ,_vehicle] spawn {
					
					_typ = _this select 0;
					_vehicle = _this select 1;
					_price = [(typeOf _vehicle)] call life_fnc_versicherungspreise;
					
					if(_price == -1) exitWith {hint "Dieses Fahrzeug kann nicht versichert werden."};
					if(life_beatbankgeld < (_price/2)) exitWith {hint "Dein Bankguthaben reicht für die Teilkasko-Versicherung nicht aus."};
				
					hint format["Fahrzeug ist nun %1-versichert.",_typ];
					life_beatbankgeld = life_beatbankgeld - (_price/2);
					_vehicle setvariable ["versicherung","Teilkasko",true];
					_vehicle setvariable ["versichert",true,true];
					[name player,(_price/2),typeOf _vehicle,12,_vehicle getVariable ["versicherung","ERROR"]] remoteExecCall ["life_fnc_logDat",2];
					WaitUntil{sleep 0.1; !alive _vehicle || (!alive player && _vehicle isKindof "Air")};
					[_vehicle,false,player,0,1] RemoteExec ["SOA_fnc_vehicleStore",2];
				};
			};
		};
	};
};