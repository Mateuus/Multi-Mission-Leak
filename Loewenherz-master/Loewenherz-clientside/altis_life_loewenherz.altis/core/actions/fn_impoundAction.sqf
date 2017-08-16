/*
	File: fn_impoundAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Impounds the vehicle
*/
private["_vehicle","_type","_time","_price","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_ropes","_addExpAmount","_valBon","_cpUp","_m","_m1"];
_vehicle = cursorObject;
//SkillSystem
_addExpAmount = 0;
_expMulti = 6;
_valBon = 0;
_time = 0.5; _cpUp = 0.009;_m = 0.05;_m1 = 0.1;
//SkillSystem
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {};
if(player distance cursorObject > 10) exitWith {};
if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	_vehicleData = _vehicle getVariable["vehicle_info_owners",[]];
	if(count _vehicleData == 0) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
	_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	[[0,"STR_NOTF_BeingImpounded",true,[(_vehicleData select 0) select 1,_vehicleName]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
	lhm_action_inUse = true;
	//SkillSystem
	_data = missionNamespace getVariable "Impound_Prof";
    switch ( _data select 0 ) do
    {
            case 0: { _time = 0.5; _cpUp = 0.01;_m = 0.05;_m1 = 0.1;};
            case 1: { _time = 0.4; _cpUp = 0.01;_m = 0.08;_m1 = 0.11;};
            case 2: { _time = 0.35; _cpUp = 0.01;_m = 0.1;_m1 = 0.12;};
            case 3: { _time = 0.3; _cpUp = 0.01;_m = 0.15;_m1 = 0.13;};
            case 4: { _time = 0.25; _cpUp = 0.01;_m = 0.17;_m1 = 0.14;};
            case 5: { _time = 0.2; _cpUp = 0.01;_m = 0.20;_m1 = 0.15;};
            case 6: { _time = 0.2; _cpUp = 0.02;_m = 0.22;_m1 = 0.16;};
            case 7: { _time = 0.2; _cpUp = 0.03;_m = 0.25;_m1 = 0.17;};
            case 8: { _time = 0.2; _cpUp = 0.04;_m = 0.28;_m1 = 0.18;};
            case 9: { _time = 0.15; _cpUp = 0.05;_m = 0.30;_m1 = 0.19;};
            case 10: { _time = 0.1; _cpUp = 0.07;_m = 0.33;_m1 = 0.20;};
            case 11: { _time = 0.1; _cpUp = 0.08;_m = 0.36;_m1 = 0.21;};
            case 12: { _time = 0.1; _cpUp = 0.09;_m = 0.4;_m1 = 0.22;};
            case 13: { _time = 0.09; _cpUp = 0.09;_m = 0.44;_m1 = 0.23;};
            case 14: { _time = 0.09; _cpUp = 0.09;_m = 0.46;_m1 = 0.24;};
            case 15: { _time = 0.09; _cpUp = 0.10;_m = 0.48;_m1 = 0.25;};
            case 16: { _time = 0.08; _cpUp = 0.11;_m = 0.50;_m1 = 0.26;};
            case 17: { _time = 0.08; _cpUp = 0.12;_m = 0.55;_m1 = 0.27;};
            case 18: { _time = 0.07; _cpUp = 0.12;_m = 0.60;_m1 = 0.28;};
            case 19: { _time = 0.06; _cpUp = 0.13;_m = 0.63;_m1 = 0.29;};
            case 20: { _time = 0.05; _cpUp = 0.14;_m = 0.65;_m1 = 0.3;};
    };
	//SkillSystem

	_upp = localize "STR_NOTF_Impounding";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["lhm_progress","PLAIN"];
	_ui = uiNameSpace getVariable "lhm_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	//SkillSystem
    _cpUp = _cpUp; // keine Ahnung welchen Sinn das haben soll ...
	//SkillSystem
    _cP = 0.04;

	For "_i" from 0 to 1 step 0 do {
		sleep _time + 0.4;
		_cP = _cP + _cpUp; //SKillSystem
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vehicle > 10) exitWith {};
		if(!alive player) exitWith {};
	};

	5 cutText ["","PLAIN"];

	if(player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_ImpoundingCancelled"; lhm_action_inUse = false;};
	if(!alive player) exitWith {lhm_action_inUse = false;};
	//_time = _vehicle getVariable "time";
	//if(isNil {_time}) exitWith {deleteVehicle _vehicle; hint "This vehicle was hacked in"};
	//if((time - _time)  < 120) exitWith {hint "This is a freshly spawned vehicle, you have no right impounding it."};

	_crewdead=true;
	{if(alive _x)then{_crewdead=false;};}foreach (crew _vehicle);
	if((count crew _vehicle) !=0 && !_crewdead) then
	{
		hint localize "STR_NOTF_ImpoundingCancelled";
	}else{
		if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship"))) exitWith {lhm_action_inUse = false;};
		_type = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
		switch (true) do
		{
			case (_vehicle isKindOf "Car"): {_price = (call lhm_impound_car);};
			case (_vehicle isKindOf "Ship"): {_price = (call lhm_impound_boat);};
			case (_vehicle isKindOf "Air"): {_price = (call lhm_impound_air);};
		};

		lhm_impound_inuse = true;
		[[_vehicle,true,player],"TON_fnc_vehicleStore",false,false] call lhm_fnc_mp;
		waitUntil {!lhm_impound_inuse};
		hint format[localize "STR_NOTF_Impounded",_type,_price];
		[[0,"STR_NOTF_HasImpounded",true,[profileName,(_vehicleData select 0) select 1,_vehicleName]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
		//lhm_atmcash = lhm_atmcash + _price;

		//SkillSystem
		_valBon = round(_price * 0.10); //35$ Lvl 1
        _addExpAmount = round(_valBon * _m * _expMulti);
        [[0,format["Du bekommst %1 XP und einen Bonus von $%2 für das Beschlagnahmen", _addExpAmount, [_valBon] call lhm_fnc_numberText]],"lhm_fnc_broadcast",player,false] spawn lhm_fnc_mp;
        ["Impound_Prof",_addExpAmount] call lhm_fnc_addExp;
        lhm_atmcash = lhm_atmcash + _price + _valBon;
		//SkillSystem
	};
	 diag_log format["Impound %1 | %2 | %3 | %4 | %5",_price,_valBon,_cP,_cpUp,_addExpAmount]; //SkillSystem Debug
};
lhm_action_inUse = false;