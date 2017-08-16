#include <macro.h>
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(EQUAL(_item,"")) exitWith {};
M_CONFIG(getNumber,"ANL_VItems",_item,"weight");