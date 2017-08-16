/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens and updates the main gang menu (Menu you see when you are in a gang)
*/

private["_leaderButton","_dialog","_gangList","_playerlist","_unlockBtn","_kickBtn","_closeBtn","_gangName","_leaveBtn","_members","_group","_gangAreas","_gangMembers","_title","_areasHeld","_gang"];

closeDialog 0;

createDialog "gangMenuMain";

disableSerialization;

_dialog = findDisplay 666674;
_playerlist = _dialog displayCtrl 1500;
_unlockBtn = _dialog displayCtrl 2400;
_kickBtn = _dialog displayCtrl 2401;
_leaveBtn = _dialog displayCtrl 2403;
_closeBtn = _dialog displayCtrl 2402;
_leaderButton = _dialog displayCtrl 2407;
_title = _dialog displayCtrl 1100; 
_areasHeld = _dialog displayCtrl 1101;
_gangName = "";
//Add members to the listbox
lbClear _playerlist;
{
		_playerlist lbAdd format["%1",(_x getVariable["name",name _x])];
		_playerlist lbSetData [(lbSize _playerlist)-1,str(_x)];
} foreach (units (group player));
//Gang Title

_title ctrlSetStructuredText parseText format ["<t size='1' color='#848484'>%1</t>",(group player) getVariable "gangName"];
//Disabled till set Up
_gangAreas = []call DS_civ_returnAreas;
if((_gangAreas select 1) isEqualTo "No Hideouts currently held")then
	{
	_gangAreas = "No areas Held";
	}
	else
	{
	_gangAreas = (_gangAreas select 1);
	};
_areasHeld ctrlSetStructuredText parseText format ["<t size='1' color='#848484'>%1</t>",_gangAreas];

_unlockBtn ctrlSetText "            Lock/Unlock";
_unlockBtn buttonSetAction "[] spawn DS_civ_gangLock;";
_unlockBtn ctrlSetTooltip "Unlock or lock your gang to allow or prevent people from joining it";	

_kickBtn ctrlSetText "             Kick Player";
_kickBtn buttonSetAction "[] spawn DS_civ_gangKick;";
_kickBtn ctrlSetTooltip "Kick the selected player from your gang, when the last player is kicked the gang is disbanded";	

_leaveBtn ctrlSetText "                 Leave";
_leaveBtn buttonSetAction "[] spawn DS_civ_gangLeave;";
_leaveBtn ctrlSetTooltip "Leave the gang";

_leaderButton ctrlSetText "            Gang Options";
_leaderButton buttonSetAction "[] spawn DS_civ_gangGiveLeader;";
_leaderButton ctrlSetTooltip "Give leadership to the selected member";

_closeBtn ctrlSetText "                 Close";
_closeBtn buttonSetAction "closeDialog 0;";
_closeBtn ctrlSetTooltip "Close Menu";