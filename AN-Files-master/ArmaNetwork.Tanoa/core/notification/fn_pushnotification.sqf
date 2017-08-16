/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

disableSerialization;
private _position = 0;
{
	private _control = _x select 0;
	private _controlArray = ctrlPosition _control;
	private _status = 0;
	private _change = (_x select 2) max (time + 2);

	if (_forEachIndex isEqualTo 0) then 
	{
		_position = 0.236 * safezoneH + safeZoneY;//0.022 * safezoneH + safeZoneY;
		_control ctrlSetFade 0;
	}
	else 
	{
		if (_forEachIndex > 5) then 
		{
			_control ctrlSetFade 1;
			_status = 1;
			_statusChangeAt = time + 2;
		};
	};
	_controlArray set [1, _position];
	_control ctrlSetPosition _controlArray;
	_control ctrlCommit 0.25;
	_position = _position + (_controlArray select 3) + (5 * pixelH);
	NotificationArray set [_forEachIndex, [_control, _status, _change]];
} forEach NotificationArray;