/*
	File: fn_useCocaine.sqf
	@Deo
	
	Description:
	Cocaine Effect
*/

#include <macro.h>

player setVariable["intoxicated",true,true];
[0,format["%1 czuje euforie po kokainie!.",name player]] remoteExecCall ["life_fnc_broadcast", -2];
for "_i" from 0 to 400 do
{
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [round ((1+(life_intox-.1))^10)];
	"dynamicBlur" ppEffectCommit 1;
	uiSleep 0.02;
};
"dynamicBlur" ppEffectEnable false;
if(life_intox <= 0.08) then {player setVariable["intoxicated",false,true];};