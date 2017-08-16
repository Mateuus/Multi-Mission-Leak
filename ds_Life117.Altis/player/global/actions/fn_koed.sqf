/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Knocks this person out
*/
private["_victim","_meanie","_obj"];
_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_meanie = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _victim) exitWith {};
if(_victim != player) exitWith {};
if(_meanie == "") exitWith {};
[[player,"punch_break"],"DS_fnc_playSounds"] spawn DS_fnc_MP;
titleText[format["%1 has knocked you out.",_meanie],"PLAIN"];
player setVariable ["surrender", true, true];
player playMoveNow "Incapacitated";
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
sleep 15;
player playMoveNow "amovppnemstpsraswrfldnon";
detach player;
deleteVehicle _obj;
player setVariable["robbed",FALSE,TRUE];
player setVariable ["surrender", false, true];