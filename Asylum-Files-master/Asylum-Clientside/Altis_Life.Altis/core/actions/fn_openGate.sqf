/*
	File: fn_openGate.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Try to open a bank gate.
*/

_die = false; 
if (!isNil "life_bank_lastRobbed") then
{
	if (life_bank_lastRobbed > (time - 600)) exitWith {_die = true; hint format["Security is high due to a recent robbery and you cannot open this gate.  Try again in %1 minute(s).", ceil ((life_bank_lastRobbed - (time - 600))/60)]};
};
if (_die) exitWith {};
if(playerSide != west && life_inv_boltcutter < 1) exitWith {hint "You need a boltcutter to do this."};
_gate = nearestObject [player, "Land_BarGate_F"];
if (isNull _gate) exitWith {systemChat "No gate nearby."};
if (vehicle player != player) exitWith {hint "You can't do this from within a vehicle."};
if (life_action_in_use) exitWith {};

life_action_in_use = true;

_delay = 0.18;
if (43 in life_talents || 200 in life_talents) then { _delay = 0.07; };
_pos = getPos player;

_upp = "Unlocking...";
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
if (120 in life_talents) then { _cP = 0.99 };
animRepeat = true;
[] spawn {
	while{animRepeat} do {
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1"};
		sleep 1;
	};
};
while{true} do
{
	sleep _delay;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true;};
	if(player distance _pos > 3) exitWith {};
	if(!alive player) exitWith {};
	if(speed player > 2) exitWith {};
	if (!life_action_in_use) exitWith {};
};
animRepeat = false;
5 cutText ["","PLAIN"];
life_action_in_use = false;

if (_success) then
{
	_max = 0.3;
	if (43 in life_talents || 120 in life_talents || playerSide == west) then { _max = 1; };
	_gate setVariable ["gate_max", _max, true];
	hint "The gate is now unlocked.";
	if (!life_bank_inProgress && playerSide != west) then
	{
		_chance = 1;
		if (43 in life_talents) then { _chance = _chance + 1; };
		if ((floor random _chance) == 0) then {	[[player],"ASY_fnc_fedAlarm",false,false] spawn life_fnc_MP; };
	};
};