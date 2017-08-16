/*
fn_reGear.sqf
Kevin Webb
Allows police to quick-purchase their last loadout.
*/
[] spawn {
	if(playerSide == west && !life_activeSwat) then {
		_array = (["police_weapons"] call life_fnc_weaponShopCfg) select 1;
		_index = [life_dead_gear select 0,_array] call life_fnc_index;
		if(_index == -1) exitWith {};
		_price = (_array select _index) select 2;
		{
			_array = (_x select 0);
			{
				for "_i" from 0 to (count _x - 1) do {
					_index = [_x select _i,_array] call life_fnc_index;
					if(_index != -1) then {
						_price = _price + ((_array select _index) select 2);
					};
				};
			} forEach [_x select 1];
		} forEach [
			[(["police_weapons"] call life_fnc_weaponAddons), [life_dead_gear select 8,life_dead_gear select 11,life_dead_gear select 12,life_dead_gear select 13]],
			[([0] call life_fnc_clothing_cop), [life_dead_gear select 4]],
			[([1] call life_fnc_clothing_cop), [life_dead_gear select 14]],
			[([3] call life_fnc_clothing_cop), [life_dead_gear select 5]]
		];

		if ((life_configuration select 3) > 0) then
		{
			_price = round (_price + (_price * ((life_configuration select 3) / 100)));
		};

		_action = [format["Do you wish to purchase your old loadout which you had before your death for a price of $%1?",[_price] call life_fnc_numberText],"Rebuy Gear?","Yes","No"] call BIS_fnc_GUIMessage;
		if(_action) then {
			if(life_atmmoney < _price) exitWith {hint "You didn't have enough in your bank account to pay for your gear."};
			hint "Now acquiring your loadout. Do not go further than 10 meters or get in a vehicle, else this process will fail.";
			disableSerialization;
			5 cutRsc ["life_progress","PLAIN"];
			_ui = uiNameSpace getVariable "life_progress";
			_progress = _ui displayCtrl 38201;
			_pgText = _ui displayCtrl 38202;
			_pgText ctrlSetText "Regearing, please wait.";
			_progress progressSetPosition 0.01;
			_cP = 0.01;
			_success = false;
			_startPos = getPos player;
			life_action_in_use = true;
			while{true} do {
				sleep 0.15;
				_cP = _cP + 0.01;
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format["Regearing, please wait (%1%2)",round(_cP * 100),"%"];
				if(_cP >= 1) exitWith {_success = true};
				if(player distance _startPos > 10 || vehicle player != player) exitWith {};
			};
			life_action_in_use = false;
			5 cutText ["","PLAIN"];
			if(!_success) exitWith {hint "The regearing process has failed."};
			["atm","take",_price] call life_fnc_Uc;
			[life_dead_gear] spawn life_fnc_loadDeadGear;
			hint "You have been outfitted with all of your old gear.";
		};
	};
};
