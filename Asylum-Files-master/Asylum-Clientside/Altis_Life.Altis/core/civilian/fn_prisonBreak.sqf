/*
	File: fn_prisonBreak.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initiate a prison break.
*/

_jailID = [_this,3,1,[1]] call BIS_fnc_param;
_unit = _this select 0;

if ((currentWeapon player) in ["","Binocular"]) exitWith { hint "The prison guards aren't very intimidated by unarmed citizens."};
if (time - life_lastPrison < 2700) exitWith { hint "This prison is on lockdown.  Try again in a few minutes."; };
if (!([3] call life_fnc_policeRequired)) exitWith {};

life_lastPrison = time;
publicVariable "life_lastPrison";

serv_killed = [player,"901B"];
publicVariableServer "serv_killed";

[[0,2], "You have initiated a prison break and are now wanted for it!"] call life_fnc_broadcast;

[[player,_jailID,_unit],"life_fnc_startPrisonBreak",false,false] spawn life_fnc_MP;