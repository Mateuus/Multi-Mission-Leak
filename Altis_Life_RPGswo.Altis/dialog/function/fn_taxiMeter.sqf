/*
	File: fn_taxiMeter.sqf
	Author: MarkusSR1984
	
	
*/
	private ["_ui","_mode","_taxi","_prize","_dist","_count"];
	_taxi = _this select 0;
	
	//[] spawn MSR_fnc_taxiTurretAction;
	[] spawn DWEV_fnc_taxiTurretAction;
	
	disableSerialization;
	_ui = uiNameSpace getVariable "DWEV_taximeter";
	_mode = _ui displayCtrl 13001;
	_prize = _ui displayCtrl 13002;
	_dist = _ui displayCtrl 13003;
	_speed = _ui displayCtrl 13004;
	_count = 1000;
	_kost = 0;
	_maxkost = 0;
	_kost_per_kilometer = 0;
	
	DWEV_taxi_prize = 0;
	
	_money = (dwf_atmcash + dwf_cash);
	_maxkost = (_money - 2000);
	
	_mode_number = 0;
	_kost_per_kilometer = 1;
	
	if (_money <= 100000 && _money > 10000) then {_mode_number = 1;_kost_per_kilometer = 10;_maxkost = 5000;};
	if (_money <= 500000 && _money > 100000) then {_mode_number = 2;_kost_per_kilometer = 100;_maxkost = 10000;};
	if (_money > 500000) then {_mode_number = 3;_kost_per_kilometer = 1000;_maxkost = 25000;};
	
	
	
	
	_mode ctrlSetStructuredText parseText format["<t align='right'>MODE<br/>%1</t>",_mode_number];
	_prize ctrlSetStructuredText parseText format["<t align='right'>PREIS<br/>%1 €</t>",_kost];
	_dist ctrlSetStructuredText parseText format["<t align='right'>STRECKE<br/>%1 km</t>",0.0];
	_speed ctrlSetStructuredText parseText format["<t align='right'>GESCHW.<br/>%1 km/h</t>",0];
	
	while {true} do
		{
			sleep 0.25;
			_strecke = _taxi getVariable["strecke",0];
			
			if (_kost <= _maxkost) then 
				{
					_kost =  ((round (_strecke / 100)) /10) * _kost_per_kilometer;
				}
			else
				{
					_kost = _maxkost;
					_mode_number = 0;
				};
			
			DWEV_taxi_prize = _kost;
			
			
			_mode ctrlSetStructuredText parseText format["<t align='right'>MODE<br/>%1</t>",_mode_number];
			_prize ctrlSetStructuredText parseText format["<t align='right'>PREIS<br/>%1 € </t>",_kost];			
			_dist ctrlSetStructuredText parseText format["<t align='right'>STRECKE<br/>%1 km</t>",((round (_strecke / 100)) /10)];
			_speed ctrlSetStructuredText parseText format["<t align='right'>GESCHW.<br/>%1 km/h</t>",round (speed vehicle player)];
	
			if (_taxi getVariable["stopped",false]) exitWith
				{
					waitUntil {sleep 0.25;!(_taxi == vehicle player)};
					MSR_Taximeter_Layer cutText ["","PLAIN"];
					_DWEV_deposit = 0;
					_bank_deposit = 0;
					
					
					if ( _kost < dwf_cash ) then 
						{
							dwf_cash = dwf_cash - _kost;
							_DWEV_deposit = _kost;
						}
					else
						{
							_DWEV_deposit = dwf_cash;
							dwf_cash = 0;
							
							_bank_deposit = _kost - _DWEV_deposit;
							dwf_atmcash = dwf_atmcash - _bank_deposit;
							
							
						};
					
					hint format["INFORMATION\n\nDie Kosten für deine Taxifahrt beliefen sich auf: %1 €\nDu hattest %2 € dabei\nDer Rest von %3 € wurde per Lastschrift von deinem Konto eingezogen",_kost,_DWEV_deposit,_bank_deposit];
					
				
				};
			
		};
			
