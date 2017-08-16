/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens and updates the gang options list menu
*/

private["_dialog","_gangList","_playerlist","_createBtn","_joinBtn","_closeBtn","_gangName","_noGangs","_members","_group","_playerListString","_gangMembers","_gangs"];

closeDialog 0;
sleep 0.2;
createDialog "gangMenuList";

disableSerialization;

_dialog = findDisplay 666672;
_gangList = _dialog displayCtrl 1500;
_playerlist = _dialog displayCtrl 1501;
_createBtn = _dialog displayCtrl 2400;
_joinBtn = _dialog displayCtrl 2401;
_closeBtn = _dialog displayCtrl 2402;
_gangName = "";
_noGangs = false;
_playerListString = "";
_gangMembers = [];
_gangs = false;

//Populate the gang list first
lbClear _gangList;
{
	if(!isNull (_x select 0))then
		{
		_gangName = _x select 1;
		_group = _x select 0;
			{
				if(group _x == _group)then
					{
					_playerListString = _playerListString + format ["%1<br/>",name _x];
					};
			}forEach playableUnits;
		_gangList lbAdd format ["%1",_gangName];
		_gangList lbSetData [(lbSize _gangList)-1,_gangName];
		_gangs = true;
		};
}forEach DS_gangList;

if(!_gangs)then
	{
	_gangList lbAdd "There are currently no gangs";
	_gangList lbSetData [(lbSize _gangList)-1,"There are currently no gangs"];
	};

_createBtn ctrlSetText "    Message Gang";
_createBtn buttonSetAction "[] spawn DS_civ_becomeLeader;";
_createBtn ctrlSetTooltip "Message all members of this gang";	

_joinBtn ctrlShow false;
/*
_joinBtn ctrlSetText "          Join";
_joinBtn buttonSetAction "[false] spawn DS_civ_gangJoin;";
_joinBtn ctrlSetTooltip "Join selected gang";	
*/
_closeBtn ctrlSetText "         Close";
_closeBtn buttonSetAction "closeDialog 0;";
_closeBtn ctrlSetTooltip "Close Menu";