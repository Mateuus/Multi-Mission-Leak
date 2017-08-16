/*
	File: fn_handleVehRepair.sqf
	Autor: MarkusSR1984
	
	Description: Verarbeitet die Reperatur eines Fahrzeuges
		
*/
		_vehicle = param [0,ObjNull,[ObjNull]];

		if (_vehicle == ObjNull) exitwith {};
		if !(alive _vehicle) exitWith {};
		if (_vehicle getVariable["DWEV_handle_damage",false]) exitWith {}; // Nur eine Instanz ausführen auch wenn der EH mehrfach anspricht
		_vehicle setVariable["DWEV_handle_damage",true,true];
		sleep 1;
		_vehicle setVariable["DWEV_handle_damage",false,true];
		
		_pid = (_vehicle getVariable "dbInfo") select 0;
		_plate = (_vehicle getVariable "dbInfo") select 1;
		_hitPoints = [_vehicle] call DWEV_fnc_getHitPoints;
		_HitPointSave = [];
		_type = typeOf _vehicle;
		_hitPointDamage = 0;
		_damage = (round ((damage _vehicle) * 100));
		
			{
					_hitPoint = configName _x;

				if (_hitPoint == "HitFuel") then // Keinen Schaden am Tank zulassen
				{
					_hitPointDamage = 0;
					_vehicle setHitPointDamage["HitFuel",0];
				}
				else
				{
					_hitPointDamage = _vehicle getHitPointDamage _hitPoint;
					_hitPointDamage = _hitPointDamage * 100;
					_hitPointDamage = round _hitPointDamage;
				};
				
				_saveHit = [_hitPoint,_hitPointDamage];
				
				
				_HitPointSave pushback _saveHit;
				true;
					
			} count _hitPoints; // Count ist schneller als foreach
	
			// Schadesspeicherung ist aus Performanegründen deaktiviert
			//[[_vehicle, _HitPointSave,_damage],"DB_fnc_saveVehDamage",false,false] spawn DWEV_OLD_fnc_MP;
			