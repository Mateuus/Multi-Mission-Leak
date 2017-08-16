/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Kicks the selected player from the gang
*/

disableSerialization;

private _dialog = findDisplay 666674;
private _playerList = _dialog displayCtrl 1500;
private _index = lbCurSel _playerList;
private _player = _playerList lbData _index;

private _badName = [((group player) getVariable ["gangName",""])] call DS_civ_confirmClanName;
if(_badName)exitwith {
	hint "You can not kick from this gang as you are not in the clan that owns the name";
};

hint "You have kicked this player from your gang";
[] remoteExecCall ["DS_civ_gangKickPlayer",_player];

closeDialog 0;
[] spawn DS_civ_menuGangMain;