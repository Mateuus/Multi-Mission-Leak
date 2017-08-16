#include "..\script_macros.hpp"
/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the player he has received a bounty and gives him the Cash.
*/
private["_val","_total"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;
_total = [_this,1,"",["",0]] call BIS_fnc_param;

if(_val == _total) then {
	titleText[format[localize "STR_Cop_BountyRecieve",[_val] call ES_fnc_numberText],"PLAIN"];

	["Wantedfestnahme"] call ES_fnc_xp_add;

} else {
	titleText[format[localize "STR_Cop_BountyKill",[_val] call ES_fnc_numberText,[_total] call ES_fnc_numberText],"PLAIN"];

	["WantedKill"] call ES_fnc_xp_add;
	
};

ES_atmbank = ES_atmbank + _val;