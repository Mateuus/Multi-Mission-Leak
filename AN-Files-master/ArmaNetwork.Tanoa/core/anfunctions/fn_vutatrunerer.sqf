/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj"];
_target = param [0,ObjNull,[ObjNull]];
_who = param [1,"",[""]];
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who isEqualTo "") exitWith {};

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player setvariable["out",true,true];
(finddisplay 49) closedisplay 1;
player playMoveNow "Incapacitated";
[player,"punch",10] remoteExecCall ["life_fnc_quvucamaph",-2];
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
player setVariable ["tf_voiceVolume", 0, true];
player setVariable ["tf_unable_to_use_radio", true];
titleText ["You've been knocked out", "BLACK OUT", 0.5];
disableUserInput true;
while {dialog} do
{
  closeDialog 0;
};
sleep 7;
player playMoveNow "amovppnemstpsraswrfldnon";
disableUserInput false;
player setVariable ["tf_voiceVolume", 1, true];
player setVariable ["tf_unable_to_use_radio", false];
titleText ["My head hurts", "BLACK IN", 10];
detach player;
deleteVehicle _obj;
player setVariable["robbed",false,true];
[] spawn {
  sleep 15;
  player setvariable["out",false,true];
};
