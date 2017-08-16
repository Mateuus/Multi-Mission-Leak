/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Restrains target
*/
private ["_civ"];

_civ = cursorTarget;

if(isNull _civ) exitWith {};
if((_civ getVariable ["cuffed",false])) exitWith {};
if(side _civ == west) exitWith {};
if(player == _civ) exitWith {};
if(!isPlayer _civ) exitWith {};

_civ setVariable["cuffed",true,true];
[[player],"DS_fnc_restrained",_civ,false] spawn BIS_fnc_MP;
if(playerside == west)then
	{
	[[0,format["Officer %1 has restrained %2",profileName,(name _civ)]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	}
	else
	{
	[[0,format["Security Contractor %1 has restrained %2",profileName,(name _civ)]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
	};	
if(player getVariable ["security",false])then
	{
		{
			if(_x getVariable ["security",false])then
				{
				[[0,format["Security Contractor %1 has restrained %2",profileName,(name _civ)]],"DS_fnc_globalMessage",_x,false] spawn BIS_fnc_MP;
				};
		}forEach playableUnits;
	};




