/*
	File: fn_untie.sqf
*/
private["_unit"];
_unit = cursorTarget;

if((life_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith { 
["Nie mozesz tego zrobic.", false] spawn domsg;
titleFadeOut 5;
}; 

if(isNull _unit || !(_unit getVariable ["gagged", false])) exitWith {};

_unit setVariable["gagged", nil, true];
_unit setVariable ["tf_voiceVolume", 1, true];