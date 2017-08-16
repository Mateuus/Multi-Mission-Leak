/*
	File: fn_openSafe.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Try to open a bank safe.
*/

_explosive = [_this,3,false,[false]] call BIS_fnc_param;
_safe = cursorTarget;
if (life_action_in_use) exitWith {};

if ((typeOf _safe) != "Land_Research_house_V1_F" && (typeOf _safe) != "Land_Research_HQ_F") exitWith {};
if ((player distance _safe) > 15) exitWith {};
if (vehicle player != player) then {hint "You can't do this from within a vehicle."};
if (!([5, true] call life_fnc_policeRequired)) exitWith {};

_die = false;
if (!isNil "life_bank_lastRobbed") then
{
	if (life_bank_lastRobbed > (time - 2700)) exitWith {_die = true; hint format["Security is high due to a recent robbery and you cannot crack this safe.  Try again in %1 minute(s).", ceil ((life_bank_lastRobbed - (time - 2700))/60)]};
};
if (_die) exitWith {};

_locked = _safe getVariable ["life_locked", 1];
_inRange = false;
_doorPos = [0,0,0];
{
	if ((player distance _x) < 2) then { _doorPos = _x; _inRange = true; };
} forEach life_bank_safe_pos;

if (_locked != 1) exitWith {hint "This safe has already been unlocked.  You can open this door."};
if (!_inRange) exitWith {hint "You are not close enough to the safe door."};
if (_explosive && !(116 in life_talents)) exitWith {hint "You do not understand how to use a demo charge."};
if (_explosive) then
{
	if(!([false,"demoCharge",1] call life_fnc_handleInv)) exitWith {};
};

life_action_in_use = true;
_success=false;
_pos = getPos player;

if (!_explosive) then
{
	_upp = "Cracking vault locks...";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	while{true} do
	{
		if(animationState player != "acts_carfixingwheel") then {
			player playMoveNow "Acts_carFixingWheel";
			[[player,"Acts_carFixingWheel"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		};
		sleep 0.38;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {_success=true;};
		if(player distance _pos > 4) exitWith {};
		if(!alive player) exitWith {};
		if(speed player > 2) exitWith {};
		if (!life_action_in_use) exitWith {};
	};
	5 cutText ["","PLAIN"];
}
else
{
	_bomb = "GrenadeHand" createVehicle _doorPos;
	_bomb setPos _doorPos;
	[[player, "bombarm",30],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	sleep 5;
	_success = true;
};
life_action_in_use = false;

if (_success) then
{
	_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _safe) >> "numberOfDoors");
	_safe setVariable["life_locked", 0, true];
	for "_i" from 1 to _numDoors do
	{
		_safe setVariable[format["bis_disabled_Door_%1", _i], 0, true];
	};
	life_experience = life_experience + 25;
	hint "The safe has been cracked and is now unlocked.";
	if (!life_bank_inProgress) then
	{
		_chance = 1;
		if (_explosive && (117 in life_talents)) then { _chance = _chance + 1; };
		if ((floor random _chance) == 0) then {	[[player],"ASY_fnc_fedAlarm",false,false] spawn life_fnc_MP; };
	};
};