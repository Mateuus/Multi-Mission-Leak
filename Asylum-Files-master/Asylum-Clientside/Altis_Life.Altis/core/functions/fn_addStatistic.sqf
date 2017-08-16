/*
	File: fn_addStatistic.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Incriments a statistic
*/
private ["_index","_add","_name"];

_index = [_this,0,0,[0]] call BIS_fnc_param;
_add = [_this,1,0,[0]] call BIS_fnc_param;

if (isNil {life_statistics select _index}) then { life_statistics set [_index, 0]; };

life_statistics set[_index, (life_statistics select _index) + _add];

if (_index in [2,6] && life_gang != "0" && _add > 0) then
{
	_exp = if (_index == 6) then { 20 } else { _add };
	[[player,life_gang,_exp],"ASY_fnc_addGangExp",false,false] spawn life_fnc_MP;
};

_name = switch (_index) do
{
	case 0: { "war kills" };
	case 1: { "war deaths" };
	case 2: { "war rating" };
	case 3: { "police arrests" };
	case 4: { "bounty arrests" };
	case 5: { "war points" };
	case 6: { "APB evades" };
	default { "something" };
};

systemChat format ["Your statistic for %1 has changed by %2 to %3!", _name, _add, life_statistics select _index];

if (_index < 3) then // No need to bother people about minor things like arrests
{
	if (_add < 0) then { ["StatLoss",[format["%1 decreased by %2", toUpper _name, abs _add]]] call bis_fnc_showNotification; }
	else { if (_add > 0) then { ["StatGain",[format["%1 increased by %2", toUpper _name, _add]]] call bis_fnc_showNotification; }; };
};

if (_index == 2) then // Increase global if index is war points
{
	if (isNil {life_statistics select 3}) then { life_statistics set [3, 0]; };
	life_statistics set[3, (life_statistics select 3) + _add];
	player setVariable["season", life_statistics select 2, true];
};

[] call life_fnc_achievementScan;