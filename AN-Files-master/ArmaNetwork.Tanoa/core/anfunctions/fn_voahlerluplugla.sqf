#include <macro.h>
/*
	ArmA.Network
	Author: Rathbone
	Copyright (c) ArmA.Network 2015 - 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private _packet = [player,getPlayerUID player,(profileName),an_cash,an_bank];

private _playTime = round ((diag_tickTime - life_playTime) / 60);
_packet pushBack _playTime;
life_playTime = diag_tickTime;

life_gear = [] call life_fnc_hewudefr;
_packet pushBack life_gear;

switch playerSide do
{
	case west:
	{
		_packet remoteExecCall ["life_fnc_finalCopRequest",2];
	};
	case independent:
	{
		_packet remoteExecCall ["life_fnc_finalEMSRequest",2];
	};
	case civilian:
	{
		private _array = [];
		private _arraySkill = [];
		if !((count AN_Licenses) isEqualTo 0) then
		{
			{
				private _number = [_x,false] call life_fnc_licenseConvert;
				_array pushBack _number;
			} forEach AN_Licenses;
		};
		_packet pushBack _array;
		_packet pushBack LEVEL;
		_packet pushBack EXP;
		if !((count AN_Skills) isEqualTo 0) then
		{
			{
				private _number = [_x,false] call life_fnc_skillsConvert;
				_arraySkill pushBack _number;
			} forEach AN_Skills;
		};
		_packet pushBack _arraySkill;
		_packet pushBack SKILLPOINT;
		_packet remoteExecCall ["life_fnc_finalCivRequest",2];
	};
};
