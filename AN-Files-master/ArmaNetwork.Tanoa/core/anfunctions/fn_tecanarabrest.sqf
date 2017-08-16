/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
if(!("AN_Bloodbag" in magazines player)) exitWith {hintSilent "You don't have any Bloodbags on you!";};
if (vehicle player != player) exitWith { hintSilent "You can't help someone from within a vehicle." };
_bloodValue = player getVariable ["BloodLevel",0];
if(_bloodValue > 3000) exitWith {};

disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format ["Transfusing Blood..."];
_waitTime = (12 / (1 / 0.006));
_anim = ["injectionself"] call life_fnc_yufanuyaw;
for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
	_progress progressSetPosition _i;
	sleep _waitTime;
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
	if(life_istazed) exitWith {};
	if(player getVariable["restrained",false]) exitWith {};
};
life_action_inUse = false;
terminate _anim;
player playMoveNow "stop";
[false] call life_fnc_tufruxatra;
if(life_interrupted) exitWith {life_interrupted = false;};
if(life_istazed) exitWith {};
	if(player != vehicle player) exitWith {};
if(player getVariable["restrained",false]) exitWith {};
if(!alive player) exitWith {};
player removemagazine "AN_BloodBag";
player setVariable ["BloodLevel",5500,true];
hintSilent "You've successfully transfused blood.";;
