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
if(_who == "") exitWith {};
if(isNil "DWEV_last_knock_out_time") then {DWEV_last_knock_out_time = 0;};
if ((DWEV_last_knock_out_time + 60) >= diag_ticktime) exitwith {};
DWEV_last_knock_out_time = diag_ticktime;
titleText[format["%1 hat dich bewusstlos geschlagen.",_who],"PLAIN"];
player playMoveNow "Incapacitated";
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
sleep 15;
player playMoveNow "amovppnemstpsraswrfldnon";
detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];
player setVariable["DWEV_knockout_block",TRUE,TRUE];
[] spawn
{
	uisleep 45;
	player setVariable["DWEV_knockout_block",False,TRUE];
};