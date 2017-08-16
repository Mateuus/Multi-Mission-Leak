/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorObject;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {};
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {hintSilent localize "STR_ISTR_Lock_AlreadyHave"};
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true;

disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format["%1...",_title];
_anim = ["medic"] call life_fnc_yufanuyaw;
_progressTime = (30 / (1 / 0.006));
[_curTarget, "caralarm",500] remoteExecCall ["life_fnc_quvucamaph",-2];
for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
  _progress progressSetPosition _i;
  sleep _progressTime;
  if(!alive player) exitWith {};
  if(player != vehicle player) exitWith {};
	if(player distance _curTarget > _distance) exitWith {};
  if(life_interrupted) exitWith {};
  if(life_istazed) exitWith {};
};
[false] call life_fnc_tufruxatra;
terminate _anim;
player playActionNow "stop";
life_action_inUse = false;
if(!alive player OR life_istazed) exitWith {};
if((player getVariable["restrained",false])) exitWith {};
if((animationState player isEqualTo "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon")) exitWith {};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(!(["lockpick",1] call life_fnc_virtualItemRemove)) exitWith {life_action_inUse = false;};

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice < 10) then {
		[_curTarget,0] remoteExecCall ["life_fnc_lockVehicle",_curTarget];
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		[_curTarget, "caralarm",500] remoteExecCall ["life_fnc_quvucamaph",-2];
	} else {
		[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]] remoteExecCall ["life_fnc_brusathusek",west];
		titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
	};
};
