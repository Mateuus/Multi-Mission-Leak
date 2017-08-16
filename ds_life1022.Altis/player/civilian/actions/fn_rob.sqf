/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Robs your target
*/

private["_victim"];
_victim = cursorTarget;

if(((player inArea "safezone")||(player inArea "safezone_1"))&&(playerSide isEqualTo civilian))exitwith{hint "You cant rob somebody in a safezone";};

//Error checks
if(isNull _victim) exitWith {};
if(!isPlayer _victim) exitWith {};
if((group player) == (group _victim))exitwith{};
if(_victim getVariable["robbed",false]) exitWith {};
[player] remoteExecCall ["DS_fnc_robbed",_victim];
_victim setVariable["robbed",TRUE,TRUE];
["211"] spawn DS_fnc_addCharge;
[10,false] spawn DS_fnc_moralAlter;
if((DS_infoArray select 15) == 6)then { [1] call DS_fnc_questCompleted };
if(((DS_infoArray select 15) == 16)&&((side cursorTarget) isEqualTo west))then { [1] call DS_fnc_questCompleted };