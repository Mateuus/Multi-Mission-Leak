/*
	File: fn_handleVehDamage.sqf
	Autor: MarkusSR1984
	
	Description: Verarbeitet den Schaden von Fahrzeugen, Verhindert Schaden am Tank und Reduziert den Kollisionsschaden
		
*/
_vehicle = param [0,ObjNull,[ObjNull]];
_selection = _this select 1;
_damage_handle = _this select 2;
_source = _this select 3;
_ammo = _this select 4;
_scale = 1;
if (_vehicle == ObjNull) exitwith {};
if !(alive _vehicle) exitWith {};
 
//hint format["HANDLE DAMAGE\nVEHICLE: %1 \nSELECTION: %2 \nDAMAGE: %3 \n AMMO: %4",_vehicle,_selection,_damage_handle,_ammo];
 
 
 if (_selection != "?" && _selection != "") then
{
	_oldDamage = if (_selection == "") then { damage _vehicle } else { _vehicle getHit _selection };

	if (!isNil "_oldDamage") then
	{
		

		if ((_selection == "fuel_hit" || _selection == "palivo") &&  vehicleAntiExplode) then
		{
			_damage_handle = 0; // Keinen Schaden am Tank zulassen
		}
		else
		{
			if (_ammo == "" && vehicleDamageHandler) then // Reduce collision damage
			{
				 switch (true) do
				{
					case (_selection select [0,5] == "wheel"): { _scale = 0.2; };
					default                                    { _scale = 0.5; };
				};

				_damage_handle = ((_damage_handle - _oldDamage) * _scale) + _oldDamage;
			};
		};
 
	};

}
else
{
_damage_handle = 0;

};	
/*		// Speichersystem vorübergehend deaktiviert um die Performanceänderung zu beobachten	
_this spawn   // Speichersystem
	{		
		_vehicle = param [0,ObjNull,[ObjNull]];

		if (_vehicle == ObjNull) exitwith {};
		if !(alive _vehicle) exitWith {};
		sleep (random(1));
		if (_vehicle getVariable["DWEV_handle_damage",false]) exitWith {}; // Nur eine Instanz ausführen auch wenn der EH mehrfach anspricht
		_vehicle setVariable["DWEV_handle_damage",true,false];
		sleep 1;
		
		
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
	
			
			[[_vehicle, _HitPointSave,_damage],"DB_fnc_saveVehDamage",false,false] spawn DWEV_OLD_fnc_MP;
			
			_vehicle setVariable["DWEV_handle_damage",false,false];
						
	};
*/			
//systemChat format["DAMAGE RETURN %1",_damage_handle];			
_damage_handle; // Rückgabewert			