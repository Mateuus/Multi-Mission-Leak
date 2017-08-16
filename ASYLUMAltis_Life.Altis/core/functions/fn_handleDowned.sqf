/*
	File: fn_handleDowned.sqf
	Author: Skalicon & Alan with implementation of Tonic's tazed script
	
	Description: Downed state for rubber bullets
*/
private["_obj","_inVehicle","_time","_downed","_hndlBlur","_hndlBlack","_eff1","_eff2","_effects","_dead","_source","_vehSource"];
player setDamage 0;
_vehSource = false;
_source = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _source) exitWith {player allowDamage true; life_isdowned = false;};


if (!life_isdowned && alive player && isNull (findDisplay 7300) && {_source isKindOf "Man"}) then 
{	
	if(vehicle _source isKindOf "LandVehicle" && {driver (vehicle _source) == _source}) then
	{
		_vehSource = true;
		[[format["%1 has been run over by %2.",name player, name _source]],"life_fnc_localChatMessage",true,false] spawn BIS_fnc_MP;
		if(alive _source && side _source != west) then
		{
			serv_killed = [_source,"187V"];
			publicVariableServer "serv_killed";
		};
	}
	else
	{
		_name = name _source;
		[[format["%1 has been downed by %2.",name player, _name]],"life_fnc_localChatMessage",true,false] spawn BIS_fnc_MP;
	};

	if(!isNull (player getVariable ["currentlyEscorting", objNull])) then {[] call life_fnc_stopEscorting;};
	
	if(player getVariable ["Escorting",false]) then 
	{
		_escort = (player getVariable ["escorted_by",[objNull,false]]) select 0;
		[[],"life_fnc_stopEscorting",_escort,false] spawn BIS_fnc_MP;
	};

	life_isdowned = true;
	player setVariable["downed",true,true];
	player setVariable["receiveFirstAid",false,false];
	
	_curWep = currentWeapon player;
	_curMags = magazines player;
	_attach = if(!(primaryWeapon player isEqualTo "")) then {primaryWeaponItems player} else {[]};
	{player removeMagazine _x} foreach _curMags;
	player removeWeapon _curWep;
	player addWeapon _curWep;
	if(!(count _attach == 0) && !(primaryWeapon player == "")) then {
		{
			player addPrimaryWeaponItem _x;
		} foreach _attach;
	};
	
	if(!(count _curMags isEqualTo 0)) then {
		{player addMagazine _x;} foreach _curMags;
	};
	
	if (vehicle player == player) then {
		_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player); 
		_obj setPosATL ASLTOATL(visiblePositionASL player);
		//_anims = ["Acts_InjuredAngryRifle01","Acts_InjuredCoughRifle02","Acts_InjuredLookingRifle01","Acts_InjuredLookingRifle02","Acts_InjuredLookingRifle03","Acts_InjuredLookingRifle04","Acts_InjuredLookingRifle05","Acts_InjuredLyingRifle01","Acts_InjuredLyingRifle02","Acts_InjuredSpeakingRifle01","Acts_LyingWounded_loop2","Acts_LyingWounded_loop3"];
		//_anim = _anims call BIS_fnc_selectRandom;
		[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;
		player attachTo [_obj,[0,0,0]];
		player setVariable["downedObj",_obj,true];
		_inVehicle = false;
	} else {
		if ((speed (vehicle player)) < 1) then {player action ["Eject",vehicle player]};
		_inVehicle = true;
	};
	
	disableUserInput true;
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

	
	while {_downed} do {
		if (player getVariable["receiveFirstAid",false]) exitWith {_downed = false;player setVariable["receiveFirstAid",nil,true];};
		if(vehicle player == player) then {_inVehicle = false} else {_inVehicle = true};
		if (alive player) then 
		{
			if (!(_inVehicle)) then 
			{
				if (_time == 8) then {[[player,"AinjPpneMstpSnonWnonDnon","playNow"],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;};
				if((isNull (attachedTo player)) && !(player getVariable ["Escorting",false])) then {
					_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player); 
					_obj setPosATL ASLTOATL(visiblePositionASL player);
					[[player,"AinjPpneMstpSnonWnonDnon","playNow"],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;
					player attachTo [_obj,[0,0,0]];
					player setVariable["downedObj",_obj,true];
				};
			} else 
			{
				if(driver (vehicle player) == player) then {player action ["Eject",(vehicle player)]};
			};
			if ((_vehSource && _time == 16) || (!_vehSource && _time == 60)) then {_downed = false;};
		} else 
		{
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
	
	[[player,"AmovPpneMstpSnonWnonDnon","playNow"],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;
	if (!(player getVariable["Escorting",false]) && ((vehicle player) == player)) then {detach player; player setPosATL (getPosATL player);};
	
	life_isdowned = false;
	player setVariable["downed",false,true];
	disableUserInput false;
	sleep 1;
	disableUserInput false;
};