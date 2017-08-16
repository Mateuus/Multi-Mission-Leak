/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Kicks the selected player from the gang
*/

disableSerialization;
private["_dialog","_playerlist","_index","_player","_gang","_action","_uid","_gangLeader"];

_dialog = findDisplay 666674;
_playerlist = _dialog displayCtrl 1500;
_index = lbCurSel _playerlist;
_player = _playerList lbData _index;

hint "You have kicked this player from your gang";
//if((getPlayerUID player) != ((group player) getVariable "gangLeader"))exitwith{hint "Only the gang leader can kick players from a gang"};
[[],"DS_civ_gangKickPlayer",_player,false] spawn BIS_fnc_MP;
closeDialog 0;
[]spawn DS_civ_menuGangMain;