#include <macro.h>
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;

if(!(createDialog "Life_key_management")) exitWith {hint "Fehlgeschlagen"};
if(isNull _unit OR !isPlayer _unit) exitwith {};


