/*
	File: fn_addPrestige.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Add distributed prestige.
*/

private ["_unit","_amount","_full"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_amount = [_this,1,0,[0]] call BIS_fnc_param;
_full = [_this,2,false,[false]] call BIS_fnc_param;

if (isNull _unit) exitWith {};
if (playerSide != west) exitWith {};
if (!life_precinct && life_coplevel < 6) exitWith {};
if (_unit == player && !_full) exitWith {};

if (!_full) then
{
	_amount = switch (life_coplevel) do
	{
		case 6: { _amount * .2 };
		case 5: { _amount * .1 };
		case 4: { _amount * .06 };
		case 3: { _amount * .04 };
	};
	
	systemChat format["You've earned %1 prestige for the actions of %2.", _amount, name _unit];
}
else
{
	systemChat format["You've earned %1 prestige.", _amount];
};

life_prestige = life_prestige + _amount;