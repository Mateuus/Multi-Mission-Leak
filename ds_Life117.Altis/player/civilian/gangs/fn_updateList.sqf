/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Updates the gang members list
*/
//if(!isServer)exitwith{};//Till I fix this indexing issue, probably caused by no members of a gang being online
disableSerialization;
private["_gangInfo","_members","_dialog","_gangList","_textBox","_playerlist","_index","_gangName"];

_dialog = findDisplay 666672;
_gangList = _dialog displayCtrl 1500;

_index = lbCurSel _gangList;
_gangName = _gangList lbData _index;

_group = [_gangName] call DS_civ_getGroup;
if(isNull _group)exitwith{};//?? How??

_textBox = _dialog displayCtrl 1501;
_playerlist = "";;
{
	if((group _x) == _group)then
		{
		_playerlist = _playerlist + format ["%1<br/>",name _x];
		};
}forEach playableUnits;
_textBox ctrlSetStructuredText parseText format ["%1",_playerlist];

	

























