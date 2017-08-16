/*-----------------------------------------------------------------------------

       Author: G00golplexian
       Name: fn_salzgather.sqf
       Description: Salz.

------------------------------------------------------------------------------*/
disableSerialization;

_modeArray = _this select 3;
_mode = _modeArray select 0;

switch(_mode) do {

	case 0: {
	if(life_action_inUse) exitWith {hint "Das Förderband wurde bereits gestartet."};
		life_action_inUse = true;

		salz_ort_1 say3D "Device_disassembled_loop";
		salz_ort_2 say3D "Device_disassembled_loop";

		_sleep = 0.25;
		_cP = 0.01;
		_upp = "Salz wird gefördert...";

		_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;life_action_inUse = false;};
		if(life_process_bad) exitWith {life_process_bad = false;life_action_inUse = false;};

		titleText ["Begib dich nun zur Abfüllanlage um die Ecke.","PLAIN"];
		life_salzactive = true;
		life_action_inUse = false;
	};

	case 1: {
		if(!life_salzactive) exitWith {hint "Du hast das Salz noch nicht gefördert! Gehe zum Förderband und starte es."};
		
		_pos = switch(_modeArray select 1) do {
			case "links_1": {abfuell_links_1};
			case "rechts_1": {abfuell_rechts_1};
			case "links_2": {abfuell_links_2};
			case "rechts_2": {abfuell_rechts_2};
			case "links_3": {abfuell_links_3};
			case "rechts_3": {abfuell_rechts_3};
		};

		_vehicle = nearestObjects[getpos _pos,["Car","Air"],20] select 0;

		if(isNil "_vehicle") exitWith {hint "Es steht kein Fahrzeug unter der Abfüllanlage!"};
		if(isnull _vehicle) exitWith {hint "Das Fahrzeug ist nicht registriert."};
		if(!alive _vehicle) exitWith {hint "Das Fahrzeug ist kaputt"};
		if!(_vehicle in life_vehicles) exitWith {hint "Das Fahrzeug unter der Anlage gehört nicht dir!"};

		life_salzactive = false;
		_vehicle say3D "tanken";

		_sleep = 0.25;
		_cP = 0.01;
		_upp = "Fahrzeug wird befüllt...";

		_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
		if(life_process_bad) exitWith {life_process_bad = false;};
		
		_item = "salt"; 
		_vInv = _vehicle getVariable ["Trunk",[[],0]];   
		_items = _vInv select 0;  
		_space = _vInv select 1;   
		_itemIndex = [_item,_items] call SOA_fnc_index;
		_weight = [_vehicle] call life_fnc_vehicleWeight;
		_sum = [_item,([35,40] call life_fnc_randomRound),_weight select 1,_weight select 0] call life_fnc_calWeightDiff;  
		if(_sum < 1) exitWith {titleText[localize "STR_NOTF_DeviceFull","PLAIN"];};   
		_itemWeight = ([_item] call life_fnc_itemWeight) * _sum;   
		if(_itemIndex == -1) then {
			_items pushBack [_item,_sum];  
		} else {   
			 _val = _items select _itemIndex select 1;    
			 _items set[_itemIndex,[_item,_val + _sum]];   
		};
		_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];

		_exp = 600;
		_level = 4;

		if(life_level < _level) then {_exp = (_exp/2)};
		life_exp = life_exp + round(random(_exp));
		[] spawn life_fnc_exptolevel;
	};
};