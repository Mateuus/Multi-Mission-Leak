/*
	I am so tired of writing this.
*/
private["_vault"];
_vault = _this select 0;
if(!(_vault getVariable["safe_open",false])) exitWith {["VaultLocked"] call life_fnc_notificationHandler;};
if!("ToolKit" in (items player)) exitWith {hintSilent "You need a Toolkit to repair the Safe!";};
life_action_inUse = true;
disableSerialization;
_title = "Repairing Safe";
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["%1...",_title];
_progress progressSetPosition 0.01;
_cP = 0.01;
_progressTime = (24 / (1 / 0.006));
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
life_action_inUse = false;
[false] call life_fnc_tufruxatra;
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};
if(vehicle player != player) exitWith {};
_vault setVariable["safe_open",false,true];
["VaultFix"] call life_fnc_notificationHandler;
