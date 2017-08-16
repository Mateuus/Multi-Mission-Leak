_mode = _this select 0;
_info = [_this,1,-1] call BIS_fnc_param;

switch (_mode) do
{
	case 0:
	{
		AS_actions = _info;
	};
	case 1:
	{
		AS_level = _info;AS_received = true;
	};
	case 2:
	{
		compte_banque  = compte_banque + _info;
		hint format ["Un admin vous a remboursé %1€",_info];
	};
	case 3:
	{
		disableSerialization;
		_listboxPlayers = (findDisplay 16000) displayCtrl 16001;
		_player = call compileFinal (_listboxPlayers lbData (lbCurSel _listboxPlayers));
		hint parseText format ["NOM : %1<br/>ARME : %2<br/>%3<br/>DEGAT : %4<br/>",name _player, currentWeapon _player, getPos _player, damage _player];
	};
};