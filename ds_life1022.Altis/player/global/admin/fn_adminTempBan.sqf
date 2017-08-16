/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Temp bans a player (until server restart)
*/

private ["_unit","_value","_exit","_filter","_array","_remove","_action","_index","_note"];

if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminList1)))exitWith{closeDialog 0;};

if((lbCurSel 1500) isEqualTo -1)exitWith{hint "You did not select a player"};
_unit = lbData [1500,lbCurSel 1500];
_unit = missionNamespace getVariable _unit;
if((isNil "_unit")||(isNull _unit))exitWith{};

_value = ctrlText 1401;
_exit = false;

if(_value == "0")exitWith{hint "You have not entered a ban reason"};

_filter = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",",",".",":",";","(",")","{","}","[","]","|","<",">","/","\","!","^","&","*","-","_","=","+"," "];
_array = [_value] call DS_fnc_strToArray;

_remove = true;
{
	if(_x in _filter)exitWith {
		_remove = false;
	};
}forEach _array;

if(_remove)exitWith {
	_action = [
		"Are you sure you want to unban the player belonging to the UID entered into the text field?",
		"Unban",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;
	if(!_action)exitwith{_exit = true;};

	_index = DS_tempBans find _value;
	if(_index isEqualTo -1)exitWith{};

	DS_tempBans deleteAt _index;
	publicVariable "DS_tempBans";
};

if(_exit)exitWith{};

_action = [
	"Are you sure you want to ban this player until the next server restart?",
	"Temp Ban",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;
if(!_action)exitWith{};

if(_unit getVariable ["beingBanned",false])exitWith{hint "This player is currently already being banned";};

if(_value == "")then {_value = "No reason added"};

_note = format ["Temp Banned for (%1)",_value];

[_value] remoteExec ["DS_fnc_adminTempBanPlayer",_unit];
[(getPlayerUID _unit),"5",_note,(getPlayerUID player)] remoteExec ["HUNT_fnc_adminNotes",2];