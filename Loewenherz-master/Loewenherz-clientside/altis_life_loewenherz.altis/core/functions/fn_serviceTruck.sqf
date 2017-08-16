/*
	File: fn_serviceTruck.sqf
	Author: Blackd0g
	
	Description:
	repair function for the service truck
*/

private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_dir"];
			
_vehicle = cursorTarget;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorTarget > 16) exitWith {};
if(lhm_action_inUse) exitWith {};
if (damage _vehicle == 0) exitWith {Hint "Dieses Fahrzeug braucht keine Reparatur!"};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{

	
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

	lhm_action_inUse = true;
	
	_upp = "Servicing";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["lhm_progress","PLAIN"];
	_ui = uiNameSpace getVariable "lhm_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
		
	while{true} do
	{

		sleep 0.5;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 %4 (%1%2)...",round(_cP * 100),"%",_upp,_vehicleName];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 8) exitWith {Hint "Du bist zuweit vom Fahrzeug entfernt!"};
		//if(speed player > 0) exitWith {Hint "Don't move while you are repairing a vehicle!"};
		if(!alive player) exitWith {};

		//_getDamage =  getDammage _vehicle;
		//_getDamage = _getDamage - 0.010;
		//_vehicle setDamage _getDamage;
	};
	5 cutText ["","PLAIN"];

	if(player distance _vehicle > 8) exitWith {hint "Du bist zuweit vom Fahrzeug entfernt!"; lhm_action_inUse = false;};
	if(!alive player) exitWith {lhm_action_inUse = false;};
	//_time = _vehicle getVariable "time";
	//if(isNil {_time}) exitWith {deleteVehicle _vehicle; hint "This vehicle was hacked in"};
	//if((time - _time)  < 120) exitWith {hint "This is a freshly spawned vehicle, you have no right impounding it."};
	if((count crew _vehicle) == 0) then
	{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {lhm_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = 0;};
			case (_vehicle isKindOf "Ship"): {_price = 0;};
			case (_vehicle isKindOf "Air"): {_price = 0;};
		};
		
		[[_vehicle,"repair"],"lhm_fnc_say3D",nil,false] call lhm_fnc_mp;
		
		_fuel = fuel _vehicle;
		_fuel = _fuel + 0.10;
		_vehicle setFuel _fuel; // adds some gas
		_vehicle setDamage 0; // Fully repaired
		
		hint format["Du hast ein %1\n\n repariert. Ersatzteilkosten belaufen sich auf %2$!",_type,_price];
		[[0,format["%1 hat %2's %3 repariert!",name player,(_vehicleData select 0) select 1,_vehicleName]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
		//lhm_atmcash = lhm_atmcash - _price;
	}
		else
	{
		hint "Fahrzeug-Service abgebrochen.\nIm Fahrzeug darf keiner sitzen!";
	};
};
lhm_action_inUse = false;
