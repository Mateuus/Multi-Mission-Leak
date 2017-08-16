/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Uses zipties
*/

private ["_unit","_targets"];

_unit = cursorTarget;

if(isNull _unit)exitWith{};
if(player distance _unit > 4)exitWith{};
if((_unit getVariable ["restrained",false])||(_unit getVariable ["escorted",false]))exitWith{};
if((player getVariable ["restrained",false])||(player getVariable ["escorted",false]))exitWith{};
if(player isEqualTo _unit)exitWith{};
if(DS_item_ziptie <= 0)exitWith{hint "You do not have any zipties"};
if(!DSL_rebel)exitWith{hint "You need rebel training to use these"};
if(((player inArea "safezone")||(player inArea "safezone_1"))&&(playerSide isEqualTo civilian))exitWith{hint "You can't ziptie somebody in a safezone";};

["ziptie",false,1] call DS_fnc_handleInventory;

_unit setVariable ["restrained",true,true];
_unit setVariable ["restrainer",player,true];
_unit setVariable ["surrender",false,true];

[1,player] remoteExec ["DS_fnc_restrained",_unit];

_targets = allPlayers select {(_x distance player) < 50};
[player,"zip"] remoteExecCall ["DS_fnc_playSounds",_targets];

[4,false] spawn DS_fnc_moralAlter;

titleText ["Warning - Killing someone who is restrained will remove 20% from your bank account","PLAIN"];
hint "Warning - Killing someone who is restrained will remove 20% from your bank account";
systemChat "Warning - Killing someone who is restrained will remove 20% from your bank account";

if((DS_infoArray select 17) == 6)then{[2] call DS_fnc_questCompleted};
if(((side _unit) isEqualTo west)&&((DS_infoArray select 17) == 14))then{[2] call DS_fnc_questCompleted};