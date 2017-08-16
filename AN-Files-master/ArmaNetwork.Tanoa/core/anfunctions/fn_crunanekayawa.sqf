/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_vault = param [0,objNull,[objNull]];
if!("ToolKit" in (items player)) exitWith {hintSilent "You need a Toolkit to defuse the Explosive Device!";};
if(_vault getVariable ["safe_open",false]) exitWith {hintSilent "Too late!!!!";};
if(!(_vault getVariable ["charge_placed",false])) exitWith {hintSilent "No Explosive Device has been placed here";};
if(count attachedObjects _vault isEqualTo 0) exitWith {hintSilent "No Explosive Device has been placed here";};
life_action_inUse = true;
disableSerialization;
_title = "Defusing Explosive Device";
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["%1...",_title];
_progress progressSetPosition 0.01;
_cP = 0.01;
_progressTime = (12 / (1 / 0.006));
_anim = ["medic"] call life_fnc_yufanuyaw;
for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do
{
  _progress progressSetPosition _i;
  sleep _progressTime;
  if(!alive player) exitWith {};
  if(vehicle player != player) exitWith {};
  if(life_interrupted) exitWith {};
};
terminate _anim;
player playActionNow "stop";
[false] call life_fnc_tufruxatra;
life_action_inUse = false;
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};
if(vehicle player != player) exitWith {};
{
  detach _x;
  deleteVehicle _x
} forEach attachedObjects fed_bank;
_vault setVariable ["charge_placed",false,true];
["VaultDefused"] remoteExecCall ["life_fnc_drath",-2];
