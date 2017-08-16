/*
	Autor: Taranis (Chris)
	Script: fn_openLotto.sqf

	Parameter:
		keine
*/
private["_nums","_name","_idc"];
params [["_num",-1,[0]]];
disableSerialization;

_price = 30000;
_display = findDisplay 52500;

if (_num == -1) exitWith {systemChat "Keine Zahl übergeben."};

_nums = (lottoDialog select 0);
_numCount = (count _nums);

[_num] call DWEV_fnc_lottoBill;

if (_numCount <= 4 ) then
{
	_nums pushBack _num;
} 
else 
{
	//_delete = _nums select 0;
	//_array = _nums - [_delete];
	_array = _nums deleteAt 0;
	_array pushBack _num;
	lottoDialog set[0,_array];
};
