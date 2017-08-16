/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private [];
if(!("AN_Tourniquet" in magazines player)) exitWith {};
if (vehicle player != player) exitWith {hintSilent "You can't help someone from within a vehicle."};
_bleedRate = player getVariable "BleedRate";
if(_bleedRate isEqualTo 0) exitWith {};

life_action_inUse = true;
disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["Applying Tourniquet..."];
_anim = ["medic"] call life_fnc_yufanuyaw;
_progressTime = (10 / (1 / 0.006));
for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
	_progress progressSetPosition _i;
	sleep _progressTime;
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
if(!alive player) exitWith {};
if(player getVariable["restrained",false]) exitWith {};
if(life_istazed) exitWith {};
	if(player != vehicle player) exitWith {};
player removemagazine "AN_Tourniquet";
player setVariable ["BleedRate",0,true];
hintSilent "You successfully applied the Tourniquet!";
