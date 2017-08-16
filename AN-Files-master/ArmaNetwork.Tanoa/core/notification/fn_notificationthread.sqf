/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

if (NotificationArray isEqualTo [] OR {count NotificationArray isEqualTo 0}) exitWith {};

disableSerialization;
if ((time - NotificationLastTick) >= 1) then
{
	{
		_x params [
			["_control",controlNull,[controlNull]],
			["_status",0,[0]],
			["_time",0,[0]]
		];

		if (isNull _control) exitWith {};

		if (time >= _time) then 
		{
			switch _status do 
			{
				case 0: 
				{
					private _controlArray = ctrlPosition _control;
					_controlArray set [1, (_controlArray select 1) + 10 * pixelH];
					_control ctrlSetPosition _controlArray;
					_control ctrlSetFade 1;
					_control ctrlCommit 0.3;
					NotificationArray set [_forEachIndex, [_control, 1, time + 1]];
				};
				case 1:
				{
					ctrlDelete _control;
					NotificationArray deleteAt _forEachIndex;
				};
				default {};
			};
		};
	} forEach NotificationArray;
	NotificationLastTick = time;
};