/*
	File: fn_openVault.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Try to open a bank vault.
*/

_die = false; 
if (!isNil "life_bank_lastRobbed") then
{
	if (life_bank_lastRobbed > (time - 2700)) exitWith {_die = true; hint format["Security is high due to a recent robbery and you cannot hack this vault.  Try again in %1 minute(s).", ceil ((life_bank_lastRobbed - (time - 2700))/60)]};
};
if (!([5, true] call life_fnc_policeRequired)) exitWith {};
if (_die) exitWith {};

_vault = nearestObjects [player, ["Land_Dome_Big_F","Land_Dome_Small_F"], 30];
if (count _vault == 0) exitWith {systemChat "Failed to find a vault door nearby."};
if (life_action_in_use) exitWith {};
_vault = _vault select 0;
_locked = _vault getVariable ["life_locked", 1];
_doors = ["vault_hack_1","vault_hack_2","vault_hack_3","vault_hack_4","vault_hack_5","vault_hack_6","vault_hack_7"];
_inRange = false;
{
	if ((player distance (getMarkerPos _x)) < 3) then { _inRange = true; };
} forEach _doors;

if (vehicle player != player) then {hint "You can't do this from within a vehicle."};
if (_locked != 1) exitWith {hint "This vault has already been unlocked.  You can open this door."};
if (!_inRange) exitWith {hint "You must hack the vault from the electrical panel near the side door."};

life_action_in_use = true;

_delay = 1;
if (115 in life_talents) then { _delay = .7; };
_pos = getPos player;

_upp = "Hacking vault security locks...";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_success=false;
while{true} do
{
	if(animationState player != "acts_carfixingwheel") then {
		player playMoveNow "Acts_carFixingWheel";
		[[player,"Acts_carFixingWheel"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	};
	sleep _delay;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true;};
	if(player distance _pos > 6) exitWith {};
	if(!alive player) exitWith {};
	if(speed player > 2) exitWith {};
	if (!life_action_in_use) exitWith {};
};
5 cutText ["","PLAIN"];
life_action_in_use = false;

if (_success) then
{
	_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _vault) >> "numberOfDoors");
	_vault setVariable["life_locked", 0, true];
	for "_i" from 1 to _numDoors do
	{
		_vault setVariable[format["bis_disabled_Door_%1", _i], 0, true];
	};
	life_experience = life_experience + 50;
	hint "The vault doors have been hacked, and are now unlocked.";
	if (!life_bank_inProgress) then
	{
		_chance = 2;
		if (119 in life_talents) then { _chance = _chance + 1; };
		if ((floor random _chance) == 0) then {	[[player],"ASY_fnc_fedAlarm",false,false] spawn life_fnc_MP; };
	};
};