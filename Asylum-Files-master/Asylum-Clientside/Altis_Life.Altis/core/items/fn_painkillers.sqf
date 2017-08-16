/*
		File: fn_painkillers.sqf
		Author: John "Paratus" VanderZwet
		
		Description: Removes pain effects
*/

_unit = cursorTarget;
_target = [_this,3,objNull,[objNull]] call BIS_fnc_param; // index 3 due to addAction
if (_target == player) then { _unit = player; };

if (isNull _unit) exitWith {};

if (!(playerSide == west && life_coprole in ["medic","all"] && (26 in life_coptalents)) && !(playerSide == west && life_coprole in ["detective","all"] && (45 in life_coptalents))) then { if(!([false,"painkillers",1] call life_fnc_handleInv)) exitWith {}; };

if (_unit == player) then
{
	[0] spawn life_fnc_setPain;
	titleText["You consume pain killers.","PLAIN"];
}
else
{
	[[0],"life_fnc_setPain",_unit,false] spawn life_fnc_MP;
	titleText[format["You feed painkillers to %1.", name _unit],"PLAIN"];
	if (playerSide == independent) then { life_experience = life_experience + 5; };
	if (playerSide == west && life_coprole in ["all","medic","detective"] && player != _unit) then { [50] spawn life_fnc_earnPrestige; };
};