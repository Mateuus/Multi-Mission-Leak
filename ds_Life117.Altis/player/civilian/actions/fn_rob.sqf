/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Robs your target
*/
private["_victim"];
_victim = cursorTarget;

//Error checks
if(isNull _victim) exitWith {};
if(!isPlayer _victim) exitWith {};
if((group player) == (group _victim))exitwith{};
if(_victim getVariable["robbed",false]) exitWith {};
[[player],"DS_fnc_robbed",_victim,false] spawn BIS_fnc_MP;
_victim setVariable["robbed",TRUE,TRUE];
["211"] spawn DS_fnc_addCharge;
[10,false] spawn DS_fnc_moralAlter;
if((DS_infoArray select 15) == 6)then
	{
	[1] call DS_fnc_questCompleted;
	};
if(((side _victim) == west)&&((DS_infoArray select 15) == 15))then
	{
	[1] call DS_fnc_questCompleted;
	};