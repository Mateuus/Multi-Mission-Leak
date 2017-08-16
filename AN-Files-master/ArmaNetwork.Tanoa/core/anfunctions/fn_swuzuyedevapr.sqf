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
if(!("AN_Bandage" in magazines player)) exitWith {};
	if((diag_tickTime - life_combat_lastTick) < 10) exitWith {hintSilent "You're currently in Combat";};
if (vehicle player != player) exitWith {hintSilent "You can't banadage yourself in a vehicle."};
_bleedRate = player getVariable "BleedRate";
if(_bleedRate isEqualTo 0) exitWith {hintSilent "Blood Levels extremely low!";};

life_action_inUse = true;
disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["Bandaging Self..."];
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
player removemagazine "AN_Bandage";
private _currentDmg = getdammage player;
private _newDmg = _currentDmg / 2;
player setdamage _newDmg;

_bleedRateNew = round(_bleedRate/2);
player setVariable ["BleedRate",_bleedRateNew,true];
if(_bleedRateNew < 5) then {player setVariable ["BleedRate",0,true];};

hintSilent "You successfully bandaged the wound!";
