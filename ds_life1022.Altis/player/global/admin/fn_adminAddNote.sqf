/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Adds a note to a player or disables their global chats
*/

private ["_unit","_value","_filter","_note"];

if((DS_adminLevel != 1)&&(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

_value = ctrlText 1401;
_filter = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,.:;(){}[]|<>/\!^&*-_=+ ";

if(_value != "")then {
	if(_value == "chat")then {
		[true] remoteExecCall ["DS_fnc_adminUnlockKeysPlayer",_unit];
		hint "Player can no longer use help chat";
		_note = [format ["Had help chat disabled by %1",(name player)],_filter] call BIS_fnc_filterString;
		[(getPlayerUID _unit),"1",_note,(getPlayerUID player)] remoteExec ["HUNT_fnc_adminNotes",2];
	} else {
		_note = [format ["%1",_value],_filter] call BIS_fnc_filterString;
		[(getPlayerUID _unit),"1",_note,(getPlayerUID player)] remoteExec ["HUNT_fnc_adminNotes",2];
		hint format ["You have added a note to this player's profile\n\n\n%1",_value];
	};
} else {
	hint "You must enter text to add a note with";
};