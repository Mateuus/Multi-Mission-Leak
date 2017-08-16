#include <macro.h>

/*
	File: fn_escortAction.sqf
*/
private "_unit";
_unit = param [0,objNull,[objNull]];
if(isNil "_unit" OR {isNull _unit} OR {!isPlayer _unit}) exitWith {};
if(!(side _unit in [civilian,independent,west])) exitWith {};
if(player distance _unit > 3) exitWith {};
hintSilent "Use Windowskey to automatically stop escorting";	
_unit attachTo [player,[0.1,1.1,0]];
_unit SVAR ["transporting",false,true];
_unit SVAR ["Escorting",true,true];
life_escortTarget = _unit;
player reveal _unit;
