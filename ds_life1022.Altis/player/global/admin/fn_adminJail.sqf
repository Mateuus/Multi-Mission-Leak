/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sends a player to jail or releases them
*/

private ["_unit"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

if(_unit getVariable ["jailed",false])then {
    [] spawn DS_fnc_adminJailRelease;
} else {
    [] spawn DS_fnc_adminJailSend;
};