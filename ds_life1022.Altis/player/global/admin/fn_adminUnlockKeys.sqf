/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Unlocks a player's keys, adds a note to them or disables their global chats
*/

private ["_unit"];

if((DS_adminLevel != 1)&&(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

[false] remoteExecCall ["DS_fnc_adminUnlockKeysPlayer",_unit];
hint format ["Unlocked %1's keys",(name _unit)];