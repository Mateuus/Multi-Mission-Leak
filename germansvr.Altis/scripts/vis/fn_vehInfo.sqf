/*
	File: fn_vehInfo.sqf
	Author: Leon "DerL30N" Beeser
	
	Description:
	Measures, stores and calculates with the help of mathematics: Fuel consumption, range, tank volume and speedometer
*/
if ((vehicle player != player) && (driver (vehicle player) == player) && ((vehicle player isKindOf "Car") OR (vehicle player isKindOf "Air") OR (vehicle player isKindOf "Ship"))) then { 

	if(!isServer) then {
		private["_uiIsSet"];

		lb_updateTimes = 5;
		_uiIsSet = false;
		
		while {true} do {
			if ((vehicle player != player) && (driver (vehicle player) == player) && ((vehicle player isKindOf "Car") OR (vehicle player isKindOf "Air") OR (vehicle player isKindOf "Ship"))) then { 
				if(!_uiIsSet) then {
					disableSerialization;
					_ok = cutRsc["vehInfo","PLAIN"];
					_uiIsSet = true;
				};
		
				private["_veh","_vehname","_class","_zeitdermessung","_maxSpeed","_fuelCap","_n","_kmh","_vehId","_fuelMax","_fuelVirtualMax"];
		
				_veh = vehicle player;
				_vehname = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");
				_class = typeOf (_veh);
		
				///////////////////////////////////////////////////
		
				//Setting up vehicle identifikation system

				_vehId = _veh getVariable "lb_vehId";
		
				if(isNil "_vehId") then {
			
					private["_lb_maxVehId"];
			
					if(isNil "lb_maxVehId") then {
						lb_maxVehId = 0;
					};
			
					_vehId = lb_maxVehId + 1;
					lb_maxVehId = _vehId;
			
					publicVariable "lb_maxVehId";
					_veh setVariable ["lb_vehId", _vehId, true];
			
				};
		
				///////////////////////////////////////////////////
		
				_zeitdermessung = 1;
				_n = 1;
		
				_fuelCap = getNumber(configFile >> "CfgVehicles" >> _class >> "fuelCapacity");
		
				///////////////////////////////////////////////////
		
				//Setting up a virtual maximum of fuel tank
		
				_fuelVirtualMax = _veh getVariable "lb_fuelVirtualMax";
				_fuelMax = (fuel _veh);
		
				if(isNil "_fuelVirtualMax") then {
					_fuelVirtualMax = _fuelCap * _fuelMax;
					_veh setVariable ["lb_fuelVirtualMax", _fuelVirtualMax, true];
				};
				_b = _fuelCap * _fuelMax;
				if(_b > _fuelVirtualMax) then {
					_veh engineOn false;
					_fuelVirtualMax = _b;
					_veh setVariable ["lb_fuelVirtualMax", _fuelVirtualMax, true];
				};
		
				///////////////////////////////////////////////////
		
				if ((_veh != player) && (isEngineOn _veh) && (driver _veh == player)) then {
			
					private["_treibstoff1","_position1"];
			
					_treibstoff1 = (fuel _veh);
					_position1 = getPosATL _veh;
			
					sleep _zeitdermessung;
			
					if ((_veh != player) && (isEngineOn _veh) && (driver _veh == player)) then {
				
						private["_treibstoff2","_position2","_zrglDistanz","_fuelInLiterNOW1","_fuelInLiterNOW2","_fuelUseNOW","_average","_average2","_reichweite","_100messungenCount","_100average","_100gesAverage"];
				
						_treibstoff2 = (fuel _veh);
						_position2 = getPosATL _veh;
				
						_zrglDistanz = (_position1 vectorDistance _position2);//Distanznahme (m)
				
						_fuelInLiterNOW1 = _fuelVirtualMax * _treibstoff1;
						_fuelInLiterNOW2 = _fuelVirtualMax * _treibstoff2;
						_fuelInLiterNOW2real = _fuelCap * _treibstoff2;
						_fuelUseNOW = _fuelInLiterNOW1 - _fuelInLiterNOW2;//aktueller Treibstoff fluss (l)

						if(_fuelUseNOW > 0) then {
				
							private["_gesZrglDistanzKm","_zrglDistanzKmFuel","_zrglDistanzKm","_i","_idiff"];
				
							_gesZrglDistanzKm = _veh getVariable "lb_distanz";
							_zrglDistanzKmFuel = _veh getVariable "lb_distanzFuel";
			
							if(isNil "_gesZrglDistanzKm") then {
								_gesZrglDistanzKm = 0;
							};
					
							if(isNil "_zrglDistanzKmFuel") then {
								_zrglDistanzKmFuel = 0;
							};
			
							_kmh = _zrglDistanz * 3.6;
							_zrglDistanzKm = _zrglDistanz / 1000;//m zu km
							_idiff = _veh getVariable "lb_tankvolumenl";
							_i = _fuelVirtualMax - _fuelInLiterNOW2;//Differenz zwischen aktuellem Tank- und maximalem Tankstand
					
							if(isNil "_idiff") then {
								_idiff = _fuelVirtualMax - _fuelInLiterNOW2;
							};
					
							if(_i < _idiff) then {
								_zrglDistanzKmFuel = _zrglDistanzKm;
							};
					
							_veh setVariable ["lb_tankvolumenl", _i, true];
							_gesZrglDistanzKm = _gesZrglDistanzKm + _zrglDistanzKm;//Summe gefahrene km
							_zrglDistanzKmFuel = _zrglDistanzKmFuel + _zrglDistanzKm;//Summe gefahrene km seit letztem Tanken
					
							_fuelInLiterNOW2 = round (100 * (_fuelInLiterNOW2real / _fuelCap));//Daten für Tankanzeige in %
			
							_veh setVariable ["lb_distanz", _gesZrglDistanzKm, true];
							_veh setVariable ["lb_distanzFuel", _zrglDistanzKmFuel, true];
			
							if((_gesZrglDistanzKm == 0) OR (_kmh < 3.6) OR (_i < 0.001) OR (_gesZrglDistanzKm < 0.1) OR (_zrglDistanzKmFuel < 0.1)) then {
					
								_average = _veh getVariable "lb_durchschnitt";
								_average2 = _veh getVariable "lb_100_average2";
						
								if((isNil "_average") OR (isNil "_average2")) then {
						
									_average = "---";
									_reichweite = "---";
						
								} else {
						
									_danzahln = _veh getVariable "lb_anzahlMessungenBisFrei";
									_reichweite = _veh getVariable "lb_100_endurance";
								
									if((isNil "_danzahln") OR (isNil "_reichweite")) then {
									
										_average = "---";
										_reichweite = "---";
									
									} else {
									
										if(_danzahln == 100) then {
								
											_x = _average2 / 100;
											_average = round (_average * (10 ^ _n)) / (10 ^ _n);
									
										} else {
								
											_average = "---";
											_reichweite = "---";
									
										};
									};
								};
						
								_gesZrglDistanzKm = round (_gesZrglDistanzKm * (10 ^ _n)) / (10 ^ _n);
						
							} else {
					
								_average = (_i * 100) / _zrglDistanzKmFuel;// liter * 100 / distanz (km) => Ø
						
								_average = round (_average * (10 ^ 5)) / (10 ^ 5);
								_100average = _average;//New

								_veh setVariable ["lb_durchschnitt", _average, true];
						
								///////////////////////////////////
						
								//Controlling fuel use
						
								_danzahl = _veh getVariable "lb_durchschnittAnzahl";
						
								if(isNil "_danzahl") then {
									_danzahl = 0;
								};
						
								if(_danzahl == 200) then {
									_danzahl = 0;
								};
						
								_danzahl = _danzahl + 1;
						
								_veh setVariable ["lb_durchschnittAnzahl", _danzahl, true];
								_veh setVariable [format ["lb_durchschnittSumme[%1]", _danzahl], _average, true];
						
								_dGesSumme = 0;
								_z = _danzahl;
						
								while { _z > 0 } do {
						
									_dsumme = _veh getVariable format ["lb_durchschnittSumme[%1]", _z];
							
									if(isNil "_dsumme") then {
										_dsumme = 0;
									};
							
									_dGesSumme = _dGesSumme + _dsumme;
									_z = _z - 1;
							
								};
						
								_average = _dGesSumme / _danzahl;
						
								_veh setVariable ["lb_durchschnitt", _average, true];
						
								///////////////////////////////////
								///////////////////////////////////
						
								//Controling endurance
						
								_100messungenCount = _veh getVariable "lb_100_messungenCount";
						
								if(isNil "_100messungenCount") then {
									_100messungenCount = 0;
								};
						
								if(_100messungenCount == 25) then {
									_100messungenCount = 0;
								};
						
								_100messungenCount = _100messungenCount + 1;
						
								_veh setVariable ["lb_100_messungenCount", _100messungenCount, true];
								_veh setVariable [format ["lb_100_average[%1]", _100messungenCount], _100average, true];
						
								_100gesAverage = 0;
								_z = _100messungenCount;
						
								while { _z > 0 } do {
						
									_100average = _veh getVariable format ["lb_100_average[%1]", _z];
							
									if(isNil "_100average") then {
										_100average = 0;
									};
							
									_100gesAverage = _100gesAverage + _100average;
							
									_z = _z - 1;
							
								};
						
								_100average = _100gesAverage / _100messungenCount;
								_100_x = _100average / 100;
						
								if(lb_updateTimes == 5) then {
						
									_reichweite = round (_fuelVirtualMax / _100_x);// Kapazität (l) / durch das ergebiss von durchschnittsverbrauch / 100 => km
									_veh setVariable ["lb_100_endurance", _reichweite, true];
									lb_updateTimes = -1;
							
								};
								lb_updateTimes = lb_updateTimes + 1;
						
								_veh setVariable ["lb_100_average2", _100average, true];
						
								_reichweite = _veh getVariable "lb_100_endurance";
						
								if(isNil "_reichweite") then {
									_reichweite = "---";
								};
						
								///////////////////////////////////
						
								_gesZrglDistanzKm = round (_gesZrglDistanzKm * (10 ^ _n)) / (10 ^ _n);
								_average = round (_average * (10 ^ _n)) / (10 ^ _n);
						
								_danzahln = _veh getVariable "lb_anzahlMessungenBisFrei";
						
								if(isNil "_danzahln") then {
									_danzahln = 0;
								};
						
								if(_danzahln < 100) then {
									_danzahln = _danzahln + 1;
									_average = "---";
									_reichweite = "---";
									_veh setVariable ["lb_anzahlMessungenBisFrei", _danzahln, true];
								};
						
							};
					
							switch (true) do {
								case 0 : {((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["000000.0 km"];};
								case ((_gesZrglDistanzKm > 0) && (_gesZrglDistanzKm < 10)) : {((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["00000%1 km",_gesZrglDistanzKm];};
								case ((_gesZrglDistanzKm >= 10) && (_gesZrglDistanzKm < 100)) : {((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["0000%1 km",_gesZrglDistanzKm];};
								case ((_gesZrglDistanzKm >= 100) && (_gesZrglDistanzKm < 1000)) : {((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["000%1 km",_gesZrglDistanzKm];};
								case ((_gesZrglDistanzKm >= 1000) && (_gesZrglDistanzKm < 10000)) : {((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["00%1 km",_gesZrglDistanzKm];};
								case ((_gesZrglDistanzKm >= 10000) && (_gesZrglDistanzKm < 100000)) : {((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["0%1 km",_gesZrglDistanzKm];};
								case (_gesZrglDistanzKm >= 100000) : {((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["%1 km",_gesZrglDistanzKm];};
							};
						
							_p = "%";
							((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1", _vehname];
							((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["%1 km", _reichweite];
							((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["%1 l/100km", _average];
							((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["%1 %2", _fuelInLiterNOW2,_p];
					
						} else {
				
							_veh engineOn false;
					
						};
				
					};
			
				} else {
		
					((uiNamespace getVariable "vehInfo")displayCtrl 1100)ctrlSetText format["%1", _vehname];
					((uiNamespace getVariable "vehInfo")displayCtrl 1000)ctrlSetText format["0 km"];
					((uiNamespace getVariable "vehInfo")displayCtrl 1001)ctrlSetText format["0 l/100km"];
					((uiNamespace getVariable "vehInfo")displayCtrl 1101)ctrlSetText format["0 %"];
					((uiNamespace getVariable "vehInfo")displayCtrl 1003)ctrlSetText format["000000.0 km"];
				};
		
			} else {
		
				if(_uiIsSet) then {
					cutRsc ["Default","PLAIN"];
					_uiIsSet = false;
				};
			};
		};
	};
};

sleep 0.5;
[] call life_fnc_vehInfo;