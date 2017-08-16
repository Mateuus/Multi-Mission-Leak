/*
	File: fn_handleDowned.sqf
	Author: Skalicon
	
	Description: Downed state for rubber bullets
*/
private["_obj","_inVehicle","_time","_downed","_hndlBlur","_hndlBlack","_eff1","_eff2","_effects","_unit"];
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if (!life_isdowned) then {
	//[[48, player, format["%1 was downed", name player]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	life_isdowned = true;
	disableUserInput true;
	_inVehicle = false;
	if (vehicle player == player) then {
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
		_obj setPosATL (getPosATL player);
		player attachTo [_obj,[0,0,0.5]];
		[[player,"AcinPercMstpSnonWnonDnon_agony"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		hint format ["You just got knocked the fuck out! Tab to escape!"];
		_inVehicle = false;
	} else {
		_inVehicle = true;
	};

	_hndlBlur = ppEffectCreate ["DynamicBlur", 200];
	_hndlBlur ppEffectEnable true;
	_hndlBlur ppEffectAdjust [5];
	_hndlBlur ppEffectCommit 0;

	_hndlBlack = ppEffectCreate ["colorCorrections", 1000];
	_hndlBlack ppEffectEnable true;
	_hndlBlack ppEffectAdjust [1.0, 1.0, 0.0, [0, 0, 0, 0.9], [1.0, 1.0, 1.0, 1.0],[1.0, 1.0, 1.0, 0.0]];
	_hndlBlack ppEffectCommit 0;
	_effects = true;
	_eff1 = 5;
	_eff2 = 0.9;
	_time = 0;
	_downed = true;

	while {_downed} do {
		if (!(player getVariable ["restrained",false])) then{
			if (!(_inVehicle)) then{
				if (_time == 5) then {[[player,"AinjPpneMstpSnonWrflDnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;};
				if (_time == 5) then {
					[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
					_downed = false;
				};
			} else {
				if (_time == 5) then {_downed = false;};
			};

		} else {
			_downed = false;
		};
		_time = _time + 1; 
		sleep 1;
	};
	
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
	if(vehicle _unit != _unit) exitWith{};
	
	if (_unit getVariable ["playerSurrender",false])
	then
	{
		_unit switchMove "AmovPercMstpSnonWnonDnon";
		_unit playMoveNow "AmovPercMstpSnonWnonDnon";
		_unit setVariable["playerSurrender",nil,true];
	}
	else
	{
		_unit playMoveNow"CutSceneAnimationBaseZoZo";
		_unit switchMove "TestSurrender";
		_unit setVariable["playerSurrender",true,true];
	};
	sleep 1;
	disableUserInput false;
	if (!(_inVehicle)) then{
		detach player;
		deleteVehicle _obj;
	};
	life_isdowned = false;
};



