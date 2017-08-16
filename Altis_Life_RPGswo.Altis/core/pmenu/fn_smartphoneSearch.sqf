#include "..\..\macros.hpp"
/*

	file: fn_smartphone.sqf
	Author: Taranis (Chris)

*/
private["_display","_allplayers"];
_editIDC = 88523;
_key = param[1,1,[1]];

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cEdit = _display displayCtrl _editIDC;
_text = ctrlText _editIDC;

if (_key isEqualTo 14) then
{
	_text = _text select [0,(count _text) - 1];
} else {
	if (count _text > 20) then
	{
		_text = _text select [0,20];
		(_display displayCtrl _editIDC) ctrlSetText _text;
	};
};

_allPlayers = [];
{
	if(alive _x && _x != player && (_x getVariable["realname",name _x] != "HC_1") ) then
	{
		_listName = format["%1 (%2)",getPlayerDName(_x),_x getVariable["playertype",""]];
		_player  = _x;

		_playerList = [];
		_playerList set[0,_listName];
		_playerList set[1,_player];
		_allPlayers pushBack _playerList;
	};
} foreach playableUnits;

_otherServer = [];
_allplayers = _allplayers + _otherServer;//Für später

_searchedPlayers = [];
if !(_text isEqualTo "") then
{
	{
		if ([_text,_x select 0] call BIS_fnc_inString) then
		{
			_searchedPlayers pushBack _x;
		};
	} forEach _allPlayers;
} else {
	_searchedPlayers = _allPlayers;
};

lbClear _cPlayerList;
{
	_player = _x select 1;
	_cPlayerList lbAdd (_x select 0);
	_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_player)];
} foreach _searchedPlayers;
