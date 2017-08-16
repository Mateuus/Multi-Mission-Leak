#include <macro.h>
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;

if(!(createDialog "life_give_item")) exitWith {hint "Fehlgeschlagen"};
[] call life_fnc_p_updateInv;
if(isNull _unit OR !isPlayer _unit) exitwith {};


