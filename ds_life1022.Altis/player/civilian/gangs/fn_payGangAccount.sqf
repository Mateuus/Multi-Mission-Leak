/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Updates the gang members list
*/

private ["_base","_player","_amount"];

_player = player;
_base = 0;
_amount = _this select 0;

switch(true)do {
	case ((getPlayerUID _player) in DS_clanBase1): {_base = 1;};
	case ((getPlayerUID _player) in DS_clanBase2): {_base = 2;};
	case ((getPlayerUID _player) in DS_clanBase3): {_base = 3;};
	case ((getPlayerUID _player) in DS_clanBase4): {_base = 4;};
	case ((getPlayerUID _player) in DS_clanBase5): {_base = 5;};
	case ((getPlayerUID _player) in DS_clanBase6): {_base = 6;};
	case ((getPlayerUID _player) in DS_clanBase7): {_base = 7;};
	case ((getPlayerUID _player) in DS_clanBase8): {_base = 8;};
	case ((getPlayerUID _player) in DS_clanBase9): {_base = 9;};
	case ((getPlayerUID _player) in DS_clanBase10): {_base = 10;};
	case ((getPlayerUID _player) in DS_clanBase11): {_base = 11;};
	case ((getPlayerUID _player) in DS_clanBase12): {_base = 12;};
};

if(_base == 0)exitWith{};

[player,true,_amount,"added money",false,_base] remoteExec ["HUNT_fnc_gangMoney",2];