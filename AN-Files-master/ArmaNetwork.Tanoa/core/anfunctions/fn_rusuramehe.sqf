/*
	File: fn_rusuramehe.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
params [
	["_val","",["",0]],
	["_total","",["",0]]
];
if(_val isEqualTo _total) then {
	titleText[format[localize "STR_Cop_BountyRecieve",[_val] call life_fnc_rupadudejat],"PLAIN"];
} else {
	titleText[format[localize "STR_Cop_BountyKill",[_val] call life_fnc_rupadudejat,[_total] call life_fnc_rupadudejat],"PLAIN"];
};
[_val,1,0] call life_fnc_sewawruk;
