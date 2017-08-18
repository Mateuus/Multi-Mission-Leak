/*
	File: fn_handleDowned.sqf
	Author: Kai
*/
private["_obj","_inVehicle","_time","_downed","_hndlBlur","_hndlBlack","_eff1","_eff2","_effects","_dead","_source"];
player setDamage 0;
if (!life_isdowned) then {
	_source = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
	//[[format["%1 has been downed by %2.",name player, name _source]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	[[0,format["%1 has been downed by %2.",name player, name _source]],"life_fnc_broadcast",true,false] call life_fnc_MP; //testing
	life_isdowned = true;
	player setVariable["downed",true,true];
	player setVariable["receiveFirstAid",false,false];
	disableUserInput true;
	_inVehicle = false;
	if (vehicle player == player) then {
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
		_obj setPosATL (getPosATL player);
		player attachTo [_obj,[0,0,0]];
		[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] call life_fnc_MP;
		_inVehicle = false;
	} else {
		_inVehicle = true;
	};

	_hndlBlur = ppEffectCreate ["DynamicBlur", 501];
	_hndlBlur ppEffectEnable true;
	_hndlBlur ppEffectAdjust [5];
	_hndlBlur ppEffectCommit 0;

	_hndlBlack = ppEffectCreate ["colorCorrections", 1501];
	_hndlBlack ppEffectEnable true;
	_hndlBlack ppEffectAdjust [1.0, 1.0, 0.0, [0, 0, 0, 0.9], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
	_hndlBlack ppEffectCommit 0;
	_effects = true;
	_eff1 = 5;
	_eff2 = 0.9;
	_time = 0;
	_downed = true;
	_dead = false;
	disableUserInput true;
	while {_downed} do {
		if (player getVariable["receiveFirstAid",false]) exitWith {_downed = false;player setVariable["receiveFirstAid",nil,true];[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] call life_fnc_MP;};
		if (alive player) then {
			if (!(player getVariable ["restrained",false])) then{
				if (!(_inVehicle)) then{
					if (_time == 8) then {[[player,"AinjPpneMstpSnonWrflDnon"],"life_fnc_animSync",true,false] call life_fnc_MP;};
					if (_time == 30) then {  //testing
						[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] call life_fnc_MP;
						_downed = false;
					};
				} else {
					if (vehicle player == player) then {
						_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
						_obj setPosATL (getPosATL player);
						player attachTo [_obj,[0,0,0]];
						[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] call life_fnc_MP;
						_time = 0;
						_inVehicle = false;
					};
					if (_time == 30) then {_downed = false;}; //testing
				};

			} else {
				_downed = false;
			};
		} else {
			_downed = false;
			_dead = true;
		};
		_time = _time + 1; 
		sleep 1;
	};
	disableUserInput false;
	[_hndlBlur,_hndlBlack,_eff1,_eff2,_effects] spawn {
		_hndlBlur = _this select 0;
		_hndlBlack = _this select 1;
		_eff1 = _this select 2;
		_eff2 = _this select 3;
		_effects = _this select 4;
		while {_effects} do {
			_eff1 = _eff1 - 0.025;
			_eff2 = _eff2 - 0.0045;

			_hndlBlur ppEffectAdjust [_eff1];
			_hndlBlur ppEffectCommit 0;
			
			_hndlBlack ppEffectAdjust [1.0, 1.0, 0.0, [0, 0, 0, _eff2], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
			_hndlBlack ppEffectCommit 0;

			sleep 0.01;
			if (_eff2 <= 0) then {_effects = false;};
		};
		ppEffectDestroy _hndlBlur;
		ppEffectDestroy _hndlBlack;
	};
	if (!(_inVehicle)) then{
		detach player;
		deleteVehicle _obj;
	};
	life_isdowned = false;
	player setVariable["downed",false,true];
	if (!(_dead)) then {
		player setDamage 0.9;
	};
	disableUserInput false;
	sleep 1;
	disableUserInput false;
};



