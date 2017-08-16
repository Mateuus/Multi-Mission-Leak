/*
Punches balls
Modified fn_knockedOut.sqf by Tonic
By: [HAL]Dr. Dank

*/

private["_target","_who","_obj"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};

titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player playMoveNow "AcinPercMstpSnonWnonDnon_agony";
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
sleep 15;
player playMoveNow "AcinPercMstpSnonWnonDnon_agony";
detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];